
Partial Class MemberPages_Projetos_Mandala_Objtivo_Estrategico_Nivel_3_Lista_peloNivel2
    Inherits System.Web.UI.Page

    Dim oDb As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim idNivel1 As Byte = Request.QueryString("nivel2")

            CType(Master.FindControl("lblTitle"), Label).Text = "Objetivo Estratégico " & idNivel1 & ": " & oDb.ExecuteStoredProcedure_Scalar("Objetivo_Estrategico.usp_BuscarNivel2_Descricao", Conexao.gerProjetos_str, "idNivel_2", Request.QueryString("nivel2"))
        End If
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

    Protected Sub grid_Nivel3_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Nivel3.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "idStatus" Then
            If e.CellValue = "Concluido" Then
                e.Cell.BackColor = System.Drawing.Color.Blue
                e.Cell.ForeColor = System.Drawing.Color.White
            End If

            If e.CellValue = "Em Andamento" Then
                e.Cell.BackColor = System.Drawing.Color.Green
                e.Cell.ForeColor = System.Drawing.Color.White
            End If

            If e.CellValue = "Atrasado" Then
                e.Cell.BackColor = System.Drawing.Color.Red
                e.Cell.ForeColor = System.Drawing.Color.White
            End If

            If e.CellValue = "Abortado" Then
                e.Cell.BackColor = System.Drawing.Color.Black
                e.Cell.ForeColor = System.Drawing.Color.White
            End If

        End If
    End Sub

    Protected Sub popForm_WindowCallback(source As Object, e As DevExpress.Web.PopupWindowCallbackArgs) Handles popForm.WindowCallback
        txt_DataFinal.Date = ""
        txt_DataInicial.Date = ""


    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If txt_DataInicial.Text = "" Or txt_DataFinal.Text = "" Then
            oDb.ExecuteStoredProcedure_Projetos("Objetivo_Estrategico.usp_Nivel3_SemDataInicialFinal", Conexao.gerProjetos_str, "Obj_Estr_N3_ID", txt_Nivel3.Text, "Responsavel", txt_Responsavel.Text, "idStatus", cboStatus.Text)
            txtCOD.Text = oDb.varDesc & " aqui"
        Else
            oDb.ExecuteStoredProcedure_Projetos("Objetivo_Estrategico.usp_Nivel3", Conexao.gerProjetos_str, "Obj_Estr_N3_ID", txt_Nivel3.Text, "DataInicial", txt_DataInicial.Date, "DataFinal", txt_DataFinal.Date, "Responsavel", txt_Responsavel.Text, "idStatus", cboStatus.Text)
            txtCOD.Text = oDb.varDesc
        End If

        grid_Nivel3.DataBind()

        popForm.ShowOnPageLoad = False
        txtCOD.Text = oDb.varDesc
    End Sub

End Class
