Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_planej04_PlanoAcao_All
    Inherits System.Web.UI.Page

    Dim cnnStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim varStatus As Byte

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        Dim oProjeto As New Projeto

        If Not IsPostBack() Then oVem.AtualizarEstatisticaPrograma(26, User.Identity.Name)

        varStatus = 1
        Session("idTela") = 4
    End Sub

    Public Sub UserMsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
        Catch ex As Exception

        End Try
    End Sub

    Function GerarTarefaID() As Int16

        Dim con As New SqlConnection(cnnStr)

        Dim comando As New SqlCommand("uspPlanoDeAcao_BuscarAta", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@TarefaID", Data.SqlDbType.SmallInt))
        comando.Parameters("@TarefaID").Value = Me.txtTarefaID.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                GerarTarefaID = reader5.GetSqlInt16(0).ToString
            End While

        Catch ex As Exception
            Beep()
            ' UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Protected Sub grid_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType = DevExpress.Web.GridViewRowType.Data Then
        End If
        Dim bidstat As String = Convert.ToString(grid.GetRowValuesByKeyValue(e.KeyValue, "StatusTarefa"))
        If bidstat = "Em Andamento" Then
            e.Row.ForeColor = System.Drawing.Color.RoyalBlue
        End If

        If bidstat = "Em Atraso" Then
            e.Row.BackColor = System.Drawing.Color.Red
            e.Row.ForeColor = System.Drawing.Color.White
        End If

        If bidstat = "Cancelado" Then
            e.Row.ForeColor = System.Drawing.Color.Black
        End If

        If bidstat = "Concluido" Then
            e.Row.ForeColor = System.Drawing.Color.DarkGreen
        End If
    End Sub

    Protected Sub panAta_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles panAta.PreRender
        Call BuscarAtas()
    End Sub

    Sub BuscarAtas()
        If Me.txtAtaID.Value = 0 Then
            Me.lblDia.Text = ""
            Me.txtMemoParticipantes.Text = ""
            Me.txtMemoObjetivos.Text = ""
            Me.txtMemoDiscussao.Text = ""
            Me.lblEtapa.Text = ""
            Me.lblSubProjeto.Text = ""
            Me.lblProjeto.Text = ""
            Me.lblAta.Text = ""
        Else
            Dim con As New SqlConnection(cnnStr)
            Dim strSQL As String = "SELECT projAta.ataDia, projAta.ataParticipantes, projAta.ataObjetivos, projAta.ataDiscussao, projProjetoSub.ProjetoSubDesc, projEtapas.etapaDesc " & _
                                   "FROM projAta INNER JOIN projProjetoSub ON projAta.SubProjetoID = projProjetoSub.ProjetoSubID INNER JOIN projEtapas ON projAta.EtapaID = projEtapas.EtapaID " & _
                                   "WHERE ataID = " & Me.txtAtaID.Value & ""
            Dim comando As New SqlCommand(strSQL, con)
            comando.CommandType = CommandType.Text
            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Me.lblDia.Text = reader5.GetSqlDateTime(0)
                    Me.txtMemoParticipantes.Text = Trim(reader5.GetSqlString(1).ToString())
                    Me.txtMemoObjetivos.Text = Trim(reader5.GetSqlString(2).ToString())
                    Me.txtMemoDiscussao.Text = Trim(reader5.GetSqlString(3).ToString())
                    Me.lblEtapa.Text = Trim(reader5.GetSqlString(5).ToString())
                    Me.lblSubProjeto.Text = Trim(reader5.GetSqlString(4).ToString())
                End While

                Me.lblAta.Text = Me.txtAtaID.Value
            Catch ex As Exception
                Beep()
                UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)
            Finally
                con.Close()
            End Try
        End If
    End Sub

    Protected Sub SqlDS2_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDS2.Selected
        If e.AffectedRows = 0 Then
            Me.btnAta.Enabled = False
        Else
            Me.btnAta.Enabled = True
        End If
    End Sub
  
 
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Projetos"
    End Sub
End Class
