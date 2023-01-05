
Partial Class MemberPages_Projetos_Mandala_Objtivo_Estrategico_Nivel_3_Lista
    Inherits System.Web.UI.Page

    Dim oDb As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim idNivel1 As Byte = Request.QueryString("nivel2")
            If idNivel1 = 0 Then
                grid_Nivel3.DataSourceID = "dsDados_Todos"
            Else
                grid_Nivel3.DataSourceID = "dsDados"
            End If
        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim idNivel1 As Byte = Request.QueryString("nivel2")

            If idNivel1 = 0 Then
                CType(Master.FindControl("lblTitle"), Label).Text = "Objetivo Estratégico - Plano de Ação de Todos os Niveis"
            Else
                CType(Master.FindControl("lblTitle"), Label).Text = "Objetivo Estratégico " & idNivel1 & ": " & oDb.ExecuteStoredProcedure_Scalar("Objetivo_Estrategico.usp_BuscarNivel1_Descricao", Conexao.gerProjetos_str, "idNivel_1", Request.QueryString("nivel2"))
            End If

        End If
    End Sub


    Protected Sub btnVoltar_Click(sender As Object, e As EventArgs) Handles btnVoltar.Click
        Response.Redirect("../Mandala/CapaMandala.aspx")
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            grid_Nivel3.DataBind()
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
End Class
