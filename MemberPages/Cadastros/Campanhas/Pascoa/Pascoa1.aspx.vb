Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Campanhas_Pascoa_Pascoa1
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(101, User.Identity.Name)

            oVem.Campanha_BuscarPeriodo(1, Year(Now()))

            Me.lblPeriodo1.Text = "Período:  " & Year(Now()) & ": " & oVem.Dia3 & " a " & oVem.Dia4 & " - " & oVem.Dia6 & " dias."
            Me.lblPeriodo2.Text = "Período:  " & Year(Now()) - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & " - " & oVem.Dia5 & " dias."

            Me.lblAnoAT.Text = Year(DateAndTime.Now())
            Me.lblAnoAA.Text = Year(DateAndTime.Now()) - 1

            Session("sCOD") = 0
            Call Atualizar()

        End If
    End Sub

#Region " Buscar Dados"

    Public Function Pascoa_BuscarMeta(ByVal iAno As Int32, ByVal iCod As Byte, ByVal iFilial As Byte, ByVal iMetaPascoa As Label, ByVal iCrescAnoAnterior As Label) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("gerencial.uspPascoaMeta_Buscar", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Cod", SqlDbType.TinyInt))
        comando.Parameters("@Cod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                iMetaPascoa.Text = CDbl(reader5.GetSqlMoney(5)).ToString("n0")
                iCrescAnoAnterior.Text = CDbl(reader5.GetSqlMoney(8)).ToString("n2")
            End While

        Catch ex As Exception
            iCrescAnoAnterior.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Function Pascoa_BuscarDadosAtuais(ByVal iAno As Int32, ByVal iCod As Byte, ByVal iFilial As Byte,
                                             ByVal iMargemRealizada As Label, ByVal iCrescimento As Label, ByVal iParticipacao As Label,
                                             ByVal iRealPascoa As Label, ByVal iRealPascoaAA As Label, ByVal iMargemRealizadaAA As Label,
                                             ByVal iParticipacaoAA As Label, iLucratividadeAT As Label, iLucratividadeAA As Label) As Double

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("gerencial.uspPascoaDadosAtuais_Buscar", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Cod", SqlDbType.TinyInt))
        comando.Parameters("@Cod").Value = iCod

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                iMargemRealizada.Text = CDbl(reader5.GetSqlMoney(10)).ToString("n2")
                iCrescimento.Text = CDbl(reader5.GetSqlMoney(11)).ToString("n2")
                iParticipacao.Text = CDbl(reader5.GetSqlMoney(12)).ToString("n2")
                iRealPascoa.Text = CDbl(reader5.GetSqlMoney(7)).ToString("n0")
                iRealPascoaAA.Text = CDbl(reader5.GetSqlMoney(6)).ToString("n0")
                iMargemRealizadaAA.Text = CDbl(reader5.GetSqlMoney(13)).ToString("n2")
                iParticipacaoAA.Text = CDbl(reader5.GetSqlMoney(14)).ToString("n2")

                iLucratividadeAT.Text = CDbl(reader5.GetSqlMoney(9)).ToString("n0")
                iLucratividadeAA.Text = CDbl(reader5.GetSqlMoney(8)).ToString("n0")

            End While

        Catch ex As Exception
            Me.lblCrescimento.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Private Sub Atualizar()
        Call Pascoa_BuscarMeta(Year(DateAndTime.Now()), Session("sCOD"), 99, Me.lblMetaPascoa, Me.lblCrescimento)
        Call Pascoa_BuscarMeta(Year(DateAndTime.Now()) - 1, Session("sCOD"), 99, Me.lblMetaPascoaAA, Me.lblCrescimentoAA)
        Call Pascoa_BuscarDadosAtuais(Year(DateAndTime.Now()), Session("sCOD"), 99, Me.lblMargemRealizada, Me.lblCrescimento, Me.lblParticipacao, Me.lblRealPascoa, Me.lblRealPascoaAA, Me.lblMargemRealizadaAA, Me.lblParticipacaoAA, Me.lblLucratividade, Me.lblLucratividadeAA)
        'Call Pascoa_BuscarDadosAtuais(2012, Session("sCOD"), 99, Me.lblMargemRealizadaAA, Me.lblCrescimentoAA, Me.lblParticipacaoAA, Me.lblRealPascoaAA)

        'Calculos
        Me.lblPercentualAtingimento.Text = ((Me.lblRealPascoa.Text / Me.lblMetaPascoa.Text) * 100).ToString("n2")
        Me.lblPercentualAtingimentoAA.Text = ((Me.lblRealPascoaAA.Text / Me.lblMetaPascoaAA.Text) * 100).ToString("n2")

        Me.lblRealPascoaDif.Text = CDbl(Me.lblRealPascoa.Text - Me.lblRealPascoaAA.Text).ToString("n0")
        Me.lblPercentualAtingimentoDif.Text = CDbl(((Me.lblPercentualAtingimento.Text / Me.lblPercentualAtingimentoAA.Text) * 100) - 100).ToString("n2")
        Me.lblMargemRealizadaDif.Text = CDbl(((Me.lblMargemRealizada.Text / Me.lblMargemRealizadaAA.Text) * 100) - 100).ToString("n2")
        Me.lblParticipacaoDif.Text = CDbl(((Me.lblParticipacao.Text / Me.lblParticipacaoAA.Text) * 100) - 100).ToString("n2")
        Me.lblMetaPascoaDif.Text = CDbl(Me.lblMetaPascoa.Text - Me.lblMetaPascoaAA.Text).ToString("n0")
        Me.lblCrescimentoDif.Text = CDbl(((Me.lblCrescimento.Text / Me.lblCrescimentoAA.Text) * 100) - 100).ToString("n2")
        Me.lblLucratividadeDif.Text = CDbl(((Me.lblLucratividade.Text / Me.lblLucratividadeAA.Text) * 100) - 100).ToString("n2")
    End Sub


#End Region

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Campanha da Páscoa - Capa de Abertura - PGR101"
        End If

    End Sub

End Class
