
Partial Class MemberPages_SLV_Item_AnaliseVendaUnicoItemDia
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(294, User.Identity.Name)
            txtDias.Value = -1
        End If

        If pcManual.IsCallback Then
            oVen.AtualizarEstatisticaPrograma(298, User.Identity.Name)
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise Item por Dia - Últimos 60 Dias - PGR294"
            
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sDIA") = DateAndTime.DateAdd(DateInterval.Day, txtDias.Value, Now())
            mySession()

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA") = DateAndTime.DateAdd(DateInterval.Day, txtDias.Value, Now())
        'Session("sDIA_INICIAL") = DateAndTime.DateAdd(DateInterval.Day, -61, Now())
        'Session("sDIA_FINAL") = DateAndTime.DateAdd(DateInterval.Day, -1, Now())

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sPRODUTO") = cboProduto.CallProduto

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        If Not IsNothing(cboProduto.CallProduto) Then

            Dim myWidth As Int16 = 1000
            Dim myHeight As Int16 = 450

            Select Case cboTamanho.Text
                Case "100%"
                    graph.Width = myWidth
                    graph1.Width = myWidth
                    graph2.Width = myWidth
                    graph.Height = myHeight
                    graph1.Height = myHeight
                    graph2.Height = myHeight
                Case "110%"
                    graph.Width = ((myWidth * 0.10000000000000001) + myWidth)
                    graph1.Width = ((myWidth * 0.10000000000000001) + myWidth)
                    graph2.Width = ((myWidth * 0.10000000000000001) + myWidth)
                    graph.Height = ((myHeight * 0.050000000000000003) + myHeight)
                    graph1.Height = ((myHeight * 0.050000000000000003) + myHeight)
                    graph2.Height = ((myHeight * 0.050000000000000003) + myHeight)
                Case "120%"
                    graph.Width = ((myWidth * 0.20000000000000001) + myWidth)
                    graph1.Width = ((myWidth * 0.20000000000000001) + myWidth)
                    graph2.Width = ((myWidth * 0.20000000000000001) + myWidth)
                    graph.Height = ((myHeight * 0.10000000000000003) + myHeight)
                    graph1.Height = ((myHeight * 0.10000000000000003) + myHeight)
                    graph2.Height = ((myHeight * 0.10000000000000003) + myHeight)
                Case "130%"
                    graph.Width = ((myWidth * 0.29999999999999999) + myWidth)
                    graph1.Width = ((myWidth * 0.29999999999999999) + myWidth)
                    graph2.Width = ((myWidth * 0.29999999999999999) + myWidth)
                    graph.Height = ((myHeight * 0.15000000000000002) + myHeight)
                    graph1.Height = ((myHeight * 0.15000000000000002) + myHeight)
                    graph2.Height = ((myHeight * 0.15000000000000002) + myHeight)
                Case "140%"
                    graph.Width = ((myWidth * 0.40000000000000002) + myWidth)
                    graph1.Width = ((myWidth * 0.40000000000000002) + myWidth)
                    graph2.Width = ((myWidth * 0.40000000000000002) + myWidth)
                    graph.Height = ((myHeight * 0.20000000000000004) + myHeight)
                    graph1.Height = ((myHeight * 0.20000000000000004) + myHeight)
                    graph2.Height = ((myHeight * 0.20000000000000004) + myHeight)
                Case "150%"
                    graph.Width = ((myWidth * 0.5) + myWidth)
                    graph1.Width = ((myWidth * 0.5) + myWidth)
                    graph2.Width = ((myWidth * 0.5) + myWidth)
                    graph.Height = ((myHeight * 0.25000000000000006) + myHeight)
                    graph1.Height = ((myHeight * 0.25000000000000006) + myHeight)
                    graph2.Height = ((myHeight * 0.25000000000000006) + myHeight)
                Case "160%"
                    graph.Width = ((myWidth * 0.59999999999999998) + myWidth)
                    graph1.Width = ((myWidth * 0.59999999999999998) + myWidth)
                    graph2.Width = ((myWidth * 0.59999999999999998) + myWidth)
                    graph.Height = ((myHeight * 0.30000000000000004) + myHeight)
                    graph1.Height = ((myHeight * 0.30000000000000004) + myHeight)
                    graph2.Height = ((myHeight * 0.30000000000000004) + myHeight)
            End Select

            Atualizar()
        End If

    End Sub

    Private Sub Atualizar()
        Dim vAno As Int16 = DateAndTime.Now().Year
        mySession()
        If graph.Visible = False Then graph.Visible = True
        If graph1.Visible = False Then graph1.Visible = True
        If graph2.Visible = False Then graph2.Visible = True
        graph.Titles(0).Text = "Análise de Vendas, Lucro com Sellout e Margem com Sellout - Ano " & vAno
        graph1.Titles(0).Text = "Análise Volume, Preço Médio e Número de Clientes - Ano " & vAno
        graph2.Titles(0).Text = "Análise do Valor da Agenda 23 (lixo) e Valor da Divergência - Ano " & vAno
    End Sub


    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
           
            If Not IsPostBack Then
                If Not cboFilial.IsLoja Then
                    cboFilial.CallCorporacao = 199
                    cboFilial.DataBindFilial()
                    cboFilial.CallFilial = 99
                End If

            End If
        End If
    End Sub


End Class
