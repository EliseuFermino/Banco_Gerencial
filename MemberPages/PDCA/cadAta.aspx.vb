Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_cadAta
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(317, Page.User.Identity.Name)
            cboFilial.cboFilial_Visible_Legenda = False
            cboDia.Date = DateAndTime.Today
            Enabled_Fields_False()

            Session("sFILIAL") = cboFilial.CallFilial
            'lblError.Visible = False
        End If
    End Sub

    Private Sub Clear_Fields()

        txt_Assuntos.Text = ""
        txt_Decisao.Text = ""
        txt_Observacao.Text = ""
        txt_Participantes.Text = ""
        cboAta.Text = ""

    End Sub

    Private Sub Enabled_Fields_True()
        txt_Assuntos.Enabled = True
        txt_Decisao.Enabled = True
        txt_Observacao.Enabled = True
        txt_Participantes.Enabled = True

    End Sub

    Private Sub Enabled_Fields_False()
        txt_Assuntos.Enabled = False
        txt_Decisao.Enabled = False
        txt_Observacao.Enabled = False
        txt_Participantes.Enabled = False
    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
        btnNovo.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True
        Clear_Fields()
        Enabled_Fields_True()
        txt_Participantes.Focus()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True
        Clear_Fields()
        Enabled_Fields_False()
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim oDB As New clDataDb

        oDB.ExecuteStoredProcedure("PDCA.usp_Insert_Ata", Conexao.gerProjetos.ConnectionString, "@DataCadastro", cboDia.Value,
                                                                                                          "@Participantes", txt_Participantes.Text,
                                                                                                          "@Assuntos", txt_Assuntos.Text,
                                                                                                          "@Decisao", txt_Decisao.Text,
                                                                                                          "@Observacao", txt_Observacao.Text,
                                                                                                          "@idFilial", cboFilial.CallFilial
        )

        oVem.UserMsgBox(Me, "Ata salva com sucesso!!!")

        ' Descrição de Erro
        'lblError.Text = oDB.varDesc

        Enabled_Fields_False()
        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True

    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Clear_Fields()
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Sub Buscar_Ata()

        'oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & Me.cboAta.Value)


        'Dim idCat As String = Request.QueryString("idCat")
        'Dim idFilial As String = Request.QueryString("idFilial")

        'cboFilial.CallFilial = idFilial



        Dim con As New SqlConnection()
        con = Conexao.gerProjetos

        Dim comando As New SqlCommand("PDCA.usp_Buscar_Ata_porID", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@ID", Data.SqlDbType.Int))
        comando.Parameters("@ID").Value = Me.cboAta.Value 'CInt(Replace(Left(Me.cboAta.Value, 2), ";", ""))

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                cboDia.Text = CDate(reader5.GetSqlString(0).ToString())
                txt_Participantes.Text = Trim(reader5.GetSqlString(1).ToString())
                txt_Assuntos.Text = Trim(reader5.GetSqlString(2).ToString())
                txt_Decisao.Text = Trim(reader5.GetSqlString(3).ToString())
                txt_Observacao.Text = Trim(reader5.GetSqlString(4).ToString())
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub cboAta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboAta.SelectedIndexChanged
        Buscar_Ata()
    End Sub

End Class
