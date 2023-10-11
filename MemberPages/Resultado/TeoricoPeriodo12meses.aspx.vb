Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Resultado_Teorico12Meses
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

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

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then

            m1_vlrRev = 0
            m1_percRev = 0
            m1_vlrRea = 0
            m1_percRea = 0
            m1_vlrMxR = 0
            m1_percMxR = 0

            m2_vlrRev = 0
            m2_percRev = 0
            m2_vlrRea = 0
            m2_percRea = 0
            m2_vlrMxR = 0
            m2_percMxR = 0

            m3_vlrRev = 0
            m3_percRev = 0
            m3_vlrRea = 0
            m3_percRea = 0
            m3_vlrMxR = 0
            m3_percMxR = 0

            m4_vlrRev = 0
            m4_percRev = 0
            m4_vlrRea = 0
            m4_percRea = 0
            m4_vlrMxR = 0
            m4_percMxR = 0

            m5_vlrRev = 0
            m5_percRev = 0
            m5_vlrRea = 0
            m5_percRea = 0
            m5_vlrMxR = 0
            m5_percMxR = 0

            m6_vlrRev = 0
            m6_percRev = 0
            m6_vlrRea = 0
            m6_percRea = 0
            m6_vlrMxR = 0
            m6_percMxR = 0

            m7_vlrRev = 0
            m7_percRev = 0
            m7_vlrRea = 0
            m7_percRea = 0
            m7_vlrMxR = 0
            m7_percMxR = 0

            m8_vlrRev = 0
            m8_percRev = 0
            m8_vlrRea = 0
            m8_percRea = 0
            m8_vlrMxR = 0
            m8_percMxR = 0

            m9_vlrRev = 0
            m9_percRev = 0
            m9_vlrRea = 0
            m9_percRea = 0
            m9_vlrMxR = 0
            m9_percMxR = 0

            m10_vlrRev = 0
            m10_percRev = 0
            m10_vlrRea = 0
            m10_percRea = 0
            m10_vlrMxR = 0
            m10_percMxR = 0

            m11_vlrRev = 0
            m11_percRev = 0
            m11_vlrRea = 0
            m11_percRea = 0
            m11_vlrMxR = 0
            m11_percMxR = 0

            m12_vlrRev = 0
            m12_percRev = 0
            m12_vlrRea = 0
            m12_percRea = 0
            m12_vlrMxR = 0
            m12_percMxR = 0

            p1_vlrRev = 0
            p1_percRev = 0
            p1_vlrRea = 0
            p1_percRea = 0
            p1_vlrMxR = 0
            p1_percMxR = 0

            p2_vlrRev = 0
            p2_percRev = 0
            p2_vlrRea = 0
            p2_percRea = 0
            p2_vlrMxR = 0
            p2_percMxR = 0

            p3_vlrRev = 0
            p3_percRev = 0
            p3_vlrRea = 0
            p3_percRea = 0
            p3_vlrMxR = 0
            p3_percMxR = 0

            p4_vlrRev = 0
            p4_percRev = 0
            p4_vlrRea = 0
            p4_percRea = 0
            p4_vlrMxR = 0
            p4_percMxR = 0

            an_vlrRev = 0
            an_percRev = 0
            an_vlrRea = 0
            an_percRea = 0
            an_vlrMxR = 0
            an_percMxR = 0

            ac_vlrRev = 0
            ac_percRev = 0
            ac_vlrRea = 0
            ac_percRea = 0
            ac_vlrMxR = 0
            ac_percMxR = 0

            acAA_vlrRea = 0
            acAA_percRea = 0

            m1_vlrOri = 0
            m2_vlrOri = 0
            m3_vlrOri = 0
            m4_vlrOri = 0
            m5_vlrOri = 0
            m6_vlrOri = 0
            m7_vlrOri = 0
            m8_vlrOri = 0
            m9_vlrOri = 0
            m10_vlrOri = 0
            m11_vlrOri = 0
            m12_vlrOri = 0
            p1_vlrOri = 0
            p2_vlrOri = 0
            p3_vlrOri = 0
            an_vlrOri = 0
            ac_vlrOri = 0

            m1_percOri = 0
            m2_percOri = 0
            m3_percOri = 0
            m4_percOri = 0
            m5_percOri = 0
            m6_percOri = 0
            m7_percOri = 0
            m8_percOri = 0
            m9_percOri = 0
            m10_percOri = 0
            m11_percOri = 0
            m12_percOri = 0
            p1_percOri = 0
            p2_percOri = 0
            p3_percOri = 0
            ac_percOri = 0
            an_percOri = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 47 Then

                m1_vlrRev += Convert.ToDecimal(e.GetValue("m1_vlrRev"))
                m1_percRev += Convert.ToDecimal(e.GetValue("m1_percRev"))
                m1_vlrRea += Convert.ToDecimal(e.GetValue("m1_vlrRea"))
                m1_percRea += Convert.ToDecimal(e.GetValue("m1_percRea"))
                m1_vlrMxR += Convert.ToDecimal(e.GetValue("m1_vlrMxR"))
                m1_percMxR += Convert.ToDecimal(e.GetValue("m1_percMxR"))

                m2_vlrRev += Convert.ToDecimal(e.GetValue("m2_vlrRev"))
                m2_percRev += Convert.ToDecimal(e.GetValue("m2_percRev"))
                m2_vlrRea += Convert.ToDecimal(e.GetValue("m2_vlrRea"))
                m2_percRea += Convert.ToDecimal(e.GetValue("m2_percRea"))
                m2_vlrMxR += Convert.ToDecimal(e.GetValue("m2_vlrMxR"))
                m2_percMxR += Convert.ToDecimal(e.GetValue("m2_percMxR"))

                m3_vlrRev += Convert.ToDecimal(e.GetValue("m3_vlrRev"))
                m3_percRev += Convert.ToDecimal(e.GetValue("m3_percRev"))
                m3_vlrRea += Convert.ToDecimal(e.GetValue("m3_vlrRea"))
                m3_percRea += Convert.ToDecimal(e.GetValue("m3_percRea"))
                m3_vlrMxR += Convert.ToDecimal(e.GetValue("m3_vlrMxR"))
                m3_percMxR += Convert.ToDecimal(e.GetValue("m3_percMxR"))

                m4_vlrRev += Convert.ToDecimal(e.GetValue("m4_vlrRev"))
                m4_percRev += Convert.ToDecimal(e.GetValue("m4_percRev"))
                m4_vlrRea += Convert.ToDecimal(e.GetValue("m4_vlrRea"))
                m4_percRea += Convert.ToDecimal(e.GetValue("m4_percRea"))
                m4_vlrMxR += Convert.ToDecimal(e.GetValue("m4_vlrMxR"))
                m4_percMxR += Convert.ToDecimal(e.GetValue("m4_percMxR"))

                m5_vlrRev += Convert.ToDecimal(e.GetValue("m5_vlrRev"))
                m5_percRev += Convert.ToDecimal(e.GetValue("m5_percRev"))
                m5_vlrRea += Convert.ToDecimal(e.GetValue("m5_vlrRea"))
                m5_percRea += Convert.ToDecimal(e.GetValue("m5_percRea"))
                m5_vlrMxR += Convert.ToDecimal(e.GetValue("m5_vlrMxR"))
                m5_percMxR += Convert.ToDecimal(e.GetValue("m5_percMxR"))

                m6_vlrRev += Convert.ToDecimal(e.GetValue("m6_vlrRev"))
                m6_percRev += Convert.ToDecimal(e.GetValue("m6_percRev"))
                m6_vlrRea += Convert.ToDecimal(e.GetValue("m6_vlrRea"))
                m6_percRea += Convert.ToDecimal(e.GetValue("m6_percRea"))
                m6_vlrMxR += Convert.ToDecimal(e.GetValue("m6_vlrMxR"))
                m6_percMxR += Convert.ToDecimal(e.GetValue("m6_percMxR"))

                m7_vlrRev += Convert.ToDecimal(e.GetValue("m7_vlrRev"))
                m7_percRev += Convert.ToDecimal(e.GetValue("m7_percRev"))
                m7_vlrRea += Convert.ToDecimal(e.GetValue("m7_vlrRea"))
                m7_percRea += Convert.ToDecimal(e.GetValue("m7_percRea"))
                m7_vlrMxR += Convert.ToDecimal(e.GetValue("m7_vlrMxR"))
                m7_percMxR += Convert.ToDecimal(e.GetValue("m7_percMxR"))

                m8_vlrRev += Convert.ToDecimal(e.GetValue("m8_vlrRev"))
                m8_percRev += Convert.ToDecimal(e.GetValue("m8_percRev"))
                m8_vlrRea += Convert.ToDecimal(e.GetValue("m8_vlrRea"))
                m8_percRea += Convert.ToDecimal(e.GetValue("m8_percRea"))
                m8_vlrMxR += Convert.ToDecimal(e.GetValue("m8_vlrMxR"))
                m8_percMxR += Convert.ToDecimal(e.GetValue("m8_percMxR"))

                m9_vlrRev += Convert.ToDecimal(e.GetValue("m9_vlrRev"))
                m9_percRev += Convert.ToDecimal(e.GetValue("m9_percRev"))
                m9_vlrRea += Convert.ToDecimal(e.GetValue("m9_vlrRea"))
                m9_percRea += Convert.ToDecimal(e.GetValue("m9_percRea"))
                m9_vlrMxR += Convert.ToDecimal(e.GetValue("m9_vlrMxR"))
                m9_percMxR += Convert.ToDecimal(e.GetValue("m9_percMxR"))

                m10_vlrRev += Convert.ToDecimal(e.GetValue("m10_vlrRev"))
                m10_percRev += Convert.ToDecimal(e.GetValue("m10_percRev"))
                m10_vlrRea += Convert.ToDecimal(e.GetValue("m10_vlrRea"))
                m10_percRea += Convert.ToDecimal(e.GetValue("m10_percRea"))
                m10_vlrMxR += Convert.ToDecimal(e.GetValue("m10_vlrMxR"))
                m10_percMxR += Convert.ToDecimal(e.GetValue("m10_percMxR"))

                m11_vlrRev += Convert.ToDecimal(e.GetValue("m11_vlrRev"))
                m11_percRev += Convert.ToDecimal(e.GetValue("m11_percRev"))
                m11_vlrRea += Convert.ToDecimal(e.GetValue("m11_vlrRea"))
                m11_percRea += Convert.ToDecimal(e.GetValue("m11_percRea"))
                m11_vlrMxR += Convert.ToDecimal(e.GetValue("m11_vlrMxR"))
                m11_percMxR += Convert.ToDecimal(e.GetValue("m11_percMxR"))

                m12_vlrRev += Convert.ToDecimal(e.GetValue("m12_vlrRev"))
                m12_percRev += Convert.ToDecimal(e.GetValue("m12_percRev"))
                m12_vlrRea += Convert.ToDecimal(e.GetValue("m12_vlrRea"))
                m12_percRea += Convert.ToDecimal(e.GetValue("m12_percRea"))
                m12_vlrMxR += Convert.ToDecimal(e.GetValue("m12_vlrMxR"))
                m12_percMxR += Convert.ToDecimal(e.GetValue("m12_percMxR"))

                p1_vlrRev += Convert.ToDecimal(e.GetValue("p1_vlrRev"))
                p1_percRev += Convert.ToDecimal(e.GetValue("p1_percRev"))
                p1_vlrRea += Convert.ToDecimal(e.GetValue("p1_vlrRea"))
                p1_percRea += Convert.ToDecimal(e.GetValue("p1_percRea"))
                p1_vlrMxR += Convert.ToDecimal(e.GetValue("p1_vlrMxR"))
                p1_percMxR += Convert.ToDecimal(e.GetValue("p1_percMxR"))

                p2_vlrRev += Convert.ToDecimal(e.GetValue("p2_vlrRev"))
                p2_percRev += Convert.ToDecimal(e.GetValue("p2_percRev"))
                p2_vlrRea += Convert.ToDecimal(e.GetValue("p2_vlrRea"))
                p2_percRea += Convert.ToDecimal(e.GetValue("p2_percRea"))
                p2_vlrMxR += Convert.ToDecimal(e.GetValue("p2_vlrMxR"))
                p2_percMxR += Convert.ToDecimal(e.GetValue("p2_percMxR"))

                p3_vlrRev += Convert.ToDecimal(e.GetValue("p3_vlrRev"))
                p3_percRev += Convert.ToDecimal(e.GetValue("p3_percRev"))
                p3_vlrRea += Convert.ToDecimal(e.GetValue("p3_vlrRea"))
                p3_percRea += Convert.ToDecimal(e.GetValue("p3_percRea"))
                p3_vlrMxR += Convert.ToDecimal(e.GetValue("p3_vlrMxR"))
                p3_percMxR += Convert.ToDecimal(e.GetValue("p3_percMxR"))

                p4_vlrRev += Convert.ToDecimal(e.GetValue("p4_vlrRev"))
                p4_percRev += Convert.ToDecimal(e.GetValue("p4_percRev"))
                p4_vlrRea += Convert.ToDecimal(e.GetValue("p4_vlrRea"))
                p4_percRea += Convert.ToDecimal(e.GetValue("p4_percRea"))
                p4_vlrMxR += Convert.ToDecimal(e.GetValue("p4_vlrMxR"))
                p4_percMxR += Convert.ToDecimal(e.GetValue("p4_percMxR"))

                ac_vlrRev += Convert.ToDecimal(e.GetValue("ac_vlrRev"))
                ac_percRev += Convert.ToDecimal(e.GetValue("ac_percRev"))
                ac_vlrRea += Convert.ToDecimal(e.GetValue("ac_vlrRea"))
                ac_percRea += Convert.ToDecimal(e.GetValue("ac_percRea"))
                ac_vlrMxR += Convert.ToDecimal(e.GetValue("ac_vlrMxR"))
                ac_percMxR += Convert.ToDecimal(e.GetValue("ac_percMxR"))

                acAA_vlrRea += Convert.ToDecimal(e.GetValue("acAA_vlrRea"))
                acAA_percRea += Convert.ToDecimal(e.GetValue("acAA_percRea"))

                an_vlrRev += Convert.ToDecimal(e.GetValue("an_vlrRev"))
                an_percRev += Convert.ToDecimal(e.GetValue("an_percRev"))
                an_vlrRea += Convert.ToDecimal(e.GetValue("an_vlrRea"))
                an_percRea += Convert.ToDecimal(e.GetValue("an_percRea"))
                an_vlrMxR += Convert.ToDecimal(e.GetValue("an_vlrMxR"))
                an_percMxR += Convert.ToDecimal(e.GetValue("an_percMxR"))

                m1_vlrOri += Convert.ToDecimal(e.GetValue("m1_vlrOri"))
                m2_vlrOri += Convert.ToDecimal(e.GetValue("m2_vlrOri"))
                m3_vlrOri += Convert.ToDecimal(e.GetValue("m3_vlrOri"))
                m4_vlrOri += Convert.ToDecimal(e.GetValue("m4_vlrOri"))
                m5_vlrOri += Convert.ToDecimal(e.GetValue("m5_vlrOri"))
                m6_vlrOri += Convert.ToDecimal(e.GetValue("m6_vlrOri"))
                m7_vlrOri += Convert.ToDecimal(e.GetValue("m7_vlrOri"))
                m8_vlrOri += Convert.ToDecimal(e.GetValue("m8_vlrOri"))
                m9_vlrOri += Convert.ToDecimal(e.GetValue("m9_vlrOri"))
                m10_vlrOri += Convert.ToDecimal(e.GetValue("m10_vlrOri"))
                m11_vlrOri += Convert.ToDecimal(e.GetValue("m11_vlrOri"))
                m12_vlrOri += Convert.ToDecimal(e.GetValue("m12_vlrOri"))
                p1_vlrOri += Convert.ToDecimal(e.GetValue("p1_vlrOri"))
                p2_vlrOri += Convert.ToDecimal(e.GetValue("p2_vlrOri"))
                p3_vlrOri += Convert.ToDecimal(e.GetValue("p3_vlrOri"))
                ac_vlrOri += Convert.ToDecimal(e.GetValue("ac_vlrOri"))
                an_vlrOri += Convert.ToDecimal(e.GetValue("an_vlrOri"))

                m1_percOri += Convert.ToDecimal(e.GetValue("m1_percOri"))
                m2_percOri += Convert.ToDecimal(e.GetValue("m2_percOri"))
                m3_percOri += Convert.ToDecimal(e.GetValue("m3_percOri"))
                m4_percOri += Convert.ToDecimal(e.GetValue("m4_percOri"))
                m5_percOri += Convert.ToDecimal(e.GetValue("m5_percOri"))
                m6_percOri += Convert.ToDecimal(e.GetValue("m6_percOri"))
                m7_percOri += Convert.ToDecimal(e.GetValue("m7_percOri"))
                m8_percOri += Convert.ToDecimal(e.GetValue("m8_percOri"))
                m9_percOri += Convert.ToDecimal(e.GetValue("m9_percOri"))
                m10_percOri += Convert.ToDecimal(e.GetValue("m10_percOri"))
                m11_percOri += Convert.ToDecimal(e.GetValue("m11_percOri"))
                m12_percOri += Convert.ToDecimal(e.GetValue("m12_percOri"))
                p1_percOri += Convert.ToDecimal(e.GetValue("p1_percOri"))
                p2_percOri += Convert.ToDecimal(e.GetValue("p2_percOri"))
                p3_percOri += Convert.ToDecimal(e.GetValue("p3_percOri"))
                ac_percOri += Convert.ToDecimal(e.GetValue("ac_percOri"))
                an_percOri += Convert.ToDecimal(e.GetValue("an_percOri"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrRev" Then e.TotalValue = m1_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percRev" Then e.TotalValue = m1_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrRea" Then e.TotalValue = m1_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percRea" Then e.TotalValue = m1_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrMxR" Then e.TotalValue = m1_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percMxR" Then e.TotalValue = m1_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrRev" Then e.TotalValue = m2_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percRev" Then e.TotalValue = m2_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrRea" Then e.TotalValue = m2_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percRea" Then e.TotalValue = m2_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrMxR" Then e.TotalValue = m2_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percMxR" Then e.TotalValue = m2_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrRev" Then e.TotalValue = m3_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percRev" Then e.TotalValue = m3_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrRea" Then e.TotalValue = m3_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percRea" Then e.TotalValue = m3_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrMxR" Then e.TotalValue = m3_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percMxR" Then e.TotalValue = m3_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrRev" Then e.TotalValue = m4_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percRev" Then e.TotalValue = m4_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrRea" Then e.TotalValue = m4_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percRea" Then e.TotalValue = m4_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrMxR" Then e.TotalValue = m4_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percMxR" Then e.TotalValue = m4_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrRev" Then e.TotalValue = m5_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percRev" Then e.TotalValue = m5_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrRea" Then e.TotalValue = m5_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percRea" Then e.TotalValue = m5_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrMxR" Then e.TotalValue = m5_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percMxR" Then e.TotalValue = m5_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrRev" Then e.TotalValue = m6_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percRev" Then e.TotalValue = m6_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrRea" Then e.TotalValue = m6_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percRea" Then e.TotalValue = m6_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrMxR" Then e.TotalValue = m6_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percMxR" Then e.TotalValue = m6_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrRev" Then e.TotalValue = m7_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percRev" Then e.TotalValue = m7_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrRea" Then e.TotalValue = m7_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percRea" Then e.TotalValue = m7_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrMxR" Then e.TotalValue = m7_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percMxR" Then e.TotalValue = m7_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrRev" Then e.TotalValue = m8_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percRev" Then e.TotalValue = m8_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrRea" Then e.TotalValue = m8_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percRea" Then e.TotalValue = m8_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrMxR" Then e.TotalValue = m8_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percMxR" Then e.TotalValue = m8_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrRev" Then e.TotalValue = m9_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percRev" Then e.TotalValue = m9_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrRea" Then e.TotalValue = m9_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percRea" Then e.TotalValue = m9_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrMxR" Then e.TotalValue = m9_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percMxR" Then e.TotalValue = m9_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrRev" Then e.TotalValue = m10_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percRev" Then e.TotalValue = m10_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrRea" Then e.TotalValue = m10_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percRea" Then e.TotalValue = m10_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrMxR" Then e.TotalValue = m10_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percMxR" Then e.TotalValue = m10_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrRev" Then e.TotalValue = m11_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percRev" Then e.TotalValue = m11_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrRea" Then e.TotalValue = m11_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percRea" Then e.TotalValue = m11_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrMxR" Then e.TotalValue = m11_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percMxR" Then e.TotalValue = m11_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrRev" Then e.TotalValue = m12_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percRev" Then e.TotalValue = m12_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrRea" Then e.TotalValue = m12_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percRea" Then e.TotalValue = m12_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrMxR" Then e.TotalValue = m12_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percMxR" Then e.TotalValue = m12_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrRev" Then e.TotalValue = p1_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percRev" Then e.TotalValue = p1_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrRea" Then e.TotalValue = p1_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percRea" Then e.TotalValue = p1_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrMxR" Then e.TotalValue = p1_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percMxR" Then e.TotalValue = p1_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrRev" Then e.TotalValue = p2_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percRev" Then e.TotalValue = p2_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrRea" Then e.TotalValue = p2_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percRea" Then e.TotalValue = p2_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrMxR" Then e.TotalValue = p2_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percMxR" Then e.TotalValue = p2_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrRev" Then e.TotalValue = p3_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percRev" Then e.TotalValue = p3_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrRea" Then e.TotalValue = p3_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percRea" Then e.TotalValue = p3_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrMxR" Then e.TotalValue = p3_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percMxR" Then e.TotalValue = p3_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrRev" Then e.TotalValue = p4_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percRev" Then e.TotalValue = p4_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrRea" Then e.TotalValue = p4_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percRea" Then e.TotalValue = p4_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrMxR" Then e.TotalValue = p4_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percMxR" Then e.TotalValue = p4_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrRev" Then e.TotalValue = ac_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percRev" Then e.TotalValue = ac_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrRea" Then e.TotalValue = ac_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percRea" Then e.TotalValue = ac_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrMxR" Then e.TotalValue = ac_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percMxR" Then e.TotalValue = ac_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "acAA_vlrRea" Then e.TotalValue = acAA_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "acAA_percRea" Then e.TotalValue = acAA_percRea

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrRev" Then e.TotalValue = an_vlrRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percRev" Then e.TotalValue = an_percRev
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrRea" Then e.TotalValue = an_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percRea" Then e.TotalValue = an_percRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrMxR" Then e.TotalValue = an_vlrMxR
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percMxR" Then e.TotalValue = an_percMxR

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrOri" Then e.TotalValue = m1_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrOri" Then e.TotalValue = m2_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrOri" Then e.TotalValue = m3_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrOri" Then e.TotalValue = m4_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrOri" Then e.TotalValue = m5_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrOri" Then e.TotalValue = m6_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrOri" Then e.TotalValue = m7_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrOri" Then e.TotalValue = m8_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrOri" Then e.TotalValue = m9_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrOri" Then e.TotalValue = m10_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrOri" Then e.TotalValue = m11_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrOri" Then e.TotalValue = m12_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrOri" Then e.TotalValue = p1_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrOri" Then e.TotalValue = p2_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrOri" Then e.TotalValue = p3_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrOri" Then e.TotalValue = ac_vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrOri" Then e.TotalValue = an_vlrOri

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percOri" Then e.TotalValue = m1_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percOri" Then e.TotalValue = m2_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percOri" Then e.TotalValue = m3_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percOri" Then e.TotalValue = m4_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percOri" Then e.TotalValue = m5_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percOri" Then e.TotalValue = m6_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percOri" Then e.TotalValue = m7_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percOri" Then e.TotalValue = m8_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percOri" Then e.TotalValue = m9_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percOri" Then e.TotalValue = m10_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percOri" Then e.TotalValue = m11_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percOri" Then e.TotalValue = m12_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percOri" Then e.TotalValue = p1_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percOri" Then e.TotalValue = p2_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percOri" Then e.TotalValue = p3_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percOri" Then e.TotalValue = ac_percOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percOri" Then e.TotalValue = an_percOri

        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        ' JANEIRO
        oFun.Grid_RedIsNegative(e, "m1_vlrRev")
        oFun.Grid_RedIsNegative(e, "m1_vlrRea")
        oFun.Grid_RedIsNegative(e, "m1_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m1_percRev")
        oFun.Grid_RedIsNegative(e, "m1_percRea")
        oFun.Grid_RedIsNegative(e, "m1_percMxR")
        oFun.Grid_RedIsNegative(e, "m1_vlrOri")


        ' FEVEREIRO
        oFun.Grid_RedIsNegative(e, "m2_vlrRev")
        oFun.Grid_RedIsNegative(e, "m2_vlrRea")
        oFun.Grid_RedIsNegative(e, "m2_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m2_percRev")
        oFun.Grid_RedIsNegative(e, "m2_percRea")
        oFun.Grid_RedIsNegative(e, "m2_percMxR")
        oFun.Grid_RedIsNegative(e, "m2_vlrOri")

        ' MARÇO
        oFun.Grid_RedIsNegative(e, "m3_vlrRev")
        oFun.Grid_RedIsNegative(e, "m3_vlrRea")
        oFun.Grid_RedIsNegative(e, "m3_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m3_percRev")
        oFun.Grid_RedIsNegative(e, "m3_percRea")
        oFun.Grid_RedIsNegative(e, "m3_percMxR")
        oFun.Grid_RedIsNegative(e, "m3_vlrOri")

        ' ABRIL
        oFun.Grid_RedIsNegative(e, "m4_vlrRev")
        oFun.Grid_RedIsNegative(e, "m4_vlrRea")
        oFun.Grid_RedIsNegative(e, "m4_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m4_percRev")
        oFun.Grid_RedIsNegative(e, "m4_percRea")
        oFun.Grid_RedIsNegative(e, "m4_percMxR")
        oFun.Grid_RedIsNegative(e, "m4_vlrOri")


        ' 1º Periodo
        oFun.Grid_RedIsNegative(e, "p1_vlrRev")
        oFun.Grid_RedIsNegative(e, "p1_vlrRea")
        oFun.Grid_RedIsNegative(e, "p1_vlrMxR")
        oFun.Grid_RedIsNegative(e, "p1_percRev")
        oFun.Grid_RedIsNegative(e, "p1_percRea")
        oFun.Grid_RedIsNegative(e, "p1_percMxR")
        oFun.Grid_RedIsNegative(e, "p1_vlrOri")

        ' MAIO
        oFun.Grid_RedIsNegative(e, "m5_vlrRev")
        oFun.Grid_RedIsNegative(e, "m5_vlrRea")
        oFun.Grid_RedIsNegative(e, "m5_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m5_percRev")
        oFun.Grid_RedIsNegative(e, "m5_percRea")
        oFun.Grid_RedIsNegative(e, "m5_percMxR")
        oFun.Grid_RedIsNegative(e, "m5_vlrOri")

        ' JUNHO
        oFun.Grid_RedIsNegative(e, "m6_vlrRev")
        oFun.Grid_RedIsNegative(e, "m6_vlrRea")
        oFun.Grid_RedIsNegative(e, "m6_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m6_percRev")
        oFun.Grid_RedIsNegative(e, "m6_percRea")
        oFun.Grid_RedIsNegative(e, "m6_percMxR")
        oFun.Grid_RedIsNegative(e, "m6_vlrOri")

        ' JULHO
        oFun.Grid_RedIsNegative(e, "m7_vlrRev")
        oFun.Grid_RedIsNegative(e, "m7_vlrRea")
        oFun.Grid_RedIsNegative(e, "m7_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m7_percRev")
        oFun.Grid_RedIsNegative(e, "m7_percRea")
        oFun.Grid_RedIsNegative(e, "m7_percMxR")
        oFun.Grid_RedIsNegative(e, "m7_vlrOri")


        ' AGOSTO
        oFun.Grid_RedIsNegative(e, "m8_vlrRev")
        oFun.Grid_RedIsNegative(e, "m8_vlrRea")
        oFun.Grid_RedIsNegative(e, "m8_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m8_percRev")
        oFun.Grid_RedIsNegative(e, "m8_percRea")
        oFun.Grid_RedIsNegative(e, "m8_percMxR")
        oFun.Grid_RedIsNegative(e, "m8_vlrOri")

        ' 2º Periodo
        oFun.Grid_RedIsNegative(e, "p2_vlrRev")
        oFun.Grid_RedIsNegative(e, "p2_vlrRea")
        oFun.Grid_RedIsNegative(e, "p2_vlrMxR")
        oFun.Grid_RedIsNegative(e, "p2_percRev")
        oFun.Grid_RedIsNegative(e, "p2_percRea")
        oFun.Grid_RedIsNegative(e, "p2_percMxR")
        oFun.Grid_RedIsNegative(e, "p2_vlrOri")


        ' SETEMBRO
        oFun.Grid_RedIsNegative(e, "m9_vlrRev")
        oFun.Grid_RedIsNegative(e, "m9_vlrRea")
        oFun.Grid_RedIsNegative(e, "m9_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m9_percRev")
        oFun.Grid_RedIsNegative(e, "m9_percRea")
        oFun.Grid_RedIsNegative(e, "m9_percMxR")
        oFun.Grid_RedIsNegative(e, "m9_vlrOri")

        ' OUTUBRO
        oFun.Grid_RedIsNegative(e, "m10_vlrRev")
        oFun.Grid_RedIsNegative(e, "m10_vlrRea")
        oFun.Grid_RedIsNegative(e, "m10_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m10_percRev")
        oFun.Grid_RedIsNegative(e, "m10_percRea")
        oFun.Grid_RedIsNegative(e, "m10_percMxR")
        oFun.Grid_RedIsNegative(e, "m10_vlrOri")

        ' NOVEMBRO
        oFun.Grid_RedIsNegative(e, "m11_vlrRev")
        oFun.Grid_RedIsNegative(e, "m11_vlrRea")
        oFun.Grid_RedIsNegative(e, "m11_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m11_percRev")
        oFun.Grid_RedIsNegative(e, "m11_percRea")
        oFun.Grid_RedIsNegative(e, "m11_percMxR")
        oFun.Grid_RedIsNegative(e, "m11_vlrOri")

        ' DEZEMBRO
        oFun.Grid_RedIsNegative(e, "m12_vlrRev")
        oFun.Grid_RedIsNegative(e, "m12_vlrRea")
        oFun.Grid_RedIsNegative(e, "m12_vlrMxR")
        oFun.Grid_RedIsNegative(e, "m12_percRev")
        oFun.Grid_RedIsNegative(e, "m12_percRea")
        oFun.Grid_RedIsNegative(e, "m12_percMxR")
        oFun.Grid_RedIsNegative(e, "m12_vlrOri")

        ' 3º Periodo
        oFun.Grid_RedIsNegative(e, "p3_vlrRev")
        oFun.Grid_RedIsNegative(e, "p3_vlrRea")
        oFun.Grid_RedIsNegative(e, "p3_vlrMxR")
        oFun.Grid_RedIsNegative(e, "p3_percRev")
        oFun.Grid_RedIsNegative(e, "p3_percRea")
        oFun.Grid_RedIsNegative(e, "p3_percMxR")
        oFun.Grid_RedIsNegative(e, "p3_vlrOri")

        ' 3º Periodo
        oFun.Grid_RedIsNegative(e, "p4_vlrRev")
        oFun.Grid_RedIsNegative(e, "p4_vlrRea")
        oFun.Grid_RedIsNegative(e, "p4_vlrMxR")
        oFun.Grid_RedIsNegative(e, "p4_percRev")
        oFun.Grid_RedIsNegative(e, "p4_percRea")
        oFun.Grid_RedIsNegative(e, "p4_percMxR")
        oFun.Grid_RedIsNegative(e, "p4_vlrOri")

        ' Acumulado
        oFun.Grid_RedIsNegative(e, "ac_vlrRev")
        oFun.Grid_RedIsNegative(e, "ac_vlrRea")
        oFun.Grid_RedIsNegative(e, "ac_vlrMxR")
        oFun.Grid_RedIsNegative(e, "ac_percRev")
        oFun.Grid_RedIsNegative(e, "ac_percRea")
        oFun.Grid_RedIsNegative(e, "ac_percMxR")
        oFun.Grid_RedIsNegative(e, "ac_vlrOri")

        ' Acumulado
        oFun.Grid_RedIsNegative(e, "an_vlrRev")
        oFun.Grid_RedIsNegative(e, "an_vlrRea")
        oFun.Grid_RedIsNegative(e, "an_vlrMxR")
        oFun.Grid_RedIsNegative(e, "an_percRev")
        oFun.Grid_RedIsNegative(e, "an_percRea")
        oFun.Grid_RedIsNegative(e, "an_percMxR")
        oFun.Grid_RedIsNegative(e, "an_vlrOri")

        ' Acumulado AA
        oFun.Grid_RedIsNegative(e, "acAA_vlrRea")
        oFun.Grid_RedIsNegative(e, "acAA_percRea")

    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        If cboFilial.CallCorporacao = 5 Then
            Select Case NomeColuna
                Case "1", "4", "47"
                    e.Row.BackColor = System.Drawing.Color.Honeydew
                    e.Row.Font.Bold = True
                Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                    e.Row.BackColor = System.Drawing.Color.Beige
                Case "39", "51", "10", "50", "80"
                    e.Row.BackColor = System.Drawing.Color.LavenderBlush
                Case "7", "3", "40", "42", "79", "13"
                    e.Row.BackColor = System.Drawing.Color.LightGray
                    e.Row.Font.Bold = True
                Case "14"
                    e.Row.BackColor = System.Drawing.Color.Yellow
                    e.Row.Font.Bold = True
                Case "106", "107", "115"
                    e.Row.BackColor = System.Drawing.Color.Aqua
                    e.Row.Font.Bold = True
            End Select
        Else
            Select Case NomeColuna
                Case "1", "4", "47"
                    e.Row.BackColor = System.Drawing.Color.Honeydew
                    e.Row.Font.Bold = True
                Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                    e.Row.BackColor = System.Drawing.Color.Beige
                Case "39", "51", "10", "50", "80"
                    e.Row.BackColor = System.Drawing.Color.LavenderBlush
                Case "7", "3", "40", "42", "79", "13"
                    e.Row.BackColor = System.Drawing.Color.LightGray
                    e.Row.Font.Bold = True
                Case "14"
                    e.Row.BackColor = System.Drawing.Color.Yellow
                    e.Row.Font.Bold = True
            End Select
        End If


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


#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(149, Page.User.Identity.Name)

            If cboFilial.IsLoja = False Then
                cboFilial.CallFilial = 199
            Else
                Me.cboFilial.Visible_cboCorporacao = False
            End If

            cboAno.AutoPostBack = False
            Me.cboAno.AnoInicial = Year(Now()) - 2
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now())

            Session("sANO") = Me.cboAno.CallAno
            'Session("sFILIAL") = Me.cboFilial.CallFilial

            Call ExibirOcultar_Original()
            Call ExibirOcultar_Revista()
            Call ExibirOcultar_Realizado()
            Call ExibirOcultar_Diferencas()

            oFun.Grid_Column_BorderLeft(ASPxGridView1, "band_Periodo_2", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderLeft(ASPxGridView1, "acAA_vlrRea", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderLeft(ASPxGridView1, "ac_vlrRea", Drawing.Color.Gray, BorderStyle.Solid, 2)



        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Resultado Teórico - 12 Meses, Período e Acumulado"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Session("sANO") = Me.cboAno.CallAno
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Me.ASPxGridView1.DataBind()
            Call ColocarBordas()

        End If
    End Sub

#End Region

    Protected Sub ASPxGridView1_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles ASPxGridView1.SummaryDisplayText
        On Error Resume Next
        If e.Item.FieldName = "ac_vlrOri" Then
            Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_percOri" Then
            Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_vlrRev" Then
            Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_percRev" Then
            Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_vlrRea" Then
            Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_percRea" Then
            Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_vlrMxR" Then
            Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "ac_percMxR" Then
            Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.Font.Bold = True
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "descConta" Then
            Me.ASPxGridView1.Columns.Item("descConta").FooterCellStyle.Font.Bold = True
            Me.ASPxGridView1.Columns.Item("descConta").FooterCellStyle.ForeColor = Drawing.Color.Blue
        End If
    End Sub

    Private Sub ExibirColuna(ByVal iNomeColuna As String)
        Me.ASPxGridView1.Columns.Item(iNomeColuna).Visible = True
    End Sub

    Private Sub OcultarColuna(ByVal iNomeColuna As String)
        Me.ASPxGridView1.Columns.Item(iNomeColuna).Visible = False
    End Sub

#Region " Original"

    Private Sub ExibirOcultar_Original()
        If Me.chkVerOriginal.Checked = True Then
            If Me.chkValor.Checked = True And Me.chkPercentual.Checked = True Then
                Call ExibirOriginal_vlr()
                Call ExibirOriginal_perc()
            ElseIf Me.chkValor.Checked = True And Me.chkPercentual.Checked = False Then
                Call OcultarOriginal_perc()
                Call ExibirOriginal_vlr()
            ElseIf Me.chkValor.Checked = False And Me.chkPercentual.Checked = True Then
                Call ExibirOriginal_perc()
                Call OcultarOriginal_vlr()
            End If
        Else
            Call OcultarOriginal_vlr()
            Call OcultarOriginal_perc()
        End If
    End Sub

    Private Sub OcultarOriginal_vlr()
        Call OcultarColuna("m1_vlrOri")
        Call OcultarColuna("m2_vlrOri")
        Call OcultarColuna("m3_vlrOri")
        Call OcultarColuna("m4_vlrOri")
        Call OcultarColuna("m5_vlrOri")
        Call OcultarColuna("m6_vlrOri")
        Call OcultarColuna("m7_vlrOri")
        Call OcultarColuna("m8_vlrOri")
        Call OcultarColuna("m9_vlrOri")
        Call OcultarColuna("m10_vlrOri")
        Call OcultarColuna("m11_vlrOri")
        Call OcultarColuna("m12_vlrOri")
        Call OcultarColuna("p1_vlrOri")
        Call OcultarColuna("p2_vlrOri")
        Call OcultarColuna("p3_vlrOri")
        Call OcultarColuna("p4_vlrOri")
        Call OcultarColuna("an_vlrOri")
        Call OcultarColuna("ac_vlrOri")
    End Sub

    Private Sub ExibirOriginal_vlr()
        Call ExibirColuna("m1_vlrOri")
        Call ExibirColuna("m2_vlrOri")
        Call ExibirColuna("m3_vlrOri")
        Call ExibirColuna("m4_vlrOri")
        Call ExibirColuna("m5_vlrOri")
        Call ExibirColuna("m6_vlrOri")
        Call ExibirColuna("m7_vlrOri")
        Call ExibirColuna("m8_vlrOri")
        Call ExibirColuna("m9_vlrOri")
        Call ExibirColuna("m10_vlrOri")
        Call ExibirColuna("m11_vlrOri")
        Call ExibirColuna("m12_vlrOri")
        Call ExibirColuna("p1_vlrOri")
        Call ExibirColuna("p2_vlrOri")
        Call ExibirColuna("p3_vlrOri")
        Call ExibirColuna("p4_vlrOri")
        Call ExibirColuna("an_vlrOri")
        Call ExibirColuna("ac_vlrOri")
    End Sub

    Private Sub OcultarOriginal_perc()
        Call OcultarColuna("m1_percOri")
        Call OcultarColuna("m2_percOri")
        Call OcultarColuna("m3_percOri")
        Call OcultarColuna("m4_percOri")
        Call OcultarColuna("m5_percOri")
        Call OcultarColuna("m6_percOri")
        Call OcultarColuna("m7_percOri")
        Call OcultarColuna("m8_percOri")
        Call OcultarColuna("m9_percOri")
        Call OcultarColuna("m10_percOri")
        Call OcultarColuna("m11_percOri")
        Call OcultarColuna("m12_percOri")
        Call OcultarColuna("p1_percOri")
        Call OcultarColuna("p2_percOri")
        Call OcultarColuna("p3_percOri")
        Call OcultarColuna("p4_percOri")
        Call OcultarColuna("an_percOri")
        Call OcultarColuna("ac_percOri")
    End Sub

    Private Sub ExibirOriginal_perc()
        Call ExibirColuna("m1_percOri")
        Call ExibirColuna("m2_percOri")
        Call ExibirColuna("m3_percOri")
        Call ExibirColuna("m4_percOri")
        Call ExibirColuna("m5_percOri")
        Call ExibirColuna("m6_percOri")
        Call ExibirColuna("m7_percOri")
        Call ExibirColuna("m8_percOri")
        Call ExibirColuna("m9_percOri")
        Call ExibirColuna("m10_percOri")
        Call ExibirColuna("m11_percOri")
        Call ExibirColuna("m12_percOri")
        Call ExibirColuna("p1_percOri")
        Call ExibirColuna("p2_percOri")
        Call ExibirColuna("p3_percOri")
        Call ExibirColuna("p4_percOri")
        Call ExibirColuna("an_percOri")
        Call ExibirColuna("ac_percOri")
    End Sub

#End Region

#Region " Revista"

    Private Sub ExibirOcultar_Revista()
        If Me.chkVerRevista.Checked = True Then
            If Me.chkValor.Checked = True And Me.chkPercentual.Checked = True Then
                Call ExibirRevista_vlr()
                Call ExibirRevista_perc()
            ElseIf Me.chkValor.Checked = True And Me.chkPercentual.Checked = False Then
                Call OcultarRevista_perc()
                Call ExibirRevista_vlr()
            ElseIf Me.chkValor.Checked = False And Me.chkPercentual.Checked = True Then
                Call ExibirRevista_perc()
                Call OcultarRevista_vlr()
            End If
        Else
            Call OcultarRevista_vlr()
            Call OcultarRevista_perc()
        End If
    End Sub

    Private Sub OcultarRevista_vlr()
        Call OcultarColuna("m1_vlrRev")
        Call OcultarColuna("m2_vlrRev")
        Call OcultarColuna("m3_vlrRev")
        Call OcultarColuna("m4_vlrRev")
        Call OcultarColuna("m5_vlrRev")
        Call OcultarColuna("m6_vlrRev")
        Call OcultarColuna("m7_vlrRev")
        Call OcultarColuna("m8_vlrRev")
        Call OcultarColuna("m9_vlrRev")
        Call OcultarColuna("m10_vlrRev")
        Call OcultarColuna("m11_vlrRev")
        Call OcultarColuna("m12_vlrRev")
        Call OcultarColuna("p1_vlrRev")
        Call OcultarColuna("p2_vlrRev")
        Call OcultarColuna("p3_vlrRev")
        Call OcultarColuna("p4_vlrRev")
        Call OcultarColuna("an_vlrRev")
        Call OcultarColuna("ac_vlrRev")
    End Sub

    Private Sub ExibirRevista_vlr()
        Call ExibirColuna("m1_vlrRev")
        Call ExibirColuna("m2_vlrRev")
        Call ExibirColuna("m3_vlrRev")
        Call ExibirColuna("m4_vlrRev")
        Call ExibirColuna("m5_vlrRev")
        Call ExibirColuna("m6_vlrRev")
        Call ExibirColuna("m7_vlrRev")
        Call ExibirColuna("m8_vlrRev")
        Call ExibirColuna("m9_vlrRev")
        Call ExibirColuna("m10_vlrRev")
        Call ExibirColuna("m11_vlrRev")
        Call ExibirColuna("m12_vlrRev")
        Call ExibirColuna("p1_vlrRev")
        Call ExibirColuna("p2_vlrRev")
        Call ExibirColuna("p3_vlrRev")
        Call ExibirColuna("p4_vlrRev")
        Call ExibirColuna("an_vlrRev")
        Call ExibirColuna("ac_vlrRev")
    End Sub

    Private Sub OcultarRevista_perc()
        Call OcultarColuna("m1_percRev")
        Call OcultarColuna("m2_percRev")
        Call OcultarColuna("m3_percRev")
        Call OcultarColuna("m4_percRev")
        Call OcultarColuna("m5_percRev")
        Call OcultarColuna("m6_percRev")
        Call OcultarColuna("m7_percRev")
        Call OcultarColuna("m8_percRev")
        Call OcultarColuna("m9_percRev")
        Call OcultarColuna("m10_percRev")
        Call OcultarColuna("m11_percRev")
        Call OcultarColuna("m12_percRev")
        Call OcultarColuna("p1_percRev")
        Call OcultarColuna("p2_percRev")
        Call OcultarColuna("p3_percRev")
        Call OcultarColuna("p4_percRev")
        Call OcultarColuna("an_percRev")
        Call OcultarColuna("ac_percRev")
    End Sub

    Private Sub ExibirRevista_perc()
        Call ExibirColuna("m1_percRev")
        Call ExibirColuna("m2_percRev")
        Call ExibirColuna("m3_percRev")
        Call ExibirColuna("m4_percRev")
        Call ExibirColuna("m5_percRev")
        Call ExibirColuna("m6_percRev")
        Call ExibirColuna("m7_percRev")
        Call ExibirColuna("m8_percRev")
        Call ExibirColuna("m9_percRev")
        Call ExibirColuna("m10_percRev")
        Call ExibirColuna("m11_percRev")
        Call ExibirColuna("m12_percRev")
        Call ExibirColuna("p1_percRev")
        Call ExibirColuna("p2_percRev")
        Call ExibirColuna("p3_percRev")
        Call ExibirColuna("p4_percRev")
        Call ExibirColuna("an_percRev")
        Call ExibirColuna("ac_percRev")
    End Sub

#End Region

#Region " Realizado"

    Private Sub ExibirOcultar_Realizado()
        If Me.chkVerRealizado.Checked = True Then
            If Me.chkValor.Checked = True And Me.chkPercentual.Checked = True Then
                Call ExibirRealizado_vlr()
                Call ExibirRealizado_perc()
            ElseIf Me.chkValor.Checked = True And Me.chkPercentual.Checked = False Then
                Call OcultarRealizado_perc()
                Call ExibirRealizado_vlr()
            ElseIf Me.chkValor.Checked = False And Me.chkPercentual.Checked = True Then
                Call ExibirRealizado_perc()
                Call OcultarRealizado_vlr()
            End If
        Else
            Call OcultarRealizado_vlr()
            Call OcultarRealizado_perc()
        End If
    End Sub

    Private Sub OcultarRealizado_vlr()
        Call OcultarColuna("m1_vlrRea")
        Call OcultarColuna("m2_vlrRea")
        Call OcultarColuna("m3_vlrRea")
        Call OcultarColuna("m4_vlrRea")
        Call OcultarColuna("m5_vlrRea")
        Call OcultarColuna("m6_vlrRea")
        Call OcultarColuna("m7_vlrRea")
        Call OcultarColuna("m8_vlrRea")
        Call OcultarColuna("m9_vlrRea")
        Call OcultarColuna("m10_vlrRea")
        Call OcultarColuna("m11_vlrRea")
        Call OcultarColuna("m12_vlrRea")
        Call OcultarColuna("p1_vlrRea")
        Call OcultarColuna("p2_vlrRea")
        Call OcultarColuna("p3_vlrRea")
        Call OcultarColuna("p4_vlrRea")
        Call OcultarColuna("an_vlrRea")
        Call OcultarColuna("ac_vlrRea")
    End Sub

    Private Sub ExibirRealizado_vlr()
        Call ExibirColuna("m1_vlrRea")
        Call ExibirColuna("m2_vlrRea")
        Call ExibirColuna("m3_vlrRea")
        Call ExibirColuna("m4_vlrRea")
        Call ExibirColuna("m5_vlrRea")
        Call ExibirColuna("m6_vlrRea")
        Call ExibirColuna("m7_vlrRea")
        Call ExibirColuna("m8_vlrRea")
        Call ExibirColuna("m9_vlrRea")
        Call ExibirColuna("m10_vlrRea")
        Call ExibirColuna("m11_vlrRea")
        Call ExibirColuna("m12_vlrRea")
        Call ExibirColuna("p1_vlrRea")
        Call ExibirColuna("p2_vlrRea")
        Call ExibirColuna("p3_vlrRea")
        Call ExibirColuna("p4_vlrRea")
        Call ExibirColuna("an_vlrRea")
        Call ExibirColuna("ac_vlrRea")
    End Sub

    Private Sub OcultarRealizado_perc()
        Call OcultarColuna("m1_percRea")
        Call OcultarColuna("m2_percRea")
        Call OcultarColuna("m3_percRea")
        Call OcultarColuna("m4_percRea")
        Call OcultarColuna("m5_percRea")
        Call OcultarColuna("m6_percRea")
        Call OcultarColuna("m7_percRea")
        Call OcultarColuna("m8_percRea")
        Call OcultarColuna("m9_percRea")
        Call OcultarColuna("m10_percRea")
        Call OcultarColuna("m11_percRea")
        Call OcultarColuna("m12_percRea")
        Call OcultarColuna("p1_percRea")
        Call OcultarColuna("p2_percRea")
        Call OcultarColuna("p3_percRea")
        Call OcultarColuna("p4_percRea")
        Call OcultarColuna("an_percRea")
        Call OcultarColuna("ac_percRea")
    End Sub

    Private Sub ExibirRealizado_perc()
        Call ExibirColuna("m1_percRea")
        Call ExibirColuna("m2_percRea")
        Call ExibirColuna("m3_percRea")
        Call ExibirColuna("m4_percRea")
        Call ExibirColuna("m5_percRea")
        Call ExibirColuna("m6_percRea")
        Call ExibirColuna("m7_percRea")
        Call ExibirColuna("m8_percRea")
        Call ExibirColuna("m9_percRea")
        Call ExibirColuna("m10_percRea")
        Call ExibirColuna("m11_percRea")
        Call ExibirColuna("m12_percRea")
        Call ExibirColuna("p1_percRea")
        Call ExibirColuna("p2_percRea")
        Call ExibirColuna("p3_percRea")
        Call ExibirColuna("p4_percRea")
        Call ExibirColuna("an_percRea")
        Call ExibirColuna("ac_percRea")
    End Sub

#End Region

#Region " Diferencas"

    Private Sub ExibirOcultar_Diferencas()
        If Me.chkVerDiferencas.Checked = True Then
            If Me.chkValor.Checked = True And Me.chkPercentual.Checked = True Then
                Call ExibirDiferencas_vlr()
                Call ExibirDiferencas_perc()
            ElseIf Me.chkValor.Checked = True And Me.chkPercentual.Checked = False Then
                Call OcultarDiferencas_perc()
                Call ExibirDiferencas_vlr()
            ElseIf Me.chkValor.Checked = False And Me.chkPercentual.Checked = True Then
                Call ExibirDiferencas_perc()
                Call OcultarDiferencas_vlr()
            End If
        Else
            Call OcultarDiferencas_vlr()
            Call OcultarDiferencas_perc()
        End If
    End Sub

    Private Sub OcultarDiferencas_vlr()
        Call OcultarColuna("m1_vlrMxR")
        Call OcultarColuna("m2_vlrMxR")
        Call OcultarColuna("m3_vlrMxR")
        Call OcultarColuna("m4_vlrMxR")
        Call OcultarColuna("m5_vlrMxR")
        Call OcultarColuna("m6_vlrMxR")
        Call OcultarColuna("m7_vlrMxR")
        Call OcultarColuna("m8_vlrMxR")
        Call OcultarColuna("m9_vlrMxR")
        Call OcultarColuna("m10_vlrMxR")
        Call OcultarColuna("m11_vlrMxR")
        Call OcultarColuna("m12_vlrMxR")
        Call OcultarColuna("p1_vlrMxR")
        Call OcultarColuna("p2_vlrMxR")
        Call OcultarColuna("p3_vlrMxR")
        Call OcultarColuna("p4_vlrMxR")
        Call OcultarColuna("ac_vlrMxR")
        Call OcultarColuna("an_vlrMxR")
    End Sub

    Private Sub ExibirDiferencas_vlr()
        Call ExibirColuna("m1_vlrMxR")
        Call ExibirColuna("m2_vlrMxR")
        Call ExibirColuna("m3_vlrMxR")
        Call ExibirColuna("m4_vlrMxR")
        Call ExibirColuna("m5_vlrMxR")
        Call ExibirColuna("m6_vlrMxR")
        Call ExibirColuna("m7_vlrMxR")
        Call ExibirColuna("m8_vlrMxR")
        Call ExibirColuna("m9_vlrMxR")
        Call ExibirColuna("m10_vlrMxR")
        Call ExibirColuna("m11_vlrMxR")
        Call ExibirColuna("m12_vlrMxR")
        Call ExibirColuna("p1_vlrMxR")
        Call ExibirColuna("p2_vlrMxR")
        Call ExibirColuna("p3_vlrMxR")
        Call ExibirColuna("p4_vlrMxR")
        Call ExibirColuna("an_vlrMxR")
        Call ExibirColuna("ac_vlrMxR")
    End Sub

    Private Sub OcultarDiferencas_perc()
        Call OcultarColuna("m1_percMxR")
        Call OcultarColuna("m2_percMxR")
        Call OcultarColuna("m3_percMxR")
        Call OcultarColuna("m4_percMxR")
        Call OcultarColuna("m5_percMxR")
        Call OcultarColuna("m6_percMxR")
        Call OcultarColuna("m7_percMxR")
        Call OcultarColuna("m8_percMxR")
        Call OcultarColuna("m9_percMxR")
        Call OcultarColuna("m10_percMxR")
        Call OcultarColuna("m11_percMxR")
        Call OcultarColuna("m12_percMxR")
        Call OcultarColuna("p1_percMxR")
        Call OcultarColuna("p2_percMxR")
        Call OcultarColuna("p3_percMxR")
        Call OcultarColuna("p4_percMxR")
        Call OcultarColuna("an_percMxR")
        Call OcultarColuna("ac_percMxR")
    End Sub

    Private Sub ExibirDiferencas_perc()
        Call ExibirColuna("m1_percMxR")
        Call ExibirColuna("m2_percMxR")
        Call ExibirColuna("m3_percMxR")
        Call ExibirColuna("m4_percMxR")
        Call ExibirColuna("m5_percMxR")
        Call ExibirColuna("m6_percMxR")
        Call ExibirColuna("m7_percMxR")
        Call ExibirColuna("m8_percMxR")
        Call ExibirColuna("m9_percMxR")
        Call ExibirColuna("m10_percMxR")
        Call ExibirColuna("m11_percMxR")
        Call ExibirColuna("m12_percMxR")
        Call ExibirColuna("p1_percMxR")
        Call ExibirColuna("p2_percMxR")
        Call ExibirColuna("p3_percMxR")
        Call ExibirColuna("p4_percMxR")
        Call ExibirColuna("an_percMxR")
        Call ExibirColuna("ac_percMxR")
    End Sub

#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Call ExibirOcultar_Original()
        Call ExibirOcultar_Revista()
        Call ExibirOcultar_Realizado()
        Call ExibirOcultar_Diferencas()

        'band_Ano, band_Periodo_4
        If chkPeriodo_1.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_1", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_1", False)
        End If

        If chkPeriodo_2.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_2", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_2", False)
        End If

        If chkPeriodo_3.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_3", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_3", False)
        End If

        If chkPeriodo_4.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_4", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_4", False)
        End If

        If chkPeriodo_5.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Acumulado", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Acumulado", False)
        End If

        If chkPeriodo_6.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Ano", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Ano", False)
        End If

        If chkTrimestres.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_1", True)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_2", True)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_3", True)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_4", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_1", False)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_2", False)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_3", False)
            oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_4", False)
        End If

        'Mostrar Cabeçalho
        If Me.chkMostrarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = True
        Else
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = False
        End If

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno
        Session("sUNIDADE") = Me.cboFilial.CallCorporacao

        Call ColocarBordas()

        Dim status_CAI As Byte
        If chkCAI.Checked = True Then status_CAI = 1
        If chkCAI.Checked = False Then status_CAI = 0

        clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Insert_Usuarios", Conexao.gerTemp_tr, "@Usuario", User.Identity.Name, "@PGR", "269", "idValue", status_CAI.ToString)
        clDataDb.ExecuteStoredProcedure_Scalar("Resultados.uspAtualizarTeorico_Acumulados", Conexao.gerBI_str, "@Ano", Session("sANO"), "@Mes", "78", "@idFilial", Session("sFILIAL"), "@Usuario", User.Identity.Name)

        Me.ASPxGridView1.DataBind()
    End Sub

   

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Private Sub FuncaoColocarBordas(ByVal iNomeCampo As String)
        Me.ASPxGridView1.Columns.Item(iNomeCampo).CellStyle.BorderRight.BorderColor = Drawing.Color.Gray
        Me.ASPxGridView1.Columns.Item(iNomeCampo).CellStyle.BorderRight.BorderStyle = BorderStyle.Solid
        Me.ASPxGridView1.Columns.Item(iNomeCampo).CellStyle.BorderRight.BorderWidth = 1
    End Sub

    Private Sub ColocarBordas()
        Call FuncaoColocarBordas("descConta")

        'Meta Realizado
        If Me.chkVerRealizado.Checked = True Then
            If Me.chkVerOriginal.Checked = False Then
                If Me.chkVerRevista.Checked = False Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percRea")
                        Call FuncaoColocarBordas("m2_percRea")
                        Call FuncaoColocarBordas("m3_percRea")
                        Call FuncaoColocarBordas("m4_percRea")
                        Call FuncaoColocarBordas("m5_percRea")
                        Call FuncaoColocarBordas("m6_percRea")
                        Call FuncaoColocarBordas("m7_percRea")
                        Call FuncaoColocarBordas("m8_percRea")
                        Call FuncaoColocarBordas("m9_percRea")
                        Call FuncaoColocarBordas("m10_percRea")
                        Call FuncaoColocarBordas("m11_percRea")
                        Call FuncaoColocarBordas("m12_percRea")

                        Call FuncaoColocarBordas("p1_percRea")
                        Call FuncaoColocarBordas("p2_percRea")
                        Call FuncaoColocarBordas("p3_percRea")
                        Call FuncaoColocarBordas("p4_percRea")
                    End If
                End If
            End If
        End If

        'Meta Realizado e Revista
        If Me.chkVerRealizado.Checked = True Then
            If Me.chkVerOriginal.Checked = False Then
                If Me.chkVerRevista.Checked = True Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percRea")
                        Call FuncaoColocarBordas("m2_percRea")
                        Call FuncaoColocarBordas("m3_percRea")
                        Call FuncaoColocarBordas("m4_percRea")
                        Call FuncaoColocarBordas("m5_percRea")
                        Call FuncaoColocarBordas("m6_percRea")
                        Call FuncaoColocarBordas("m7_percRea")
                        Call FuncaoColocarBordas("m8_percRea")
                        Call FuncaoColocarBordas("m9_percRea")
                        Call FuncaoColocarBordas("m10_percRea")
                        Call FuncaoColocarBordas("m11_percRea")
                        Call FuncaoColocarBordas("m12_percRea")

                        Call FuncaoColocarBordas("p1_percRea")
                        Call FuncaoColocarBordas("p2_percRea")
                        Call FuncaoColocarBordas("p3_percRea")
                        Call FuncaoColocarBordas("p4_percRea")
                    End If
                End If
            End If
        End If

        'Meta Original, Revista e Realizado
        If Me.chkVerRealizado.Checked = True Then
            If Me.chkVerOriginal.Checked = True Then
                If Me.chkVerRevista.Checked = True Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percRea")
                        Call FuncaoColocarBordas("m2_percRea")
                        Call FuncaoColocarBordas("m3_percRea")
                        Call FuncaoColocarBordas("m4_percRea")
                        Call FuncaoColocarBordas("m5_percRea")
                        Call FuncaoColocarBordas("m6_percRea")
                        Call FuncaoColocarBordas("m7_percRea")
                        Call FuncaoColocarBordas("m8_percRea")
                        Call FuncaoColocarBordas("m9_percRea")
                        Call FuncaoColocarBordas("m10_percRea")
                        Call FuncaoColocarBordas("m11_percRea")
                        Call FuncaoColocarBordas("m12_percRea")

                        Call FuncaoColocarBordas("p1_percRea")
                        Call FuncaoColocarBordas("p2_percRea")
                        Call FuncaoColocarBordas("p3_percRea")
                        Call FuncaoColocarBordas("p4_percRea")
                    End If
                End If
            End If
        End If

        'Meta Revista
        If Me.chkVerRealizado.Checked = False Then
            If Me.chkVerOriginal.Checked = False Then
                If Me.chkVerRevista.Checked = True Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percRev")
                        Call FuncaoColocarBordas("m2_percRev")
                        Call FuncaoColocarBordas("m3_percRev")
                        Call FuncaoColocarBordas("m4_percRev")
                        Call FuncaoColocarBordas("m5_percRev")
                        Call FuncaoColocarBordas("m6_percRev")
                        Call FuncaoColocarBordas("m7_percRev")
                        Call FuncaoColocarBordas("m8_percRev")
                        Call FuncaoColocarBordas("m9_percRev")
                        Call FuncaoColocarBordas("m10_percRev")
                        Call FuncaoColocarBordas("m11_percRev")
                        Call FuncaoColocarBordas("m12_percRev")

                        Call FuncaoColocarBordas("p1_percRev")
                        Call FuncaoColocarBordas("p2_percRev")
                        Call FuncaoColocarBordas("p3_percRev")
                        Call FuncaoColocarBordas("p4_percRev")
                    End If
                End If
            End If
        End If

        'Meta Original 
        If Me.chkVerRealizado.Checked = False Then
            If Me.chkVerOriginal.Checked = True Then
                If Me.chkVerRevista.Checked = False Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percOri")
                        Call FuncaoColocarBordas("m2_percOri")
                        Call FuncaoColocarBordas("m3_percOri")
                        Call FuncaoColocarBordas("m4_percOri")
                        Call FuncaoColocarBordas("m5_percOri")
                        Call FuncaoColocarBordas("m6_percOri")
                        Call FuncaoColocarBordas("m7_percOri")
                        Call FuncaoColocarBordas("m8_percOri")
                        Call FuncaoColocarBordas("m9_percOri")
                        Call FuncaoColocarBordas("m10_percOri")
                        Call FuncaoColocarBordas("m11_percOri")
                        Call FuncaoColocarBordas("m12_percOri")

                        Call FuncaoColocarBordas("p1_percOri")
                        Call FuncaoColocarBordas("p2_percOri")
                        Call FuncaoColocarBordas("p3_percOri")
                        Call FuncaoColocarBordas("p4_percOri")
                    End If
                End If
            End If
        End If

        'Meta Original e Revista
        If Me.chkVerRealizado.Checked = False Then
            If Me.chkVerOriginal.Checked = True Then
                If Me.chkVerRevista.Checked = True Then
                    If Me.chkVerDiferencas.Checked = False Then
                        Call FuncaoColocarBordas("m1_percRev")
                        Call FuncaoColocarBordas("m2_percRev")
                        Call FuncaoColocarBordas("m3_percRev")
                        Call FuncaoColocarBordas("m4_percRev")
                        Call FuncaoColocarBordas("m5_percRev")
                        Call FuncaoColocarBordas("m6_percRev")
                        Call FuncaoColocarBordas("m7_percRev")
                        Call FuncaoColocarBordas("m8_percRev")
                        Call FuncaoColocarBordas("m9_percRev")
                        Call FuncaoColocarBordas("m10_percRev")
                        Call FuncaoColocarBordas("m11_percRev")
                        Call FuncaoColocarBordas("m12_percRev")

                        Call FuncaoColocarBordas("p1_percRev")
                        Call FuncaoColocarBordas("p2_percRev")
                        Call FuncaoColocarBordas("p3_percRev")
                        Call FuncaoColocarBordas("p4_percRev")
                    End If
                End If
            End If
        End If

        Call FuncaoColocarBordas("m1_percMxR")
        Call FuncaoColocarBordas("m2_percMxR")
        Call FuncaoColocarBordas("m3_percMxR")
        Call FuncaoColocarBordas("m4_percMxR")
        Call FuncaoColocarBordas("m5_percMxR")
        Call FuncaoColocarBordas("m6_percMxR")
        Call FuncaoColocarBordas("m7_percMxR")
        Call FuncaoColocarBordas("m8_percMxR")
        Call FuncaoColocarBordas("m9_percMxR")
        Call FuncaoColocarBordas("m10_percMxR")
        Call FuncaoColocarBordas("m11_percMxR")
        Call FuncaoColocarBordas("m12_percMxR")

        Call FuncaoColocarBordas("p1_percMxR")
        Call FuncaoColocarBordas("p2_percMxR")
        Call FuncaoColocarBordas("p3_percMxR")
        Call FuncaoColocarBordas("p4_percMxR")
    End Sub

    Protected Sub chkPercentual_CheckedChanged(sender As Object, e As EventArgs) Handles chkPercentual.CheckedChanged
        If Me.chkPercentual.Checked = False Then
            Me.chkValor.Enabled = False
        Else
            Me.chkValor.Enabled = True
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub

    'Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
    '    If Me.cboFilial.CallCorporacao = 3 Then
    '        Me.cboFilial.CallFilial = 3
    '    ElseIf Me.cboFilial.CallCorporacao = 199 Then
    '        Me.cboFilial.CallFilial = 199
    '    End If

    'End Sub


End Class
