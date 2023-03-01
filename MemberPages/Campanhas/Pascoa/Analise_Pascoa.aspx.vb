Imports DevExpress.Data
Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Campanhas_Pascoa_Analise_Pascoa
    Inherits System.Web.UI.Page


    Dim varTitle As String
    Dim myDate As Date
    Dim varAno As Int16

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Private connManager As String = clData_gerManager.dbConnect

#Region " Variables"

    Private VendaAA As Decimal = 0
    Private Meta As Decimal = 0
    Private Real As Decimal = 0

    Private QtdeAA As Decimal = 0
    Private Qtde As Decimal = 0
    Private percCresQtde As Decimal = 0
    Private VendaAA1 As Decimal = 0
    Private Venda As Decimal = 0
    Private percCresVenda As Decimal = 0
    Private MargemAA As Decimal = 0
    Private Margem As Decimal = 0
    Private Dif As Decimal = 0
    Private LucroAA As Decimal = 0
    Private Lucro As Decimal = 0
    Private percCresLucro As Decimal = 0
    Private QtdeEstoque As Decimal = 0
    Private TotalQuilos As Decimal = 0
    Private vlrEstoque As Decimal = 0

    Private numClienteAA As Decimal = 0
    Private numCliente As Decimal = 0
    Private difCliente As Decimal = 0
#End Region


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then

            If Now.Hour > 8 Then
                Session("sDIA") = Today
                myDate = Date.Now
            Else
                Session("sDIA") = Today.AddDays(-1)
                myDate = Date.Now.AddDays(-1)
            End If
        End If
    End Sub


    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete

        If Not IsPostBack Then


            Dim oVem As New VendaEmpresaMes

            Dim inputDate As Date
            Dim result As Boolean = Date.TryParse(myDate, inputDate)

            If result = True Then

                varTitle = " Venda Dia " & myDate.ToString("dd/MM/yyyy") & " - Atualizado às " & oVem.Flash_BuscaDataAtualizacao(myDate)
                CType(Master.FindControl("lblTitle"), Label).Text = varTitle
            Else
                varTitle = " Ops! Dia com problema!"
                CType(Master.FindControl("lblTitle"), Label).Text = varTitle
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            On Error Resume Next

            Dim varAno As Int16

            Session("sCAMPANHA") = 1

            If Month(Now()) < 2 Then
                varAno = Year(Now()) - 1
                Session("sANO") = Year(Now()) - 1
            Else
                varAno = Year(Now())
                Session("sANO") = Year(Now())
            End If

            oVem.AtualizarEstatisticaPrograma(101, User.Identity.Name)

            cboFilial.AutoPostBack = False
            If cboFilial.IsLoja = False Then
                cboFilial.CallCorporacao = 199
                
            End If

            oVem.Campanha_BuscarPeriodo(1, varAno)

            Me.lblPeriodo1.Text = "Período:  " & varAno & ": " & oVem.Dia3 & " a " & oVem.Dia4 & " - " & oVem.Dia6 & " de 60 dias."
            Me.lblPeriodo2.Text = "Período:  " & varAno - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & " - " & oVem.Dia5 & " de 60 dias."
            Me.lblPeriodo3.Text = "Período:  " & varAno - 2 & ": " & oVem.Dia7 & " a " & oVem.Dia8 & " - " & oVem.Dia9 & " de 60 dias."

            Me.lblAnoAT.Text = varAno
            Me.lblAnoAA.Text = varAno - 1
            Me.lblAnoAA1.Text = varAno - 2

            Me.lblDescricaoAT.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno & " e " & varAno - 1 & ""
            Me.lblDescricaoAA.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno - 1 & " e " & varAno - 2 & ""
            Me.lblDescricaoAA1.Text = "Comparativo Proporcional ao Mesmo Periodo de " & varAno - 2 & " e " & varAno - 3 & ""


            Me.ASPxGridView1.DataBind()
            Me.grid_Total.DataBind()
            gridTodosItens.DataBind()
            gridParticipacao.DataBind()

            ' Grid_Total_Dia

            oVem.Campanha_BuscarPeriodo(1, Year(Now()))

            Me.lblTitulo.Text = "Período Acumulado:  " & Year(Now()) - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & "."
            Me.lblTitulo1.Text = "" & Year(Now()) & ": " & oVem.Dia3 & " a " & oVem.Dia4 & "."

            Call myLegendas()

           

        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then


            If cboFilial.IsLoja = True Then
                Session("sFILIAL") = cboFilial.CallFilial
            Else
                cboFilial.CallCorporacao = "Corporação"
                cboFilial.CallFilial = 99
                Session("sFILIAL") = 99
            End If

            Session("sCOD") = Me.cboCod.Value
            Atualizar()
        End If
    End Sub


#Region "CAPA_PASCOA"

    Private Sub ValorNegativo(ByVal iNumero As Label)

        If CDbl(iNumero.Text) < 0 Then
            iNumero.ForeColor = Drawing.Color.Red
        Else
            iNumero.ForeColor = Drawing.Color.White
        End If

    End Sub


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

        On Error Resume Next

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

        ASPxGridView1.DataBind()
        grid_Total.DataBind()
        gridMeta.DataBind()
        gridTodosItens.DataBind()


        graf_Participacao.DataBind()
        graph_Mundo_Chocolate.DataBind()

        Session("sCOD") = 2
        gridParticipacao.DataBind()

        'lblError.Visible = True
        'lblError.Text = "Cod: " & Session("sCOD") & "Filial: " & Session("sFILIAL") & " Ano: " & Session("sANO") & " Campanha: " & Session("sCAMPANHA")



    End Sub



#End Region

#Region "TOTAL_POR_DIA"

    'Private Sub grid_Total_Load(sender As Object, e As EventArgs) Handles grid_Total.Load
    '    If Not IsPostBack Then
    '        Dim oVem As New VendaEmpresaMes
    '        oVem.AtualizarEstatisticaPrograma(95, User.Identity.Name)

    '        Session("sFILIAL") = 99
    '        oVem.Campanha_BuscarPeriodo(1, Year(Now()))

    '        Me.lblTitulo.Text = "Período Acumulado:  " & Year(Now()) - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & "."
    '        Me.lblTitulo1.Text = "" & Year(Now()) & ": " & oVem.Dia3 & " a " & oVem.Dia4 & "."

    '        Call myLegendas()
    '    End If
    'End Sub

    Private Sub myLegendas()

        oFun.Grid_Title(Me.grid_Total, "Análise Total da Páscoa " & Session("sANO"))

        'Colunas
        oFun.Grid_ColumnTitle(Me.grid_Total, "QtdeAA", Session("sANO") - 1)
        oFun.Grid_ColumnTitle(Me.grid_Total, "Qtde", Session("sANO"))
        oFun.Grid_ColumnTitle(Me.grid_Total, "Venda", Session("sANO"))
        oFun.Grid_ColumnTitle(Me.grid_Total, "VendaAA", Session("sANO") - 1)

        oFun.Grid_ColumnTitle(Me.grid_Total, "Margem", Session("sANO"))
        oFun.Grid_ColumnTitle(Me.grid_Total, "MargemAA", Session("sANO") - 1)

        oFun.Grid_ColumnTitle(Me.grid_Total, "Lucro", Session("sANO"))
        oFun.Grid_ColumnTitle(Me.grid_Total, "LucroAA", Session("sANO") - 1)

        oFun.Grid_ColumnTitle(Me.grid_Total, "numCliente", Session("sANO"))
        oFun.Grid_ColumnTitle(Me.grid_Total, "numClienteAA", Session("sANO") - 1)

        oFun.Grid_ColumnTitle(Me.grid_Total, "bandMargem", "Margem com Sell-Out")
        oFun.Grid_ColumnTitle(Me.grid_Total, "bandLucro", "Lucro")

        oFun.Grid_ColumnTitle(Me.gridMeta, "VendaAA", Session("sANO") - 1)
        oFun.Grid_ColumnTitle(Me.gridMeta, "Meta", "Meta " & Session("sANO"))

    End Sub

    Private Sub grid_Total_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid_Total.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
                e.Row.Font.Bold = True
            Case "255", "240"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

    Private Sub grid_Total_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Total.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Total_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Total.CustomSummaryCalculate

        On Error Resume Next
        Dim myDate As String
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            VendaAA = 0
            Meta = 0
            Real = 0

            QtdeAA = 0
            Qtde = 0
            percCresQtde = 0
            VendaAA1 = 0
            Venda = 0
            percCresVenda = 0
            MargemAA = 0
            Margem = 0
            Dif = 0
            LucroAA = 0
            Lucro = 0
            percCresLucro = 0
            QtdeEstoque = 0
            TotalQuilos = 0
            vlrEstoque = 0

            numClienteAA = 0
            numCliente = 0
            difCliente = 0

        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                VendaAA += Convert.ToDecimal(e.GetValue("VendaAA"))
                Meta += Convert.ToDecimal(e.GetValue("Meta"))
                Real += Convert.ToDecimal(e.GetValue("Real"))

                QtdeAA += Convert.ToDecimal(e.GetValue("QtdeAA"))
                Qtde += Convert.ToDecimal(e.GetValue("Qtde"))
                percCresQtde += Convert.ToDecimal(e.GetValue("percCresQtde"))
                VendaAA1 += Convert.ToDecimal(e.GetValue("VendaAA"))
                Venda += Convert.ToDecimal(e.GetValue("Venda"))
                percCresVenda += Convert.ToDecimal(e.GetValue("percCresVenda"))
                MargemAA += Convert.ToDecimal(e.GetValue("MargemAA"))
                Margem += Convert.ToDecimal(e.GetValue("Margem"))
                Dif += Convert.ToDecimal(e.GetValue("Dif"))
                LucroAA += Convert.ToDecimal(e.GetValue("LucroAA"))
                Lucro += Convert.ToDecimal(e.GetValue("Lucro"))
                percCresLucro += Convert.ToDecimal(e.GetValue("percCresLucro"))
                QtdeEstoque += Convert.ToDecimal(e.GetValue("QtdeEstoque"))
                TotalQuilos += Convert.ToDecimal(e.GetValue("TotalQuilos"))
                vlrEstoque += Convert.ToDecimal(e.GetValue("vlrEstoque"))

                numClienteAA += Convert.ToDecimal(e.GetValue("numClienteAA"))
                numCliente += Convert.ToDecimal(e.GetValue("numCliente"))
                difCliente += Convert.ToDecimal(e.GetValue("difCliente"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAA" Then e.TotalValue = QtdeAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde" Then e.TotalValue = Qtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresQtde" Then e.TotalValue = percCresQtde

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAA" Then e.TotalValue = VendaAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Venda" Then e.TotalValue = Venda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresVenda" Then e.TotalValue = percCresVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "MargemAA" Then e.TotalValue = MargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Margem" Then e.TotalValue = Margem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dif" Then e.TotalValue = Dif
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "LucroAA" Then e.TotalValue = LucroAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Lucro" Then e.TotalValue = Lucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresLucro" Then e.TotalValue = percCresLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeEstoque" Then e.TotalValue = QtdeEstoque
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "TotalQuilos" Then e.TotalValue = TotalQuilos
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrEstoque" Then e.TotalValue = vlrEstoque

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numCliente" Then e.TotalValue = numCliente
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numClienteAA" Then e.TotalValue = numClienteAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difCliente" Then e.TotalValue = difCliente
        End If

    End Sub

    Private Sub grid_Total_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Total.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresQtde")
        oFun.Grid_RedIsNegative(e, "percCresVenda")
        oFun.Grid_RedIsNegative(e, "Dif")
        oFun.Grid_RedIsNegative(e, "percCresLucro")
        oFun.Grid_RedIsNegative(e, "difCliente")
    End Sub


#End Region

#Region " gridMeta"

    Protected Sub gridMeta_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMeta.CustomSummaryCalculate
        On Error Resume Next
        Dim myDate As String
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            VendaAA = 0
            Meta = 0
            Real = 0
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As String = Convert.ToString(e.GetValue("Descricao"))
            If myFilter = "Empresa Total" Then
                VendaAA += Convert.ToDecimal(e.GetValue("VendaAA"))
                Meta += Convert.ToDecimal(e.GetValue("Meta"))
                Real += Convert.ToDecimal(e.GetValue("Real"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAA" Then e.TotalValue = VendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Meta" Then e.TotalValue = Meta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Real" Then e.TotalValue = Real
        End If

        If e.IsTotalSummary Then
            If summary.FieldName = "Part" Then
                Dim Meta As Decimal = Convert.ToDecimal(gridMeta.GetTotalSummaryValue(gridMeta.TotalSummary("Meta")))
                Dim Real As Decimal = Convert.ToDecimal(gridMeta.GetTotalSummaryValue(gridMeta.TotalSummary("Real")))
                e.TotalValue = ((Real / Meta) * 100)
            End If


        End If

        oFun.Grid_Footer_Calculate(sender, e, Me.gridMeta, "percCresc", "Real", "VendaAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub gridMeta_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridMeta.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")

    End Sub

    Protected Sub gridMeta_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMeta.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub


#End Region


#Region " gridTodosItens"

    Protected Sub gridTodosItens_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTodosItens.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, Me.gridTodosItens, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gridTodosItens_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridTodosItens.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "qtdeEstoque")
        oFun.Grid_RedIsNegative(e, "TotalQuilos")
        oFun.Grid_RedIsNegative(e, "vlrEstoque")

    End Sub

    Protected Sub gridTodosItens_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridTodosItens.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "preco_medio", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "vlrEstoque_Venda", "qtdeEstoque", "preco_medio", Funcoes.CalculateType.Multiplication)
    End Sub

#End Region


    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sCOD") = Me.cboCod.Value
        lblError.Text = Me.cboCod.Value

        Select Case Session("sCOD")
            Case 0
                Me.lblTituloMeta.Text = "Meta Páscoa"
                Me.lblTituloMetaAA.Text = "Realizado Páscoa"
                Me.lblTituloReal.Text = "Realizado Páscoa"
                Me.lblTituloRealAA.Text = "Realizado Páscoa"
                Me.lblTituloMetaAA1.Text = "Realizado Páscoa"
                Me.lblTituloRealAA1.Text = "Realizado Páscoa"
                lblTitulo_Capa.Text = "Capa - Total da Páscoa"
                oFun.Grid_Title(gridMeta, "Comparativo de Total da Páscoa - Meta x Realizado")


            Case 1
                Me.lblTituloMeta.Text = "Meta Bombom "
                Me.lblTituloMetaAA.Text = "Realizado Bombom "
                Me.lblTituloReal.Text = "Realizado Bombom"
                Me.lblTituloRealAA.Text = "Realizado Bombom"
                Me.lblTituloMetaAA1.Text = "Realizado Bombom"
                Me.lblTituloRealAA1.Text = "Realizado Bombom"
                lblTitulo_Capa.Text = "Capa - Caixa de Bombom"
                oFun.Grid_Title(gridMeta, "Comparativo de Caixa de Bombom - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Caixa de Bombom - Todos Itens")

            Case 2
                Me.lblTituloMeta.Text = "Meta Ovos"
                Me.lblTituloMetaAA.Text = "Realizado Ovos"
                Me.lblTituloReal.Text = "Realizado Ovos"
                Me.lblTituloRealAA.Text = "Realizado Ovos"
                Me.lblTituloMetaAA1.Text = "Realizado Ovos"
                Me.lblTituloRealAA1.Text = "Realizado Ovos"
                lblTitulo_Capa.Text = "Capa - Ovos de Páscoa"
                oFun.Grid_Title(gridMeta, "Comparativo de Ovos de Páscoa - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Ovos de Páscoa - Todos Itens")
            Case 3
                Me.lblTituloMeta.Text = "Meta Coelhinho"
                Me.lblTituloMetaAA.Text = "Realizado Coelhinho"
                Me.lblTituloReal.Text = "Realizado Coelhinho"
                Me.lblTituloRealAA.Text = "Realizado Coelhinho"
                Me.lblTituloMetaAA1.Text = "Realizado Coelhinho"
                Me.lblTituloRealAA1.Text = "Realizado Coelhinho"
                lblTitulo_Capa.Text = "Capa - Coelhinhos"
                oFun.Grid_Title(gridMeta, "Comparativo de Coelhinhos - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Coelhinhos - Todos Itens")
            Case 4
                Me.lblTituloMeta.Text = "Meta Colomba"
                Me.lblTituloMetaAA.Text = "Realizado Colomba"
                Me.lblTituloReal.Text = "Realizado Colomba"
                Me.lblTituloRealAA.Text = "Realizado Colomba"
                Me.lblTituloMetaAA1.Text = "Realizado Colomba"
                Me.lblTituloRealAA1.Text = "Realizado Colomba"
                lblTitulo_Capa.Text = "Capa - Colomba"
                oFun.Grid_Title(gridMeta, "Comparativo de Colomba - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Colomba - Todos Itens")
            Case 5
                Me.lblTituloMeta.Text = "Meta Bacalhau"
                Me.lblTituloMetaAA.Text = "Realizado Bacalhau"
                Me.lblTituloReal.Text = "Realizado Bacalhau"
                Me.lblTituloRealAA.Text = "Realizado Bacalhau"
                Me.lblTituloMetaAA1.Text = "Realizado Bacalhau"
                Me.lblTituloRealAA1.Text = "Realizado Bacalhau"
                lblTitulo_Capa.Text = "Capa - Bacalhau"
                oFun.Grid_Title(gridMeta, "Comparativo de Bacalhau - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Bacalhau - Todos Itens")
            Case 6
                Me.lblTituloMeta.Text = "Meta Barra de Chocolate"
                Me.lblTituloMetaAA.Text = "Realizado Barra de Chocolate"
                Me.lblTituloReal.Text = "Realizado Barra de Chocolate"
                Me.lblTituloRealAA.Text = "Realizado Barra de Chocolate"
                Me.lblTituloMetaAA1.Text = "Realizado Barra de Chocolate"
                Me.lblTituloRealAA1.Text = "Realizado Barra de Chocolate"
                lblTitulo_Capa.Text = "Capa - Barra de Chocolate"
                oFun.Grid_Title(gridMeta, "Comparativo de Barra de Chocolate - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Barra de Chocolate - Todos Itens")

            Case 7
                Me.lblTituloMeta.Text = "Meta Chocolate Presentes"
                Me.lblTituloMetaAA.Text = "Realizado Chocolate Presentes"
                Me.lblTituloReal.Text = "Realizado Chocolate Presentes"
                Me.lblTituloRealAA.Text = "Realizado Chocolate Presentes"
                Me.lblTituloMetaAA1.Text = "Realizado Chocolate Presentes"
                Me.lblTituloRealAA1.Text = "Realizado Chocolate Presentes"
                lblTitulo_Capa.Text = "Capa - Chocolate Presentes"
                oFun.Grid_Title(gridMeta, "Comparativo de Chocolate Presentes - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Chocolate Presentes - Todos Itens")
            Case 100
                Me.lblTituloMeta.Text = "Meta Mundo Chocolate"
                Me.lblTituloMetaAA.Text = "Realizado Mundo Chocolate"
                Me.lblTituloReal.Text = "Realizado Mundo Chocolate"
                Me.lblTituloRealAA.Text = "Realizado Mundo Chocolate"
                Me.lblTituloMetaAA1.Text = "Realizado Mundo Chocolate"
                Me.lblTituloRealAA1.Text = "Realizado Mundo Chocolate"
                lblTitulo_Capa.Text = "Capa - Mundo Chocolate"
                oFun.Grid_Title(gridMeta, "Comparativo de Mundo Chocolate - Meta x Realizado")
                oFun.Grid_Title(gridTodosItens, "Mundo Chocolate - Todos Itens")
        End Select

        If cboCod.Value = 0 Then
            container_Itens.Visible = False
        Else
            container_Itens.Visible = True
        End If



        Atualizar()

       
    End Sub

   
End Class

