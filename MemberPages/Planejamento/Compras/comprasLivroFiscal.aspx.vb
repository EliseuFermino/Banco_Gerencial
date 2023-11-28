
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Xpf.Editors.Helpers
Imports DevExpress.XtraSpreadsheet.Forms


Partial Class MemberPages_Planejamento_Compras_comprasLivroFiscal
    Inherits System.Web.UI.Page

    Private vFilial As Int16
    Private vDepartamento As String
    Dim oProj As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            'oVem.AtualizarEstatisticaPrograma(436, User.Identity.Name)
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "lastData();", True)

            carregaSelects()

            'selUnidade.SelectedValue = 99
            'Session("sFilial") = selUnidade.SelectedValue

            If txtData.Value > "" Then
                Session("sData") = txtData.Value.ToString()
                Session("sMes") = Month(txtData.Value).ToString()
                Session("sAno") = Year(txtData.Value).ToString()

            Else
                Session("sData") = Format(CDate(Now.Date().AddDays(-1)), "dd/MM/yyyy").ToString()
                Session("sMes") = Month(Now.Date().AddDays(-1)).ToString()
                Session("sAno") = Year(Now.Date().AddDays(-1)).ToString()
            End If


            Select Case selVisao.SelectedValue
                Case 1
                    gridPanelDia.Visible = True
                    gridPanelMes.Visible = False
                    gridPanelAno.Visible = False
                    divDia.Visible = True
                    divMes.Visible = False
                    divAno.Visible = False
                    divUnidade.Visible = True
                Case 2
                    gridPanelDia.Visible = False
                    gridPanelMes.Visible = True
                    gridPanelAno.Visible = False
                    divDia.Visible = False
                    divMes.Visible = True
                    divAno.Visible = True
                    divUnidade.Visible = False
                Case 3
                    gridPanelDia.Visible = False
                    gridPanelMes.Visible = False
                    gridPanelAno.Visible = True
                    divDia.Visible = False
                    divMes.Visible = False
                    divAno.Visible = True
                    divUnidade.Visible = False
            End Select

        End If
    End Sub

    Private Sub carregaSelects()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim selectSQL As String = "SELECT Filial ,RTRIM(FilialLista) AS nomeFilial FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE (IdLojasCDs=1 or isAtacarejo = 1) and Filial not in (100) Or Filial In (99)  ORDER BY nomeFilial"
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            selUnidade.DataSource = cmd.ExecuteReader()
            selUnidade.DataTextField = "nomeFilial"
            selUnidade.DataValueField = "Filial"

            'Activate the binding.
            selUnidade.DataBind()

            con.Close()

            selUnidade.SelectedValue = Session("sFilial")

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try

        selAno.Items.Clear()
        selAno.Items.Insert(0, New ListItem(Now.Year().ToString(), Now.Year().ToString()))
        selAno.Items.Insert(1, New ListItem(Now.Year() - 1.ToString(), Now.Year() - 1.ToString()))
        selAno.Items.Insert(2, New ListItem(Now.Year() - 2.ToString(), Now.Year() - 2.ToString()))
        selAno.Items.Insert(3, New ListItem(Now.Year() - 3.ToString(), Now.Year() - 3.ToString()))
        selAno.Items.Insert(4, New ListItem(Now.Year() - 4.ToString(), Now.Year() - 4.ToString()))
        selAno.SelectedIndex = 0

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

        Session("sFilial") = selUnidade.SelectedValue

        Select Case selVisao.SelectedValue
            Case 1
                Session("sData") = txtData.Value
                gridPanelDia.Visible = True
                gridPanelMes.Visible = False
                gridPanelAno.Visible = False
                divDia.Visible = True
                divMes.Visible = False
                divAno.Visible = False
                divUnidade.Visible = True
                grvDadosDia.DataBind()
            Case 2
                Session("sMes") = selMes.SelectedValue
                Session("sAno") = selAno.SelectedValue
                gridPanelDia.Visible = False
                gridPanelMes.Visible = True
                gridPanelAno.Visible = False
                divDia.Visible = False
                divMes.Visible = True
                divAno.Visible = True
                divUnidade.Visible = False
                grvDadosMes.DataBind()
            Case 3
                Session("sAno") = selAno.SelectedValue
                gridPanelDia.Visible = False
                gridPanelMes.Visible = False
                gridPanelAno.Visible = True
                divDia.Visible = False
                divMes.Visible = False
                divAno.Visible = True
                divUnidade.Visible = False
                grvDadosAno.DataBind()
        End Select
    End Sub

    Protected Sub gridPanelDia_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles gridPanelDia.Callback
        grvDadosDia.DataBind()
    End Sub

    Protected Sub gridPanelMes_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles gridPanelMes.Callback
        grvDadosMes.DataBind()
    End Sub

    Protected Sub gridPanelAno_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles gridPanelAno.Callback
        grvDadosAno.DataBind()
    End Sub

    Protected Sub selVisao_SelectedIndexChanged(sender As Object, e As EventArgs)
        Select Case selVisao.SelectedValue
            Case 1
                'gridPanelDia.Visible = True
                'gridPanelMes.Visible = False
                'gridPanelAno.Visible = False
                divDia.Visible = True
                divMes.Visible = False
                divAno.Visible = False
                divUnidade.Visible = True

                ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "lastData();", True)
            Case 2
                'gridPanelDia.Visible = False
                'gridPanelMes.Visible = True
                'gridPanelAno.Visible = False
                divDia.Visible = False
                divMes.Visible = True
                divAno.Visible = True
                divUnidade.Visible = False
            Case 3
                'gridPanelDia.Visible = False
                'gridPanelMes.Visible = False
                'gridPanelAno.Visible = True
                divDia.Visible = False
                divMes.Visible = False
                divAno.Visible = True
                divUnidade.Visible = False
        End Select

    End Sub

End Class
