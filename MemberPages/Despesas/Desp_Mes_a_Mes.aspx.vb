Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_Despesas_Desp_Mes_a_Mes
    Inherits System.Web.UI.Page

    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Shared dr As SqlDataReader

    Dim vMetaOriginal_1 As Decimal
    Dim vMetaOriginal_2 As Decimal
    Dim vMetaOriginal_3 As Decimal
    Dim vMetaOriginal_4 As Decimal
    Dim vMetaOriginal_5 As Decimal
    Dim vMetaOriginal_6 As Decimal
    Dim vMetaOriginal_7 As Decimal
    Dim vMetaOriginal_8 As Decimal
    Dim vMetaOriginal_9 As Decimal
    Dim vMetaOriginal_10 As Decimal
    Dim vMetaOriginal_11 As Decimal
    Dim vMetaOriginal_12 As Decimal

    Dim vMetaRevista_1 As Decimal
    Dim vMetaRevista_2 As Decimal
    Dim vMetaRevista_3 As Decimal
    Dim vMetaRevista_4 As Decimal
    Dim vMetaRevista_5 As Decimal
    Dim vMetaRevista_6 As Decimal
    Dim vMetaRevista_7 As Decimal
    Dim vMetaRevista_8 As Decimal
    Dim vMetaRevista_9 As Decimal
    Dim vMetaRevista_10 As Decimal
    Dim vMetaRevista_11 As Decimal
    Dim vMetaRevista_12 As Decimal

    Dim vRealizado_1 As Decimal
    Dim vRealizado_2 As Decimal
    Dim vRealizado_3 As Decimal
    Dim vRealizado_4 As Decimal
    Dim vRealizado_5 As Decimal
    Dim vRealizado_6 As Decimal
    Dim vRealizado_7 As Decimal
    Dim vRealizado_8 As Decimal
    Dim vRealizado_9 As Decimal
    Dim vRealizado_10 As Decimal
    Dim vRealizado_11 As Decimal
    Dim vRealizado_12 As Decimal

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(392, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            cboAno.AnoInicial = 2012
            cboAno.AnoFinal = varAno
            cboAno.CallAno = varAno

            cboAno.AutoPostBack = False
            cboSecao.AutoPostBack = False
            cboFilial.AutoPostBack = False

            Bordas_Realizado_Atual()
            Legendas()

            divGrupo_Subgrupo.Visible = False

            Exibir_Colunas()


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "DESPESA MÊS A MÊS - PGR392"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()
            chkAno.Checked = False
            'Show_Months_Start()
            Atualizar()

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = cboAno.CallAno
        Session("sSECAO") = cboSecao.CallSecao
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        BuscarVendas_Metas_Original()
        BuscarVendas_Metas()
        BuscarVendas_Realizado()

        Exibir_Colunas()
        Show_Hide_Mes()

        Atualizar()

        MudarTitulo()

        ' lblInfo.Text = "Ano " & cboAno.CallAno & " Venda: " & vRealizado_1

    End Sub

    Private Sub Exibir_Colunas()

        If chkOriginal.Checked = True Then
            Ocultar_Exibir_Meta_Original(True)
        Else
            Ocultar_Exibir_Meta_Original(False)
        End If

        If chkRevista.Checked = True Then
            Ocultar_Exibir_Meta_Revista(True)
        Else
            Ocultar_Exibir_Meta_Revista(False)
        End If


        If chkRealizado.Checked = True Then
            Ocultar_Exibir_Realizado(True)
        Else
            Ocultar_Exibir_Realizado(False)
        End If

    End Sub

    Private Sub Show_Months_Start()

        chkAno.Checked = False

        Dim vMesNow As Byte
        vMesNow = DateAndTime.Now.Month

        Select Case vMesNow
            Case 1
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = True
                chkMes09.Checked = True
                chkMes10.Checked = True
                chkMes11.Checked = True
                chkMes12.Checked = True
            Case 2
                chkMes01.Checked = True
                chkMes02.Checked = False
                chkMes03.Checked = False
                chkMes04.Checked = False
                chkMes05.Checked = False
                chkMes06.Checked = False
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 3
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = False
                chkMes04.Checked = False
                chkMes05.Checked = False
                chkMes06.Checked = False
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 4
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = False
                chkMes05.Checked = False
                chkMes06.Checked = False
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 5
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = False
                chkMes06.Checked = False
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 6
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = False
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 7
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = False
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 8
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = False
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 9
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = True
                chkMes09.Checked = False
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 10
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = True
                chkMes09.Checked = True
                chkMes10.Checked = False
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 11
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = True
                chkMes09.Checked = True
                chkMes10.Checked = True
                chkMes11.Checked = False
                chkMes12.Checked = False
            Case 12
                chkMes01.Checked = True
                chkMes02.Checked = True
                chkMes03.Checked = True
                chkMes04.Checked = True
                chkMes05.Checked = True
                chkMes06.Checked = True
                chkMes07.Checked = True
                chkMes08.Checked = True
                chkMes09.Checked = True
                chkMes10.Checked = True
                chkMes11.Checked = True
                chkMes12.Checked = False
        End Select

    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "DESPESA MÊS A MÊS")
        grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


#Region " BORDAS "

    Private Sub Bordas_Realizado_Atual()

        oFun.Grid_Column_BorderRight(grid, "percRealizado_m1", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m2", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m3", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m4", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m5", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m6", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m7", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m8", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m9", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m10", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m11", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m12", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percRealizado_m99", Drawing.Color.Gray, BorderStyle.Solid, 2)


        oFun.Grid_Column_BorderRight(grid, "percRevista_m1", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m5", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m6", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m7", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m8", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m9", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m10", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m11", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m12", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percRevista_m99", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        oFun.Grid_Column_BorderRight(grid, "percOriginal_m1", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m5", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m6", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m7", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m8", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m9", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m10", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m11", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m12", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percOriginal_m99", Drawing.Color.Gray, BorderStyle.Dashed, 1)


        oFun.Grid_Column_BorderRight(grid, "DescDespesa", Drawing.Color.Gray, BorderStyle.Solid, 2)

    End Sub

#End Region

#Region " LEGENDAS "

    Private Sub Legendas()

        ' REALIZADO
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m1", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m2", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m3", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m4", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m5", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m6", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m7", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m8", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m9", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m10", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m11", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m12", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m99", "" & cboAno.CallAno & " R$")

        oFun.Grid_ColumnTitle(grid, "percRealizado_m1", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m2", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m3", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m4", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m5", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m6", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m7", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m8", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m9", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m10", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m11", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m12", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m99", "" & cboAno.CallAno & " %")

        ' REVISTA
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m1", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m2", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m3", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m4", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m5", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m6", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m7", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m8", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m9", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m10", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m11", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m12", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m99", "" & cboAno.CallAno & " R$")

        oFun.Grid_ColumnTitle(grid, "percRevista_m1", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m2", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m3", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m4", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m5", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m6", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m7", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m8", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m9", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m10", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m11", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m12", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m99", "" & cboAno.CallAno & " %")

        ' ORIGINAL
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m1", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m2", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m3", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m4", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m5", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m6", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m7", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m8", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m9", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m10", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m11", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m12", "" & cboAno.CallAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrOriginal_m99", "" & cboAno.CallAno & " R$")

        oFun.Grid_ColumnTitle(grid, "percOriginal_m1", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m2", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m3", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m4", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m5", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m6", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m7", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m8", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m9", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m10", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m11", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m12", "" & cboAno.CallAno & " %")
        oFun.Grid_ColumnTitle(grid, "percOriginal_m99", "" & cboAno.CallAno & " %")
        

    End Sub

#End Region

#Region " METAS DE VENDAS "

    Private Sub BuscarVendas_Metas_Original()

        Dim varReturn As String
        Dim vMes As Byte

        con = New SqlConnection(Conexao.gerBI_str)
        cmd = New SqlCommand("Metas.uspS_Meta_Original_Ano_Todos_Mes", con)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmd.Parameters("@Ano").Value = cboAno.CallAno

        If cboFilial.CallFilial = 199 Then
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = 99
        Else
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = cboFilial.CallFilial
        End If
        

        Try
            con.Open()
            dr = cmd.ExecuteReader()

            While dr.Read()

                vMes = dr.GetSqlByte(0)

                Select Case vMes
                    Case 1
                        vMetaOriginal_1 = dr.GetSqlMoney(1)
                    Case 2
                        vMetaOriginal_2 = dr.GetSqlMoney(1)
                    Case 3
                        vMetaOriginal_3 = dr.GetSqlMoney(1)
                    Case 4
                        vMetaOriginal_4 = dr.GetSqlMoney(1)
                    Case 5
                        vMetaOriginal_5 = dr.GetSqlMoney(1)
                    Case 6
                        vMetaOriginal_6 = dr.GetSqlMoney(1)
                    Case 6
                        vMetaOriginal_6 = dr.GetSqlMoney(1)
                    Case 7
                        vMetaOriginal_7 = dr.GetSqlMoney(1)
                    Case 8
                        vMetaOriginal_8 = dr.GetSqlMoney(1)
                    Case 9
                        vMetaOriginal_9 = dr.GetSqlMoney(1)
                    Case 10
                        vMetaOriginal_10 = dr.GetSqlMoney(1)
                    Case 12
                        vMetaOriginal_12 = dr.GetSqlMoney(1)
                End Select


            End While
        Catch ex As Exception
            varReturn = "Função: 'BuscarVendas_Metas' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()
        End Try

    End Sub

    Private Sub BuscarVendas_Metas()

        Dim varReturn As String
        Dim vMes As Byte

        con = New SqlConnection(Conexao.gerMetas)
        cmd = New SqlCommand("Vendas.uspS_Meta_Revista_Ano_Todos_Mes", con)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmd.Parameters("@Ano").Value = cboAno.CallAno

        If cboFilial.CallFilial = 199 Then
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = 99
        Else
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = cboFilial.CallFilial
        End If

        

        Try
            con.Open()
            dr = cmd.ExecuteReader()

            While dr.Read()

                vMes = dr.GetSqlByte(0)

                Select Case vMes
                    Case 1
                        vMetaRevista_1 = dr.GetSqlMoney(1)
                    Case 2
                        vMetaRevista_2 = dr.GetSqlMoney(1)
                    Case 3
                        vMetaRevista_3 = dr.GetSqlMoney(1)
                    Case 4
                        vMetaRevista_4 = dr.GetSqlMoney(1)
                    Case 5
                        vMetaRevista_5 = dr.GetSqlMoney(1)
                    Case 6
                        vMetaRevista_6 = dr.GetSqlMoney(1)
                    Case 6
                        vMetaRevista_6 = dr.GetSqlMoney(1)
                    Case 7
                        vMetaRevista_7 = dr.GetSqlMoney(1)
                    Case 8
                        vMetaRevista_8 = dr.GetSqlMoney(1)
                    Case 9
                        vMetaRevista_9 = dr.GetSqlMoney(1)
                    Case 10
                        vMetaRevista_10 = dr.GetSqlMoney(1)
                    Case 12
                        vMetaRevista_12 = dr.GetSqlMoney(1)
                End Select


            End While
        Catch ex As Exception
            varReturn = "Função: 'BuscarVendas_Metas' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()
        End Try

    End Sub

    Private Sub BuscarVendas_Realizado()

        Dim varReturn As String
        Dim vMes As Byte

        con = New SqlConnection(Conexao.DW_str)
        cmd = New SqlCommand("Mes.usp_Realizado_Total_Ano_Todos_Meses", con)
        cmd.CommandType = System.Data.CommandType.StoredProcedure

        cmd.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmd.Parameters("@Ano").Value = cboAno.CallAno

        If cboFilial.CallFilial = 199 Then
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = 99
        Else
            cmd.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
            cmd.Parameters("@idFilial").Value = cboFilial.CallFilial
        End If
        

        Try
            con.Open()
            dr = cmd.ExecuteReader()

            While dr.Read()

                vMes = dr.GetSqlByte(0)

                Select Case vMes
                    Case 1
                        vRealizado_1 = dr.GetSqlMoney(1)
                    Case 2
                        vRealizado_2 = dr.GetSqlMoney(1)
                    Case 3
                        vRealizado_3 = dr.GetSqlMoney(1)
                    Case 4
                        vRealizado_4 = dr.GetSqlMoney(1)
                    Case 5
                        vRealizado_5 = dr.GetSqlMoney(1)
                    Case 6
                        vRealizado_6 = dr.GetSqlMoney(1)
                    Case 6
                        vRealizado_6 = dr.GetSqlMoney(1)
                    Case 7
                        vRealizado_7 = dr.GetSqlMoney(1)
                    Case 8
                        vRealizado_8 = dr.GetSqlMoney(1)
                    Case 9
                        vRealizado_9 = dr.GetSqlMoney(1)
                    Case 10
                        vRealizado_10 = dr.GetSqlMoney(1)
                    Case 12
                        vRealizado_12 = dr.GetSqlMoney(1)
                End Select

            End While
        Catch ex As Exception
            varReturn = "Função: 'BuscarVendas_Realizado' Erro: " & Err.Number & " - " & Err.Description
        Finally
            con.Close()
        End Try


    End Sub

#End Region

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m1", "vlrOriginal_m1", vMetaOriginal_1)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m2", "vlrOriginal_m2", vMetaOriginal_2)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m3", "vlrOriginal_m3", vMetaOriginal_3)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m4", "vlrOriginal_m4", vMetaOriginal_4)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m5", "vlrOriginal_m5", vMetaOriginal_5)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m6", "vlrOriginal_m6", vMetaOriginal_6)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m7", "vlrOriginal_m7", vMetaOriginal_7)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m8", "vlrOriginal_m8", vMetaOriginal_8)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m9", "vlrOriginal_m9", vMetaOriginal_9)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m10", "vlrOriginal_m10", vMetaOriginal_10)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m11", "vlrOriginal_m11", vMetaOriginal_11)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percOriginal_m12", "vlrOriginal_m12", vMetaOriginal_12)

        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m1", "vlrRevista_m1", vMetaRevista_1)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m2", "vlrRevista_m2", vMetaRevista_2)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m3", "vlrRevista_m3", vMetaRevista_3)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m4", "vlrRevista_m4", vMetaRevista_4)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m5", "vlrRevista_m5", vMetaRevista_5)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m6", "vlrRevista_m6", vMetaRevista_6)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m7", "vlrRevista_m7", vMetaRevista_7)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m8", "vlrRevista_m8", vMetaRevista_8)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m9", "vlrRevista_m9", vMetaRevista_9)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m10", "vlrRevista_m10", vMetaRevista_10)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m11", "vlrRevista_m11", vMetaRevista_11)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRevista_m12", "vlrRevista_m12", vMetaRevista_12)

        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m1", "vlrRealizado_m1", vRealizado_1)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m2", "vlrRealizado_m2", vRealizado_2)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m3", "vlrRealizado_m3", vRealizado_3)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m4", "vlrRealizado_m4", vRealizado_4)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m5", "vlrRealizado_m5", vRealizado_5)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m6", "vlrRealizado_m6", vRealizado_6)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m7", "vlrRealizado_m7", vRealizado_7)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m8", "vlrRealizado_m8", vRealizado_8)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m9", "vlrRealizado_m9", vRealizado_9)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m10", "vlrRealizado_m10", vRealizado_10)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m11", "vlrRealizado_m11", vRealizado_11)
        oFun.Grid_Footer_Calculate_VendaInformada(sender, e, grid, "percRealizado_m12", "vlrRealizado_m12", vRealizado_12)


    End Sub




    'Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

    '    On Error Resume Next

    '    'oFun.Grid_Footer_Calculate_Detail()
    '    oFun.Grid_Footer_Calculate(sender, e, grid, "percRealizado_m1", "vlrRealizado_m1", lblInfo.Text, Funcoes.CalculateType.ValueOverRevenue)


    '    'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
    '    '    vlrRealizado_m1 = 0
    '    '    vlrRealizado_m2 = 0
    '    '    vlrRealizado_m3 = 0
    '    '    vlrRealizado_m4 = 0
    '    '    vlrRealizado_m5 = 0
    '    '    vlrRealizado_m6 = 0
    '    '    vlrRealizado_m7 = 0
    '    '    vlrRealizado_m8 = 0
    '    '    vlrRealizado_m9 = 0
    '    '    vlrRealizado_m10 = 0
    '    '    vlrRealizado_m11 = 0
    '    '    vlrRealizado_m12 = 0
    '    '    vlrRealizado_m99 = 0

    '    '    percRealizado_m1 = 0
    '    '    percRealizado_m2 = 0
    '    '    percRealizado_m3 = 0
    '    '    percRealizado_m4 = 0
    '    '    percRealizado_m5 = 0
    '    '    percRealizado_m6 = 0
    '    '    percRealizado_m7 = 0
    '    '    percRealizado_m8 = 0
    '    '    percRealizado_m9 = 0
    '    '    percRealizado_m10 = 0
    '    '    percRealizado_m11 = 0
    '    '    percRealizado_m12 = 0
    '    '    percRealizado_m99 = 0

    '    '    ' REVISTA
    '    '    vlrRevista_m1 = 0
    '    '    vlrRevista_m2 = 0
    '    '    vlrRevista_m3 = 0
    '    '    vlrRevista_m4 = 0
    '    '    vlrRevista_m5 = 0
    '    '    vlrRevista_m6 = 0
    '    '    vlrRevista_m7 = 0
    '    '    vlrRevista_m8 = 0
    '    '    vlrRevista_m9 = 0
    '    '    vlrRevista_m10 = 0
    '    '    vlrRevista_m11 = 0
    '    '    vlrRevista_m12 = 0
    '    '    vlrRevista_m99 = 0

    '    '    percRevista_m1 = 0
    '    '    percRevista_m2 = 0
    '    '    percRevista_m3 = 0
    '    '    percRevista_m4 = 0
    '    '    percRevista_m5 = 0
    '    '    percRevista_m6 = 0
    '    '    percRevista_m7 = 0
    '    '    percRevista_m8 = 0
    '    '    percRevista_m9 = 0
    '    '    percRevista_m10 = 0
    '    '    percRevista_m11 = 0
    '    '    percRevista_m12 = 0
    '    '    percRevista_m99 = 0

    '    'End If
    '    'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

    '    '    Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
    '    '    If myFilter = 14 Then
    '    '        vlrRealizado_m1 += Convert.ToDecimal(e.GetValue("vlrRealizado_m1"))
    '    '        vlrRealizado_m2 += Convert.ToDecimal(e.GetValue("vlrRealizado_m2"))
    '    '        vlrRealizado_m3 += Convert.ToDecimal(e.GetValue("vlrRealizado_m3"))
    '    '        vlrRealizado_m4 += Convert.ToDecimal(e.GetValue("vlrRealizado_m4"))
    '    '        vlrRealizado_m5 += Convert.ToDecimal(e.GetValue("vlrRealizado_m5"))
    '    '        vlrRealizado_m6 += Convert.ToDecimal(e.GetValue("vlrRealizado_m6"))
    '    '        vlrRealizado_m7 += Convert.ToDecimal(e.GetValue("vlrRealizado_m7"))
    '    '        vlrRealizado_m8 += Convert.ToDecimal(e.GetValue("vlrRealizado_m8"))
    '    '        vlrRealizado_m9 += Convert.ToDecimal(e.GetValue("vlrRealizado_m9"))
    '    '        vlrRealizado_m10 += Convert.ToDecimal(e.GetValue("vlrRealizado_m10"))
    '    '        vlrRealizado_m11 += Convert.ToDecimal(e.GetValue("vlrRealizado_m11"))
    '    '        vlrRealizado_m12 += Convert.ToDecimal(e.GetValue("vlrRealizado_m12"))
    '    '        vlrRealizado_m99 += Convert.ToDecimal(e.GetValue("vlrRealizado_m99"))

    '    '        percRealizado_m1 += Convert.ToDecimal(e.GetValue("percRealizado_m1"))
    '    '        percRealizado_m2 += Convert.ToDecimal(e.GetValue("percRealizado_m2"))
    '    '        percRealizado_m3 += Convert.ToDecimal(e.GetValue("percRealizado_m3"))
    '    '        percRealizado_m4 += Convert.ToDecimal(e.GetValue("percRealizado_m4"))
    '    '        percRealizado_m5 += Convert.ToDecimal(e.GetValue("percRealizado_m5"))
    '    '        percRealizado_m6 += Convert.ToDecimal(e.GetValue("percRealizado_m6"))
    '    '        percRealizado_m7 += Convert.ToDecimal(e.GetValue("percRealizado_m7"))
    '    '        percRealizado_m8 += Convert.ToDecimal(e.GetValue("percRealizado_m8"))
    '    '        percRealizado_m9 += Convert.ToDecimal(e.GetValue("percRealizado_m9"))
    '    '        percRealizado_m10 += Convert.ToDecimal(e.GetValue("percRealizado_m10"))
    '    '        percRealizado_m11 += Convert.ToDecimal(e.GetValue("percRealizado_m11"))
    '    '        percRealizado_m12 += Convert.ToDecimal(e.GetValue("percRealizado_m12"))
    '    '        percRealizado_m99 += Convert.ToDecimal(e.GetValue("percRealizado_m99"))

    '    '        'REVISTA
    '    '        vlrRevista_m1 += Convert.ToDecimal(e.GetValue("vlrRevista_m1"))
    '    '        vlrRevista_m2 += Convert.ToDecimal(e.GetValue("vlrRevista_m2"))
    '    '        vlrRevista_m3 += Convert.ToDecimal(e.GetValue("vlrRevista_m3"))
    '    '        vlrRevista_m4 += Convert.ToDecimal(e.GetValue("vlrRevista_m4"))
    '    '        vlrRevista_m5 += Convert.ToDecimal(e.GetValue("vlrRevista_m5"))
    '    '        vlrRevista_m6 += Convert.ToDecimal(e.GetValue("vlrRevista_m6"))
    '    '        vlrRevista_m7 += Convert.ToDecimal(e.GetValue("vlrRevista_m7"))
    '    '        vlrRevista_m8 += Convert.ToDecimal(e.GetValue("vlrRevista_m8"))
    '    '        vlrRevista_m9 += Convert.ToDecimal(e.GetValue("vlrRevista_m9"))
    '    '        vlrRevista_m10 += Convert.ToDecimal(e.GetValue("vlrRevista_m10"))
    '    '        vlrRevista_m11 += Convert.ToDecimal(e.GetValue("vlrRevista_m11"))
    '    '        vlrRevista_m12 += Convert.ToDecimal(e.GetValue("vlrRevista_m12"))
    '    '        vlrRevista_m99 += Convert.ToDecimal(e.GetValue("vlrRevista_m99"))

    '    '        percRevista_m1 += Convert.ToDecimal(e.GetValue("percRevista_m1"))
    '    '        percRevista_m2 += Convert.ToDecimal(e.GetValue("percRevista_m2"))
    '    '        percRevista_m3 += Convert.ToDecimal(e.GetValue("percRevista_m3"))
    '    '        percRevista_m4 += Convert.ToDecimal(e.GetValue("percRevista_m4"))
    '    '        percRevista_m5 += Convert.ToDecimal(e.GetValue("percRevista_m5"))
    '    '        percRevista_m6 += Convert.ToDecimal(e.GetValue("percRevista_m6"))
    '    '        percRevista_m7 += Convert.ToDecimal(e.GetValue("percRevista_m7"))
    '    '        percRevista_m8 += Convert.ToDecimal(e.GetValue("percRevista_m8"))
    '    '        percRevista_m9 += Convert.ToDecimal(e.GetValue("percRevista_m9"))
    '    '        percRevista_m10 += Convert.ToDecimal(e.GetValue("percRevista_m10"))
    '    '        percRevista_m11 += Convert.ToDecimal(e.GetValue("percRevista_m11"))
    '    '        percRevista_m12 += Convert.ToDecimal(e.GetValue("percRevista_m12"))
    '    '        percRevista_m99 += Convert.ToDecimal(e.GetValue("percRevista_m99"))

    '    '    End If

    '    'End If
    '    'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m1" Then e.TotalValue = vlrRealizado_m1
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m2" Then e.TotalValue = vlrRealizado_m2
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m3" Then e.TotalValue = vlrRealizado_m3
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m4" Then e.TotalValue = vlrRealizado_m4
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m5" Then e.TotalValue = vlrRealizado_m5
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m6" Then e.TotalValue = vlrRealizado_m6
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m7" Then e.TotalValue = vlrRealizado_m7
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m8" Then e.TotalValue = vlrRealizado_m8
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m9" Then e.TotalValue = vlrRealizado_m9
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m10" Then e.TotalValue = vlrRealizado_m10
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m11" Then e.TotalValue = vlrRealizado_m11
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m12" Then e.TotalValue = vlrRealizado_m12
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealizado_m99" Then e.TotalValue = vlrRealizado_m99

    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m1" Then e.TotalValue = percRealizado_m1
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m2" Then e.TotalValue = percRealizado_m2
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m3" Then e.TotalValue = percRealizado_m3
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m4" Then e.TotalValue = percRealizado_m4
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m5" Then e.TotalValue = percRealizado_m5
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m6" Then e.TotalValue = percRealizado_m6
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m7" Then e.TotalValue = percRealizado_m7
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m8" Then e.TotalValue = percRealizado_m8
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m9" Then e.TotalValue = percRealizado_m9
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m10" Then e.TotalValue = percRealizado_m10
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m11" Then e.TotalValue = percRealizado_m11
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m12" Then e.TotalValue = percRealizado_m12
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealizado_m99" Then e.TotalValue = percRealizado_m99

    '    '    ' REVISTA
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m1" Then e.TotalValue = vlrRevista_m1
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m2" Then e.TotalValue = vlrRevista_m2
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m3" Then e.TotalValue = vlrRevista_m3
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m4" Then e.TotalValue = vlrRevista_m4
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m5" Then e.TotalValue = vlrRevista_m5
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m6" Then e.TotalValue = vlrRevista_m6
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m7" Then e.TotalValue = vlrRevista_m7
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m8" Then e.TotalValue = vlrRevista_m8
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m9" Then e.TotalValue = vlrRevista_m9
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m10" Then e.TotalValue = vlrRevista_m10
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m11" Then e.TotalValue = vlrRevista_m11
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m12" Then e.TotalValue = vlrRevista_m12
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRevista_m99" Then e.TotalValue = vlrRevista_m99

    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m1" Then e.TotalValue = percRevista_m1
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m2" Then e.TotalValue = percRevista_m2
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m3" Then e.TotalValue = percRevista_m3
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m4" Then e.TotalValue = percRevista_m4
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m5" Then e.TotalValue = percRevista_m5
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m6" Then e.TotalValue = percRevista_m6
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m7" Then e.TotalValue = percRevista_m7
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m8" Then e.TotalValue = percRevista_m8
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m9" Then e.TotalValue = percRevista_m9
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m10" Then e.TotalValue = percRevista_m10
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m11" Then e.TotalValue = percRevista_m11
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m12" Then e.TotalValue = percRevista_m12
    '    '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRevista_m99" Then e.TotalValue = percRevista_m99

    '    'End If


    'End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        ' REALIZADO 
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m1")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m2")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m3")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m4")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m5")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m6")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m7")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m8")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m9")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m10")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m11")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m12")
        oFun.Grid_RedIsNegative(e, "vlrRealizado_m99")

        oFun.Grid_RedIsNegative(e, "percRealizado_m1")
        oFun.Grid_RedIsNegative(e, "percRealizado_m2")
        oFun.Grid_RedIsNegative(e, "percRealizado_m3")
        oFun.Grid_RedIsNegative(e, "percRealizado_m4")
        oFun.Grid_RedIsNegative(e, "percRealizado_m5")
        oFun.Grid_RedIsNegative(e, "percRealizado_m6")
        oFun.Grid_RedIsNegative(e, "percRealizado_m7")
        oFun.Grid_RedIsNegative(e, "percRealizado_m8")
        oFun.Grid_RedIsNegative(e, "percRealizado_m9")
        oFun.Grid_RedIsNegative(e, "percRealizado_m10")
        oFun.Grid_RedIsNegative(e, "percRealizado_m11")
        oFun.Grid_RedIsNegative(e, "percRealizado_m12")
        oFun.Grid_RedIsNegative(e, "percRealizado_m99")

        ' REVISTA 
        oFun.Grid_RedIsNegative(e, "vlrRevista_m1")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m2")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m3")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m4")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m5")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m6")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m7")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m8")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m9")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m10")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m11")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m12")
        oFun.Grid_RedIsNegative(e, "vlrRevista_m99")

        oFun.Grid_RedIsNegative(e, "percRevista_m1")
        oFun.Grid_RedIsNegative(e, "percRevista_m2")
        oFun.Grid_RedIsNegative(e, "percRevista_m3")
        oFun.Grid_RedIsNegative(e, "percRevista_m4")
        oFun.Grid_RedIsNegative(e, "percRevista_m5")
        oFun.Grid_RedIsNegative(e, "percRevista_m6")
        oFun.Grid_RedIsNegative(e, "percRevista_m7")
        oFun.Grid_RedIsNegative(e, "percRevista_m8")
        oFun.Grid_RedIsNegative(e, "percRevista_m9")
        oFun.Grid_RedIsNegative(e, "percRevista_m10")
        oFun.Grid_RedIsNegative(e, "percRevista_m11")
        oFun.Grid_RedIsNegative(e, "percRevista_m12")
        oFun.Grid_RedIsNegative(e, "percRevista_m99")

        ' Original 
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m1")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m2")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m3")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m4")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m5")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m6")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m7")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m8")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m9")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m10")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m11")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m12")
        oFun.Grid_RedIsNegative(e, "vlrOriginal_m99")

        oFun.Grid_RedIsNegative(e, "percOriginal_m1")
        oFun.Grid_RedIsNegative(e, "percOriginal_m2")
        oFun.Grid_RedIsNegative(e, "percOriginal_m3")
        oFun.Grid_RedIsNegative(e, "percOriginal_m4")
        oFun.Grid_RedIsNegative(e, "percOriginal_m5")
        oFun.Grid_RedIsNegative(e, "percOriginal_m6")
        oFun.Grid_RedIsNegative(e, "percOriginal_m7")
        oFun.Grid_RedIsNegative(e, "percOriginal_m8")
        oFun.Grid_RedIsNegative(e, "percOriginal_m9")
        oFun.Grid_RedIsNegative(e, "percOriginal_m10")
        oFun.Grid_RedIsNegative(e, "percOriginal_m11")
        oFun.Grid_RedIsNegative(e, "percOriginal_m12")
        oFun.Grid_RedIsNegative(e, "percOriginal_m99")

    End Sub

    Private Sub Ocultar_Exibir_Meta_Original(ByVal True_False As Boolean)

        oFun.Grid_Column_Visible(grid, "vlrOriginal_m1", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m2", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m3", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m4", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m5", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m6", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m7", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m8", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m9", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m10", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m11", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m12", True_False)
        oFun.Grid_Column_Visible(grid, "vlrOriginal_m99", True_False)

        oFun.Grid_Column_Visible(grid, "percOriginal_m1", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m2", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m3", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m4", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m5", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m6", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m7", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m8", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m9", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m10", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m11", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m12", True_False)
        oFun.Grid_Column_Visible(grid, "percOriginal_m99", True_False)

        oFun.Grid_Column_Visible(grid, "bandOriginal_m1", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m2", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m3", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m4", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m5", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m6", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m7", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m8", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m9", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m10", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m11", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m12", True_False)
        oFun.Grid_Column_Visible(grid, "bandOriginal_m99", True_False)

    End Sub

    Private Sub Ocultar_Exibir_Meta_Revista(ByVal True_False As Boolean)

        oFun.Grid_Column_Visible(grid, "vlrRevista_m1", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m2", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m3", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m4", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m5", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m6", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m7", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m8", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m9", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m10", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m11", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m12", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRevista_m99", True_False)

        oFun.Grid_Column_Visible(grid, "percRevista_m1", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m2", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m3", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m4", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m5", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m6", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m7", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m8", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m9", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m10", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m11", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m12", True_False)
        oFun.Grid_Column_Visible(grid, "percRevista_m99", True_False)

        oFun.Grid_Column_Visible(grid, "bandRevista_m1", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m2", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m3", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m4", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m5", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m6", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m7", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m8", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m9", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m10", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m11", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m12", True_False)
        oFun.Grid_Column_Visible(grid, "bandRevista_m99", True_False)

    End Sub

    Private Sub Ocultar_Exibir_Realizado(ByVal True_False As Boolean)

        oFun.Grid_Column_Visible(grid, "vlrRealizado_m1", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m2", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m3", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m4", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m5", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m6", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m7", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m8", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m9", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m10", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m11", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m12", True_False)
        oFun.Grid_Column_Visible(grid, "vlrRealizado_m99", True_False)

        oFun.Grid_Column_Visible(grid, "percRealizado_m1", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m2", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m3", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m4", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m5", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m6", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m7", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m8", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m9", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m10", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m11", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m12", True_False)
        oFun.Grid_Column_Visible(grid, "percRealizado_m99", True_False)

        oFun.Grid_Column_Visible(grid, "bandRealizado_m1", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m2", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m3", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m4", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m5", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m6", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m7", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m8", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m9", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m10", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m11", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m12", True_False)
        oFun.Grid_Column_Visible(grid, "bandRealizado_m99", True_False)

    End Sub


    Private Sub Show_Hide_Mes()

        oFun.CheckBoxStatusExibir(chkMes01, grid, "band_Mes_01")
        oFun.CheckBoxStatusExibir(chkMes02, grid, "band_Mes_02")
        oFun.CheckBoxStatusExibir(chkMes03, grid, "band_Mes_03")

        oFun.CheckBoxStatusExibir(chkMes04, grid, "band_Mes_04")
        oFun.CheckBoxStatusExibir(chkMes05, grid, "band_Mes_05")
        oFun.CheckBoxStatusExibir(chkMes06, grid, "band_Mes_06")
        oFun.CheckBoxStatusExibir(chkMes07, grid, "band_Mes_07")
        oFun.CheckBoxStatusExibir(chkMes08, grid, "band_Mes_08")
        oFun.CheckBoxStatusExibir(chkMes09, grid, "band_Mes_09")
        oFun.CheckBoxStatusExibir(chkMes10, grid, "band_Mes_10")
        oFun.CheckBoxStatusExibir(chkMes11, grid, "band_Mes_11")
        oFun.CheckBoxStatusExibir(chkMes12, grid, "band_Mes_12")

        oFun.CheckBoxStatusExibir(chkAno, grid, "band_Ano")

        'If chk.Checked = True Then
        '    oFun.Grid_Column_Visible(grid, iControle, True_False)
        'Else
        '    oFun.Grid_Column_Visible(grid, iControle, True_False)
        'End If


    End Sub


    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub MudarTitulo()

        Dim vAno As Integer
        vAno = cboAno.CallAno

        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m1", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m2", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m3", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m4", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m5", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m6", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m7", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m8", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m9", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m10", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m11", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRealizado_m12", vAno & " R$")

        oFun.Grid_ColumnTitle(grid, "percRealizado_m1", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m2", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m3", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m4", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m5", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m6", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m7", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m8", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m9", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m10", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m11", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRealizado_m12", vAno & " %")


        oFun.Grid_ColumnTitle(grid, "vlrRevista_m1", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m2", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m3", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m4", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m5", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m6", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m7", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m8", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m9", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m10", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m11", vAno & " R$")
        oFun.Grid_ColumnTitle(grid, "vlrRevista_m12", vAno & " R$")

        oFun.Grid_ColumnTitle(grid, "percRevista_m1", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m2", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m3", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m4", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m5", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m6", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m7", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m8", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m9", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m10", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m11", vAno & " %")
        oFun.Grid_ColumnTitle(grid, "percRevista_m12", vAno & " %")

    End Sub



End Class
