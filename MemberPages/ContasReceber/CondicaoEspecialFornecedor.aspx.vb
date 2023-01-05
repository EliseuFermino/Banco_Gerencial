
Partial Class MemberPages_ContasReceber_CondicaoEspecialFornecedor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(277, User.Identity.Name)

            Dim myMonth As Byte = Month(DateAndTime.Now()) - 1

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False

            cboMesInicial.CallMes = myMonth
            cboMesFinal.CallMes = myMonth

            oFun.Grid_Column_BorderRight(grid, "NomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 1)

            cboMesInicial.LabelDescMes = "Mês Inicial"
            cboMesFinal.LabelDescMes = "Mês Final"

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Rentabilidade do Fornecedor - PGR277"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sFORNECEDOR") = cboFornecedor.CallFornecedor

        If cboFornecedor.CNPJ_Principal_Checked = True Then
            Session("sCNPJ") = 0
        Else
            Session("sCNPJ") = 1
        End If

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()

        If cboFornecedor.CNPJ_Principal_Checked = True Then
            oFun.Grid_Column_Visible(grid, "idFornecedor", False)
            oFun.Grid_Column_Visible(grid, "nomeFornecedor", False)

        Else
            oFun.Grid_Column_Visible(grid, "idFornecedor", True)
            oFun.Grid_Column_Visible(grid, "nomeFornecedor", True)

        End If

        grid.DataBind()
    End Sub



    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

End Class

