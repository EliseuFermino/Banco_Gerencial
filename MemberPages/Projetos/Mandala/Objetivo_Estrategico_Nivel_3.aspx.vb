Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Projetos_Mandala_Objetivo_Estrategico_Nivel_3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim nivel2_ID As Byte = Request.QueryString("nivel2")
            'lbl_Meta_x1.Text = nivel2_ID

            BuscarNivel3(nivel2_ID, 1)
            BuscarNivel3(nivel2_ID, 2)
            BuscarNivel3(nivel2_ID, 3)
            BuscarNivel3(nivel2_ID, 4)
            BuscarNivel3(nivel2_ID, 5)
            BuscarNivel3(nivel2_ID, 6)
            BuscarNivel3(nivel2_ID, 7)
            BuscarNivel3(nivel2_ID, 8)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = lbl_Meta_xCentro.Text
        End If
    End Sub


    Private Sub BuscarNivel3(ByVal nivel2_ID As Byte, ByVal numQuadrante As Byte)

        Dim con As New SqlConnection(Conexao.gerProjetos_str)
        Dim comando As New SqlCommand("Objetivo_Estrategico.usp_BuscarNivel3_Quadrante", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@nivel2_ID", SqlDbType.TinyInt))
        comando.Parameters("@nivel2_ID").Value = nivel2_ID

        comando.Parameters.Add(New SqlParameter("@numQuadrante", SqlDbType.TinyInt))
        comando.Parameters("@numQuadrante").Value = numQuadrante

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                lbl_Meta_xCentro.Text = reader5.GetSqlString(4).ToString()
                lbl_Nivel2_ID.Text = reader5.GetSqlString(5).ToString()

                If numQuadrante = 1 Then
                    lbl_Title_Q1.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x1.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q1.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 2 Then
                    lbl_Title_Q2.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x2.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q2.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 3 Then
                    lbl_Title_Q3.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x3.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q3.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 4 Then
                    lbl_Title_Q4.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x4.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q4.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 5 Then
                    lbl_Title_Q5.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x5.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q5.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 6 Then
                    lbl_Title_Q6.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x6.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q6.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 7 Then
                    lbl_Title_Q7.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x7.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q7.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

                If numQuadrante = 8 Then
                    lbl_Title_Q8.Text = reader5.GetSqlString(0).ToString() & " - " & reader5.GetSqlString(1).ToString()
                    lbl_Meta_x8.Text = reader5.GetSqlString(2).ToString()
                    lblEstimativa_Q8.Text = "Estimativa: " & reader5.GetSqlString(3).ToString()
                End If

            End While

        Catch ex As Exception
            lbl_Meta_x1.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs) Handles btnVoltar.Click

        Dim nivel2_ID As Byte = Request.QueryString("nivel2")

        Select Case nivel2_ID
            Case 11 To 18
                Response.Redirect("../Mandala/Objetivo_Estrategico_01.aspx")
            Case 21 To 28
                Response.Redirect("../Mandala/Objetivo_Estrategico_02.aspx")
            Case 31 To 38
                Response.Redirect("../Mandala/Objetivo_Estrategico_03.aspx")
            Case 41 To 48
                Response.Redirect("../Mandala/Objetivo_Estrategico_04.aspx")
            Case 51 To 58
                Response.Redirect("../Mandala/Objetivo_Estrategico_05.aspx")
            Case 61 To 68
                Response.Redirect("../Mandala/Objetivo_Estrategico_06.aspx")
            Case 71 To 78
                Response.Redirect("../Mandala/Objetivo_Estrategico_03.aspx")
            Case 81 To 88
                Response.Redirect("../Mandala/Objetivo_Estrategico_08.aspx")
        End Select

    End Sub

End Class
