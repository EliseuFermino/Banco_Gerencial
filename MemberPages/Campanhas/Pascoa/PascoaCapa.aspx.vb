Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Campanhas_Pascoa_PascoaCapa
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Private connManager As String = clData_gerManager.dbConnect



#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim varAno As Int16
       
            If Month(Now()) < 2 Then
                varAno = Year(Now()) - 1
            Else
                varAno = Year(Now())
            End If

            oVem.AtualizarEstatisticaPrograma(101, User.Identity.Name)

            cboFilial.AutoPostBack = True

            oVem.Campanha_BuscarPeriodo(1, varAno)

            Me.lblPeriodo1.Text = "Período:  " & varAno & ": " & oVem.Dia3 & " a " & oVem.Dia4 & " - " & oVem.Dia6 & " de 80 dias."
            Me.lblPeriodo2.Text = "Período:  " & varAno - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & " - " & oVem.Dia5 & " de 80 dias."
            Me.lblPeriodo3.Text = "Período:  " & varAno - 2 & ": " & oVem.Dia7 & " a " & oVem.Dia8 & " - " & oVem.Dia9 & " de 80 dias."

            Me.lblAnoAT.Text = varAno
            Me.lblAnoAA.Text = varAno - 1
            Me.lblAnoAA1.Text = varAno - 2

            Me.lblDescricaoAT.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno & " e " & varAno - 1 & ""
            Me.lblDescricaoAA.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno - 1 & " e " & varAno - 2 & ""
            Me.lblDescricaoAA1.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno - 2 & " e " & varAno - 3 & ""

            Session("sCOD") = 0

            'If Not cboFilial.IsLoja = True Then
            '    cboFilial.CallCorporacao = 3
            'Else
            '    cboFilial.CallCorporacao = 199
            'End If

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Campanha da Páscoa - Capa de Abertura - Empresa - PGR101"
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            'If Not cboFilial.IsLoja = True Then
            '    Session("sFILIAL") = 3
            'Else
            '    cboFilial.CallCorporacao = 199
            '    'Session("sFILIAL") = cboFilial.CallFilial
            'End If
            Session("sFILIAL") = cboFilial.CallFilial

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            btnAtualizar_Click(sender, e)
        End If
    End Sub

#End Region

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
            'iCrescAnoAnterior.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Public Sub Pascoa_BuscarTotalRealizadoPascoa(ByVal iAno As Int32, ByVal iCod As Byte, ByVal iFilial As Byte, ByVal iRealizadoPascoa As Label, ByVal iPercCresc As Label)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Gerencial.BuscarTotalRealizadoPascoa", con)
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
                iRealizadoPascoa.Text = CDbl(reader5.GetSqlMoney(0)).ToString("n0")
                iPercCresc.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            'iRealizadoPascoa.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Sub

    Sub Pascoa_BuscarPercCrescPascoa(ByVal iAno As Int16, ByVal iCod As Byte, ByVal iFilial As Byte, ByVal iPercCresc As Label)

        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("Gerencial.BuscarTotalRealizadoPascoa", con)
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
                iPercCresc.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
            End While

        Catch ex As Exception
            ' iPercCresc.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Sub

    Public Function Pascoa_BuscarDadosAtuais(ByVal iAno As Int32, ByVal iCod As Byte, ByVal iFilial As Byte,
                                             ByVal iMargemRealizada As Label, ByVal iCrescimento As Label, ByVal iParticipacao As Label,
                                             ByVal iRealPascoa As Label, ByVal iRealPascoaAA As Label, ByVal iMargemRealizadaAA As Label,
                                             ByVal iParticipacaoAA As Label, iLucratividadeAT As Label, iLucratividadeAA As Label,
                                             ByVal iRealPascoaAA1 As Label, ByVal iMargemRealizadaAA1 As Label, ByVal iLucratividadeAA1 As Label,
                                             ByVal iParticipacaoAA1 As Label, iPercMargemFinal As Label, iPercMargemFinal_AA As Label, iPercMargemFinal_AA1 As Label) As Double

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

                iRealPascoaAA1.Text = CDbl(reader5.GetSqlMoney(17)).ToString("n0")
                iMargemRealizadaAA1.Text = CDbl(reader5.GetSqlMoney(19)).ToString("n2")
                iLucratividadeAA1.Text = CDbl(reader5.GetSqlMoney(18)).ToString("n0")
                iParticipacaoAA1.Text = CDbl(reader5.GetSqlMoney(20)).ToString("n2")

                iPercMargemFinal.Text = CDbl(reader5.GetSqlMoney(21)).ToString("n2")
                iPercMargemFinal_AA.Text = CDbl(reader5.GetSqlMoney(22)).ToString("n2")
                iPercMargemFinal_AA1.Text = CDbl(reader5.GetSqlMoney(23)).ToString("n2")
            End While

        Catch ex As Exception
            'Me.lblCrescimento.Text = "Erro: " & ex.Message & "."

        Finally
            con.Close()
        End Try
    End Function

    Private Sub Atualizar()

        Dim varAno As Int16

        If Month(Now()) < 2 Then
            varAno = Year(Now()) - 1
        Else
            varAno = Year(Now())
        End If

        lblMetaPascoa.Text = 0
        lblCrescimento.Text = 0
        lblMargemPDV.Text = 0
        lblMargemFinal.Text = 0
        lblCrescimento.Text = 0
        lblParticipacao.Text = 0
        lblRealPascoa.Text = 0
        lblRealPascoaAA.Text = 0
        lblMargemPDV_AA.Text = 0
        lblMargemFinal_AA.Text = 0
        lblParticipacaoAA.Text = 0
        lblLucratividade.Text = 0
        lblLucratividadeAA.Text = 0
        lblRealPascoaAA1.Text = 0
        lblMargemPDV_AA1.Text = 0
        lblMargemFinal_AA1.Text = 0
        lblLucratividadeAA1.Text = 0
        lblParticipacaoAA1.Text = 0

        lblMetaPascoaAA.Text = 0
        lblCrescimentoAA.Text = 0
        lblMetaPascoaAA1.Text = 0
        lblCrescimentoAA1.Text = 0



        'Meta de Pascoa. Ano 2015
        Call Pascoa_BuscarMeta(varAno, Session("sCOD"), Session("sFILIAL"), Me.lblMetaPascoa, Me.lblCrescimento)

        ' MARGEM REALIZADA
        Call Pascoa_BuscarDadosAtuais(varAno, Session("sCOD"), Session("sFILIAL"), Me.lblMargemPDV, Me.lblCrescimento, Me.lblParticipacao, Me.lblRealPascoa, Me.lblRealPascoaAA, Me.lblMargemPDV_AA, Me.lblParticipacaoAA, Me.lblLucratividade, Me.lblLucratividadeAA, Me.lblRealPascoaAA1, Me.lblMargemPDV_AA1, Me.lblLucratividadeAA1, Me.lblParticipacaoAA1, Me.lblMargemFinal, Me.lblMargemFinal_AA, Me.lblMargemFinal_AA1)
        'Call Pascoa_BuscarDadosAtuais(2012, Session("sCOD"), 99, Me.lblMargemRealizadaAA, Me.lblCrescimentoAA, Me.lblParticipacaoAA, Me.lblRealPascoaAA)

        'Atualizar Realizado do Periodo Total. Ano 2014
        Call Pascoa_BuscarTotalRealizadoPascoa(varAno - 1, Session("sCOD"), Session("sFILIAL"), Me.lblMetaPascoaAA, Me.lblCrescimentoAA)

        'Atualizar Realizado do Periodo Total. Ano 2013
        Call Pascoa_BuscarTotalRealizadoPascoa(varAno - 2, Session("sCOD"), Session("sFILIAL"), Me.lblMetaPascoaAA1, Me.lblCrescimentoAA1)


        'Calculos
        Me.lblPercentualAtingimento.Text = ((Me.lblRealPascoa.Text / Me.lblMetaPascoa.Text) * 100).ToString("n2")

        Me.lblPercentualAtingimentoAA.Text = ((Me.lblRealPascoaAA.Text / Me.lblMetaPascoaAA.Text) * 100).ToString("n2")
        Me.lblPercentualAtingimentoAA1.Text = oFun.Calculate(lblRealPascoaAA1.Text, lblMetaPascoaAA1.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")

        Me.lblRealPascoaDif.Text = CDbl(Me.lblRealPascoa.Text - Me.lblRealPascoaAA.Text).ToString("n0")
        Me.lblPercentualAtingimentoDif.Text = CDbl(Me.lblPercentualAtingimento.Text - Me.lblPercentualAtingimentoAA.Text).ToString("n2")
        Me.lblMargemPDV_Dif.Text = CDbl(Me.lblMargemPDV.Text - Me.lblMargemPDV_AA.Text).ToString("n2")
        Me.lblMargemFinal_Dif.Text = CDbl(Me.lblMargemFinal.Text - Me.lblMargemFinal_AA.Text).ToString("n2")
        Me.lblParticipacaoDif.Text = CDbl(((Me.lblParticipacao.Text / Me.lblParticipacaoAA.Text) * 100) - 100).ToString("n2")
        Me.lblMetaPascoaDif.Text = CDbl(Me.lblMetaPascoa.Text - Me.lblMetaPascoaAA.Text).ToString("n0")
        ' Me.lblCrescimentoDif.Text = CDbl(((Me.lblCrescimento.Text / Me.lblCrescimentoAA.Text) * 100) - 100).ToString("n2")
        Me.lblLucratividadeDif.Text = CDbl(Me.lblLucratividade.Text - Me.lblLucratividadeAA.Text).ToString("n0")

        lblCrescimentoAA.Text = oFun.Calculate(lblRealPascoaAA.Text, lblRealPascoaAA1.Text, Funcoes.CalculateType.Growth).ToString("n2")


        'Formatar se Negativo
        Call ValorNegativo(Me.lblPercentualAtingimentoDif)

        Call ValorNegativo(Me.lblParticipacaoDif)


    End Sub
 

#End Region

    Private Sub ValorNegativo(ByVal iNumero As Label)

        If CDbl(iNumero.Text) < 0 Then
            iNumero.ForeColor = Drawing.Color.Red
        Else
            iNumero.ForeColor = Drawing.Color.White
        End If

    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Session("sCOD") = Me.cboCod.Value
        Call Atualizar()

        Select Case Session("sCOD")
            Case 0
                Me.lblTituloMeta.Text = "Meta Páscoa"
                Me.lblTituloMetaAA.Text = "Realizado Páscoa"
                Me.lblTituloReal.Text = "Realizado Páscoa"
                Me.lblTituloRealAA.Text = "Realizado Páscoa"
                Me.lblTituloMetaAA1.Text = "Realizado Páscoa"
                Me.lblTituloRealAA1.Text = "Realizado Páscoa"
            Case 1
                Me.lblTituloMeta.Text = "Meta Bombom "
                Me.lblTituloMetaAA.Text = "Realizado Bombom "
                Me.lblTituloReal.Text = "Realizado Bombom"
                Me.lblTituloRealAA.Text = "Realizado Bombom"
                Me.lblTituloMetaAA1.Text = "Realizado Bombom"
                Me.lblTituloRealAA1.Text = "Realizado Bombom"
            Case 2
                Me.lblTituloMeta.Text = "Meta Ovos"
                Me.lblTituloMetaAA.Text = "Realizado Ovos"
                Me.lblTituloReal.Text = "Realizado Ovos"
                Me.lblTituloRealAA.Text = "Realizado Ovos"
                Me.lblTituloMetaAA1.Text = "Realizado Ovos"
                Me.lblTituloRealAA1.Text = "Realizado Ovos"
            Case 3
                Me.lblTituloMeta.Text = "Meta Coelhinho"
                Me.lblTituloMetaAA.Text = "Realizado Coelhinho"
                Me.lblTituloReal.Text = "Realizado Coelhinho"
                Me.lblTituloRealAA.Text = "Realizado Coelhinho"
                Me.lblTituloMetaAA1.Text = "Realizado Coelhinho"
                Me.lblTituloRealAA1.Text = "Realizado Coelhinho"
            Case 4
                Me.lblTituloMeta.Text = "Meta Colomba"
                Me.lblTituloMetaAA.Text = "Realizado Colomba"
                Me.lblTituloReal.Text = "Realizado Colomba"
                Me.lblTituloRealAA.Text = "Realizado Colomba"
                Me.lblTituloMetaAA1.Text = "Realizado Colomba"
                Me.lblTituloRealAA1.Text = "Realizado Colomba"
            Case 5
                Me.lblTituloMeta.Text = "Meta Bacalhau"
                Me.lblTituloMetaAA.Text = "Realizado Bacalhau"
                Me.lblTituloReal.Text = "Realizado Bacalhau"
                Me.lblTituloRealAA.Text = "Realizado Bacalhau"
                Me.lblTituloMetaAA1.Text = "Realizado Bacalhau"
                Me.lblTituloRealAA1.Text = "Realizado Bacalhau"
            Case 6
                Me.lblTituloMeta.Text = "Meta Barra de Chocolate"
                Me.lblTituloMetaAA.Text = "Realizado Barra de Chocolate"
                Me.lblTituloReal.Text = "Realizado Barra de Chocolate"
                Me.lblTituloRealAA.Text = "Realizado Barra de Chocolate"
                Me.lblTituloMetaAA1.Text = "Realizado Barra de Chocolate"
                Me.lblTituloRealAA1.Text = "Realizado Barra de Chocolate"
            Case 7
                Me.lblTituloMeta.Text = "Meta Chocolate Presentes"
                Me.lblTituloMetaAA.Text = "Realizado Chocolate Presentes"
                Me.lblTituloReal.Text = "Realizado Chocolate Presentes"
                Me.lblTituloRealAA.Text = "Realizado Chocolate Presentes"
                Me.lblTituloMetaAA1.Text = "Realizado Chocolate Presentes"
                Me.lblTituloRealAA1.Text = "Realizado Chocolate Presentes"
            Case 100
                Me.lblTituloMeta.Text = "Meta Mundo Chocolate"
                Me.lblTituloMetaAA.Text = "Realizado Mundo Chocolate"
                Me.lblTituloReal.Text = "Realizado Mundo Chocolate"
                Me.lblTituloRealAA.Text = "Realizado Mundo Chocolate"
                Me.lblTituloMetaAA1.Text = "Realizado Mundo Chocolate"
                Me.lblTituloRealAA1.Text = "Realizado Mundo Chocolate"
        End Select

        Session("sFILIAL") = cboFilial.CallFilial
        Call Atualizar()
    End Sub


End Class
