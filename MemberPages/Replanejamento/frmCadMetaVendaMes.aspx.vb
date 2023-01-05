
Partial Class MemberPages_frmCadMetaVendaMes
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub Atualizar()

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes

        Call BuscarVendaOriginal()
        Call BuscarVendaRevista()
        Call TotalizarOriginal()
        Call TotalizarRevista()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Cadastro de Meta de Venda Revista"
        End If

    End Sub

#Region " Buscar Meta Original"

    Private Sub BuscarVendaOriginalFunction(iFilial As Int16, vlrOriginal As Label)
        Dim oBI As New BI
        oBI.BuscaGrupoMes_Ori(1, iFilial, Me.cboAno.CallAno, Me.cboMes.CallMes)   'Loja 3
        vlrOriginal.Text = oBI.vlrOri
    End Sub

    Private Sub BuscarVendaOriginal()
        Call BuscarVendaOriginalFunction(3, Me.lblLoja03)
        Call BuscarVendaOriginalFunction(4, Me.lblLoja04)
        Call BuscarVendaOriginalFunction(5, Me.lblLoja05)
        Call BuscarVendaOriginalFunction(6, Me.lblLoja06)
        Call BuscarVendaOriginalFunction(7, Me.lblLoja07)
        Call BuscarVendaOriginalFunction(8, Me.lblLoja08)
        Call BuscarVendaOriginalFunction(9, Me.lblLoja09)

        Call BuscarVendaOriginalFunction(10, Me.lblLoja10)
        Call BuscarVendaOriginalFunction(11, Me.lblLoja11)
        Call BuscarVendaOriginalFunction(13, Me.lblLoja13)
        Call BuscarVendaOriginalFunction(14, Me.lblLoja14)
        Call BuscarVendaOriginalFunction(15, Me.lblLoja15)
        Call BuscarVendaOriginalFunction(17, Me.lblLoja17)
        Call BuscarVendaOriginalFunction(18, Me.lblLoja18)
        Call BuscarVendaOriginalFunction(19, Me.lblLoja19)

        Call BuscarVendaOriginalFunction(20, Me.lblLoja20)
        Call BuscarVendaOriginalFunction(21, Me.lblLoja21)
        Call BuscarVendaOriginalFunction(22, Me.lblLoja22)
        Call BuscarVendaOriginalFunction(23, Me.lblLoja23)
        Call BuscarVendaOriginalFunction(24, Me.lblLoja24)
        Call BuscarVendaOriginalFunction(25, Me.lblLoja25)
        Call BuscarVendaOriginalFunction(26, Me.lblLoja26)
        Call BuscarVendaOriginalFunction(27, Me.lblLoja27)
        Call BuscarVendaOriginalFunction(28, Me.lblLoja28)
        Call BuscarVendaOriginalFunction(29, Me.lblLoja29)

        Call BuscarVendaOriginalFunction(30, Me.lblLoja30)
        Call BuscarVendaOriginalFunction(31, Me.lblLoja31)
        Call BuscarVendaOriginalFunction(32, Me.lblLoja32)
        Call BuscarVendaOriginalFunction(33, Me.lblLoja33)
        Call BuscarVendaOriginalFunction(34, Me.lblLoja34)
        Call BuscarVendaOriginalFunction(36, Me.lblLoja36)
        Call BuscarVendaOriginalFunction(37, Me.lblLoja37)
        Call BuscarVendaOriginalFunction(38, Me.lblLoja38)
        Call BuscarVendaOriginalFunction(39, Me.lblLoja39)

        Call BuscarVendaOriginalFunction(40, Me.lblLoja40)
        Call BuscarVendaOriginalFunction(41, Me.lblLoja41)
        Call BuscarVendaOriginalFunction(42, Me.lblLoja42)
        Call BuscarVendaOriginalFunction(43, Me.lblLoja43)
        Call BuscarVendaOriginalFunction(44, Me.lblLoja44)
        Call BuscarVendaOriginalFunction(45, Me.lblLoja45)
        Call BuscarVendaOriginalFunction(46, Me.lblLoja46)
        Call BuscarVendaOriginalFunction(47, Me.lblLoja47)
        Call BuscarVendaOriginalFunction(48, Me.lblLoja48)
        Call BuscarVendaOriginalFunction(49, Me.lblLoja49)

        Call BuscarVendaOriginalFunction(50, Me.lblLoja50)
        Call BuscarVendaOriginalFunction(51, Me.lblLoja51)
        Call BuscarVendaOriginalFunction(52, Me.lblLoja52)
        Call BuscarVendaOriginalFunction(53, Me.lblLoja53)
        Call BuscarVendaOriginalFunction(54, Me.lblLoja54)
        Call BuscarVendaOriginalFunction(55, Me.lblLoja55)
        Call BuscarVendaOriginalFunction(56, Me.lblLoja56)
        Call BuscarVendaOriginalFunction(57, Me.lblLoja57)
        Call BuscarVendaOriginalFunction(58, Me.lblLoja58)
        Call BuscarVendaOriginalFunction(59, Me.lblLoja59)
        Call BuscarVendaOriginalFunction(60, Me.lblLoja60)

        ' Atacarejos -----
        Call BuscarVendaOriginalFunction(603, Me.lblLoja603)
        Call BuscarVendaOriginalFunction(604, Me.lblLoja604)
        Call BuscarVendaOriginalFunction(606, Me.lblLoja606)

        ' Postos ----- 
        Call BuscarVendaOriginalFunction(203, Me.lblLoja203)
        Call BuscarVendaOriginalFunction(204, Me.lblLoja204)
        Call BuscarVendaOriginalFunction(205, Me.lblLoja205)
        Call BuscarVendaOriginalFunction(206, Me.lblLoja206)
        Call BuscarVendaOriginalFunction(211, Me.lblLoja211)
        Call BuscarVendaOriginalFunction(212, Me.lblLoja212)
        Call BuscarVendaOriginalFunction(213, Me.lblLoja213)
        Call BuscarVendaOriginalFunction(214, Me.lblLoja214)
        Call BuscarVendaOriginalFunction(215, Me.lblLoja215)
        Call BuscarVendaOriginalFunction(216, Me.lblLoja216)
        Call BuscarVendaOriginalFunction(217, Me.lblLoja217)
        Call BuscarVendaOriginalFunction(218, Me.lblLoja218)
        Call BuscarVendaOriginalFunction(219, Me.lblLoja219)
        Call BuscarVendaOriginalFunction(220, Me.lblLoja220)
        Call BuscarVendaOriginalFunction(221, Me.lblLoja221)
        Call BuscarVendaOriginalFunction(222, Me.lblLoja222)
        Call BuscarVendaOriginalFunction(223, Me.lblLoja223)
        Call BuscarVendaOriginalFunction(224, Me.lblLoja224)
        Call BuscarVendaOriginalFunction(225, Me.lblLoja225)
        Call BuscarVendaOriginalFunction(226, Me.lblLoja226)
        Call BuscarVendaOriginalFunction(227, Me.lblLoja227)
        Call BuscarVendaOriginalFunction(228, Me.lblLoja228)

    End Sub

#End Region

#Region " Buscar Meta Revista"

    Private Sub fnBuscarVendaRevista(ByVal iFilial As Int16, ByVal iTextFilial As TextBox)
        oVem.BuscaRevGrupoMes(1, Me.cboAno.CallAno, Me.cboMes.CallMes, iFilial)
        iTextFilial.Text = oVem.vlrRev.ToString("n0")
    End Sub

    Private Sub BuscarVendaRevista()
        fnBuscarVendaRevista(3, txtLoja03)
        fnBuscarVendaRevista(4, txtLoja04)
        fnBuscarVendaRevista(5, txtloja05)
        fnBuscarVendaRevista(6, txtLoja06)
        fnBuscarVendaRevista(7, txtLoja07)
        fnBuscarVendaRevista(8, txtLoja08)
        fnBuscarVendaRevista(9, txtLoja09)

        fnBuscarVendaRevista(10, txtLoja10)
        fnBuscarVendaRevista(11, txtLoja11)
        fnBuscarVendaRevista(13, txtLoja13)
        fnBuscarVendaRevista(14, txtLoja14)
        fnBuscarVendaRevista(15, txtLoja15)
        fnBuscarVendaRevista(17, txtLoja17)
        fnBuscarVendaRevista(18, txtLoja18)
        fnBuscarVendaRevista(19, txtLoja19)

        fnBuscarVendaRevista(20, txtLoja20)
        fnBuscarVendaRevista(21, txtLoja21)
        fnBuscarVendaRevista(22, txtLoja22)
        fnBuscarVendaRevista(23, txtLoja23)
        fnBuscarVendaRevista(24, txtLoja24)
        fnBuscarVendaRevista(25, txtLoja25)
        fnBuscarVendaRevista(26, txtLoja26)
        fnBuscarVendaRevista(27, txtLoja27)
        fnBuscarVendaRevista(28, txtLoja28)
        fnBuscarVendaRevista(29, txtLoja29)

        fnBuscarVendaRevista(30, txtLoja30)
        fnBuscarVendaRevista(31, txtLoja31)
        fnBuscarVendaRevista(32, txtLoja32)
        fnBuscarVendaRevista(33, txtLoja33)
        fnBuscarVendaRevista(34, txtLoja34)
        fnBuscarVendaRevista(36, txtLoja36)
        fnBuscarVendaRevista(37, txtLoja37)
        fnBuscarVendaRevista(38, txtLoja38)
        fnBuscarVendaRevista(39, txtLoja39)

        fnBuscarVendaRevista(40, txtLoja40)
        fnBuscarVendaRevista(41, txtLoja41)
        fnBuscarVendaRevista(42, txtLoja42)
        fnBuscarVendaRevista(43, txtLoja43)
        fnBuscarVendaRevista(44, txtLoja44)
        fnBuscarVendaRevista(45, txtLoja45)
        fnBuscarVendaRevista(46, txtLoja46)
        fnBuscarVendaRevista(47, txtLoja47)
        fnBuscarVendaRevista(48, txtLoja48)
        fnBuscarVendaRevista(49, txtLoja49)

        fnBuscarVendaRevista(50, txtLoja50)
        fnBuscarVendaRevista(51, txtLoja51)
        fnBuscarVendaRevista(52, txtLoja52)
        fnBuscarVendaRevista(53, txtLoja53)
        fnBuscarVendaRevista(54, txtLoja54)
        fnBuscarVendaRevista(55, txtLoja55)
        fnBuscarVendaRevista(56, txtLoja56)
        fnBuscarVendaRevista(57, txtLoja57)
        fnBuscarVendaRevista(58, txtLoja58)
        fnBuscarVendaRevista(59, txtLoja59)
        fnBuscarVendaRevista(60, txtLoja60)

        fnBuscarVendaRevista(603, txtLoja603)
        fnBuscarVendaRevista(604, txtLoja604)
        fnBuscarVendaRevista(606, txtLoja606)

        Call fnBuscarVendaRevista(203, txtLoja203)
        Call fnBuscarVendaRevista(204, txtLoja204)
        Call fnBuscarVendaRevista(205, txtLoja205)
        Call fnBuscarVendaRevista(206, txtLoja206)
        Call fnBuscarVendaRevista(211, txtLoja211)
        Call fnBuscarVendaRevista(212, txtLoja212)
        Call fnBuscarVendaRevista(213, txtLoja213)
        Call fnBuscarVendaRevista(214, txtLoja214)
        Call fnBuscarVendaRevista(215, txtLoja215)
        Call fnBuscarVendaRevista(216, txtLoja216)
        Call fnBuscarVendaRevista(217, txtLoja217)
        Call fnBuscarVendaRevista(218, txtLoja218)
        Call fnBuscarVendaRevista(219, txtLoja219)
        Call fnBuscarVendaRevista(220, txtLoja220)
        Call fnBuscarVendaRevista(221, txtLoja221)
        Call fnBuscarVendaRevista(222, txtLoja222)
        Call fnBuscarVendaRevista(223, txtLoja223)
        Call fnBuscarVendaRevista(224, txtLoja224)
        Call fnBuscarVendaRevista(225, txtLoja225)
        Call fnBuscarVendaRevista(226, txtLoja226)
        Call fnBuscarVendaRevista(227, txtLoja227)
        Call fnBuscarVendaRevista(228, txtLoja228)

    End Sub

#End Region

    Private Sub TotalizarOriginal()
        Me.lblEmpresa.Text = (CDbl(Me.lblLoja03.Text) + CDbl(Me.lblLoja04.Text) + CDbl(Me.lblLoja05.Text) + _
                              CDbl(Me.lblLoja06.Text) + CDbl(Me.lblLoja07.Text) + CDbl(Me.lblLoja08.Text) + _
                              CDbl(Me.lblLoja09.Text) + CDbl(Me.lblLoja10.Text) + CDbl(Me.lblLoja11.Text) + CDbl(Me.lblLoja13.Text) + _
                              CDbl(Me.lblLoja14.Text) + CDbl(Me.lblLoja15.Text) + CDbl(Me.lblLoja17.Text) + _
                              CDbl(Me.lblLoja18.Text) + CDbl(Me.lblLoja19.Text) + CDbl(Me.lblLoja20.Text) + _
                              CDbl(Me.lblLoja21.Text) + CDbl(Me.lblLoja22.Text) + CDbl(Me.lblLoja23.Text) + _
                              CDbl(Me.lblLoja24.Text) + CDbl(Me.lblLoja25.Text) + CDbl(Me.lblLoja26.Text) + _
                              CDbl(Me.lblLoja27.Text) + CDbl(Me.lblLoja28.Text) + CDbl(Me.lblLoja29.Text) + _
                              CDbl(Me.lblLoja30.Text) + CDbl(Me.lblLoja31.Text) + CDbl(Me.lblLoja32.Text) + CDbl(Me.lblLoja33.Text) + _
                              CDbl(Me.lblLoja34.Text) + CDbl(Me.lblLoja36.Text) + CDbl(Me.lblLoja37.Text) + _
                              CDbl(Me.lblLoja38.Text) + CDbl(Me.lblLoja39.Text) + CDbl(Me.lblLoja40.Text) + CDbl(Me.lblLoja41.Text) + CDbl(Me.lblLoja42.Text) + _
                              CDbl(Me.lblLoja43.Text) + CDbl(Me.lblLoja44.Text) + CDbl(Me.lblLoja45.Text) + CDbl(Me.lblLoja46.Text) + _
                              CDbl(Me.lblLoja47.Text) + CDbl(Me.lblLoja48.Text) + CDbl(Me.lblLoja49.Text) + CDbl(Me.lblLoja50.Text) + _
                              CDbl(Me.lblLoja51.Text) + CDbl(Me.lblLoja52.Text) + CDbl(Me.lblLoja53.Text) + CDbl(Me.lblLoja54.Text) + _
                              CDbl(Me.lblLoja55.Text) + CDbl(Me.lblLoja56.Text) + CDbl(Me.lblLoja57.Text) + CDbl(Me.lblLoja58.Text) + _
                              CDbl(Me.lblLoja59.Text) + CDbl(Me.lblLoja60.Text)).ToString("n2")

        Me.lblEmpresaAtacarejos.Text = (CDbl(Me.lblLoja603.Text) + CDbl(Me.lblLoja604.Text) + CDbl(Me.lblLoja606.Text)).ToString("n2")

        Me.lblEmpresaPostos.Text = (CDbl(Me.lblLoja203.Text) + CDbl(Me.lblLoja204.Text) + CDbl(Me.lblLoja205.Text) + _
                              CDbl(Me.lblLoja206.Text) + CDbl(Me.lblLoja211.Text) + CDbl(Me.lblLoja212.Text) + CDbl(Me.lblLoja213.Text) + _
                              CDbl(Me.lblLoja214.Text) + CDbl(Me.lblLoja215.Text) + CDbl(Me.lblLoja216.Text) + CDbl(Me.lblLoja217.Text) + _
                              CDbl(Me.lblLoja218.Text) + CDbl(Me.lblLoja219.Text) + CDbl(Me.lblLoja220.Text) + _
                              CDbl(Me.lblLoja221.Text) + CDbl(Me.lblLoja222.Text) + CDbl(Me.lblLoja223.Text) + _
                              CDbl(Me.lblLoja224.Text) + CDbl(Me.lblLoja225.Text) + CDbl(Me.lblLoja226.Text) + _
                              CDbl(Me.lblLoja227.Text) + CDbl(Me.lblLoja228.Text)).ToString("n2")

    End Sub

    Private Sub TotalizarRevista()
        Me.txtLojaTotal.Text = (CDbl(Me.txtLoja03.Text) + CDbl(Me.txtLoja04.Text) + CDbl(Me.txtloja05.Text) + _
                                CDbl(Me.txtLoja06.Text) + CDbl(Me.txtLoja07.Text) + CDbl(Me.txtLoja08.Text) + _
                                CDbl(Me.txtLoja09.Text) + CDbl(Me.txtLoja10.Text) + CDbl(Me.txtLoja11.Text) + CDbl(Me.txtLoja13.Text) + _
                                CDbl(Me.txtLoja14.Text) + CDbl(Me.txtLoja15.Text) + CDbl(Me.txtLoja17.Text) + _
                                CDbl(Me.txtLoja18.Text) + CDbl(Me.txtLoja19.Text) + CDbl(Me.txtLoja20.Text) + _
                                CDbl(Me.txtLoja21.Text) + CDbl(Me.txtLoja22.Text) + CDbl(Me.txtLoja23.Text) + _
                                CDbl(Me.txtLoja24.Text) + CDbl(Me.txtLoja25.Text) + CDbl(Me.txtLoja26.Text) + _
                                CDbl(Me.txtLoja27.Text) + CDbl(Me.txtLoja28.Text) + CDbl(Me.txtLoja29.Text) + _
                                CDbl(Me.txtLoja30.Text) + CDbl(Me.txtLoja31.Text) + CDbl(Me.txtLoja32.Text) + CDbl(Me.txtLoja33.Text) + _
                                CDbl(Me.txtLoja34.Text) + CDbl(Me.txtLoja36.Text) + CDbl(Me.txtLoja37.Text) + _
                                CDbl(Me.txtLoja38.Text) + CDbl(Me.txtLoja39.Text) + CDbl(Me.txtLoja40.Text) + CDbl(Me.txtLoja41.Text) + CDbl(Me.txtLoja42.Text) + _
                                CDbl(Me.txtLoja43.Text) + CDbl(Me.txtLoja44.Text) + CDbl(Me.txtLoja45.Text) + CDbl(Me.txtLoja46.Text) + _
                                CDbl(Me.txtLoja47.Text) + CDbl(Me.txtLoja48.Text) + CDbl(Me.txtLoja49.Text) + CDbl(Me.txtLoja50.Text) + _
                                CDbl(Me.txtLoja51.Text) + CDbl(Me.txtLoja52.Text) + CDbl(Me.txtLoja53.Text) + CDbl(Me.txtLoja54.Text) + _
                                CDbl(Me.txtLoja55.Text) + CDbl(Me.txtLoja56.Text) + CDbl(Me.txtLoja57.Text) + CDbl(Me.txtLoja58.Text) + _
                                CDbl(Me.txtLoja59.Text) + CDbl(Me.txtLoja60.Text)).ToString("n2")

        Me.txtAtacarejosTotal.Text = (CDbl(Me.txtLoja603.Text) + CDbl(Me.txtLoja604.Text) + CDbl(Me.txtLoja606.Text)).ToString("n2")

        Me.txtPostosTotal.Text = (CDbl(Me.txtLoja203.Text) + CDbl(Me.txtLoja204.Text) + CDbl(Me.txtLoja205.Text) + _
                              CDbl(Me.txtLoja206.Text) + CDbl(Me.txtLoja211.Text) + CDbl(Me.txtLoja212.Text) + CDbl(Me.txtLoja213.Text) + _
                              CDbl(Me.txtLoja214.Text) + CDbl(Me.txtLoja215.Text) + CDbl(Me.txtLoja216.Text) + CDbl(Me.txtLoja217.Text) + _
                              CDbl(Me.txtLoja218.Text) + CDbl(Me.txtLoja219.Text) + CDbl(Me.txtLoja220.Text) + _
                              CDbl(Me.txtLoja221.Text) + CDbl(Me.txtLoja222.Text) + CDbl(Me.txtLoja223.Text) + _
                              CDbl(Me.txtLoja224.Text) + CDbl(Me.txtLoja225.Text) + CDbl(Me.txtLoja226.Text) + _
                              CDbl(Me.txtLoja227.Text) + CDbl(Me.txtLoja228.Text)).ToString("n2")

    End Sub

    Private Sub TexteChanged_Function(iValor As TextBox, iValorFocus As TextBox)
        iValor.Text = (iValor.Text * 1).ToString("n0")
        Call TotalizarRevista()
        iValorFocus.Focus()
    End Sub

    Protected Sub txtLoja03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja03.TextChanged
        Call TexteChanged_Function(Me.txtLoja03, Me.txtLoja04)
    End Sub

    Protected Sub txtLoja04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja04.TextChanged
        Call TexteChanged_Function(Me.txtLoja04, Me.txtloja05)
    End Sub

    Protected Sub txtLoja05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtloja05.TextChanged
        Call TexteChanged_Function(Me.txtloja05, Me.txtLoja06)
    End Sub
    Protected Sub txtLoja06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja06.TextChanged
        Call TexteChanged_Function(Me.txtLoja06, Me.txtLoja07)
    End Sub

    Protected Sub txtLoja07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja07.TextChanged
        Call TexteChanged_Function(Me.txtLoja07, Me.txtLoja08)
    End Sub

    Protected Sub txtLoja08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja08.TextChanged
        Call TexteChanged_Function(Me.txtLoja08, Me.txtLoja09)
    End Sub

    Protected Sub txtLoja09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja09.TextChanged
        Call TexteChanged_Function(Me.txtLoja09, Me.txtLoja10)
    End Sub

    Protected Sub txtLoja10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja10.TextChanged
        Call TexteChanged_Function(Me.txtLoja10, Me.txtLoja11)
    End Sub

    Protected Sub txtLoja11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja11.TextChanged
        Call TexteChanged_Function(Me.txtLoja11, Me.txtLoja13)
    End Sub

    Protected Sub txtLoja13_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja13.TextChanged
        Call TexteChanged_Function(Me.txtLoja13, Me.txtLoja14)
    End Sub

    Protected Sub txtLoja14_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja14.TextChanged
        Call TexteChanged_Function(Me.txtLoja14, Me.txtLoja15)
    End Sub

    Protected Sub txtLoja15_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja15.TextChanged
        Call TexteChanged_Function(Me.txtLoja15, Me.txtLoja17)
    End Sub

    Protected Sub txtLoja17_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja17.TextChanged
        Call TexteChanged_Function(Me.txtLoja17, Me.txtLoja18)
    End Sub

    Protected Sub txtLoja18_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja18.TextChanged
        Call TexteChanged_Function(Me.txtLoja18, Me.txtLoja19)
    End Sub

    Protected Sub txtLoja19_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja19.TextChanged
        Call TexteChanged_Function(Me.txtLoja19, Me.txtLoja20)
    End Sub

    Protected Sub txtLoja20_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja20.TextChanged
        Call TexteChanged_Function(Me.txtLoja20, Me.txtLoja21)
    End Sub

    Protected Sub txtLoja21_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja21.TextChanged
        Call TexteChanged_Function(Me.txtLoja21, Me.txtLoja22)
    End Sub

    Protected Sub txtLoja22_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja22.TextChanged
        Call TexteChanged_Function(Me.txtLoja22, Me.txtLoja23)
    End Sub

    Protected Sub txtLoja23_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja23.TextChanged
        Call TexteChanged_Function(Me.txtLoja23, Me.txtLoja24)
    End Sub

    Protected Sub txtLoja24_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja24.TextChanged
        Call TexteChanged_Function(Me.txtLoja24, Me.txtLoja25)
    End Sub

    Protected Sub txtLoja25_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja25.TextChanged
        Call TexteChanged_Function(Me.txtLoja25, Me.txtLoja26)
    End Sub

    Protected Sub txtLoja26_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja26.TextChanged
        Call TexteChanged_Function(Me.txtLoja26, Me.txtLoja27)
    End Sub

    Protected Sub txtLoja27_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja27.TextChanged
        Call TexteChanged_Function(Me.txtLoja27, Me.txtLoja28)
    End Sub

    Protected Sub txtLoja28_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja28.TextChanged
        Call TexteChanged_Function(Me.txtLoja28, Me.txtLoja29)
    End Sub

    Protected Sub txtLoja29_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja29.TextChanged
        Call TexteChanged_Function(Me.txtLoja29, Me.txtLoja30)
    End Sub

    Protected Sub txtLoja30_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja30.TextChanged
        Call TexteChanged_Function(Me.txtLoja30, Me.txtLoja31)
    End Sub

    Protected Sub txtLoja31_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja31.TextChanged
        Call TexteChanged_Function(Me.txtLoja31, Me.txtLoja32)
    End Sub

    Protected Sub txtLoja32_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja32.TextChanged
        Call TexteChanged_Function(Me.txtLoja32, Me.txtLoja33)
    End Sub

    Protected Sub txtLoja33_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja33.TextChanged
        Call TexteChanged_Function(Me.txtLoja33, Me.txtLoja34)
    End Sub

    Protected Sub txtLoja34_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja34.TextChanged
        Call TexteChanged_Function(Me.txtLoja34, Me.txtLoja36)
    End Sub

    Protected Sub txtLoja36_TextChanged(sender As Object, e As EventArgs) Handles txtLoja36.TextChanged
        Call TexteChanged_Function(Me.txtLoja36, Me.txtLoja37)
    End Sub

    Protected Sub txtLoja37_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja37.TextChanged
        Call TexteChanged_Function(Me.txtLoja37, Me.txtLoja38)
    End Sub

    Protected Sub txtLoja38_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja38.TextChanged
        Call TexteChanged_Function(Me.txtLoja38, Me.txtLoja39)
    End Sub

    Protected Sub txtLoja39_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja39.TextChanged
        Call TexteChanged_Function(Me.txtLoja39, Me.txtLoja40)
    End Sub

    Protected Sub txtLoja40_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja40.TextChanged
        Call TexteChanged_Function(Me.txtLoja40, Me.txtLoja41)
    End Sub

    Protected Sub txtLoja41_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja41.TextChanged
        Call TexteChanged_Function(Me.txtLoja41, Me.txtLoja42)
    End Sub

    Protected Sub txtLoja42_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja42.TextChanged
        Call TexteChanged_Function(Me.txtLoja42, Me.txtLoja43)
    End Sub

    Protected Sub txtLoja43_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja43.TextChanged
        Call TexteChanged_Function(Me.txtLoja43, Me.txtLoja44)
    End Sub

    Protected Sub txtLoja44_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja44.TextChanged
        Call TexteChanged_Function(Me.txtLoja44, Me.txtLoja45)
    End Sub

    Protected Sub txtLoja45_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja45.TextChanged
        Call TexteChanged_Function(Me.txtLoja45, Me.txtLoja46)
    End Sub

    Protected Sub txtLoja46_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja46.TextChanged
        Call TexteChanged_Function(Me.txtLoja46, Me.txtLoja47)
    End Sub

    Protected Sub txtLoja47_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja47.TextChanged
        Call TexteChanged_Function(Me.txtLoja47, Me.txtLoja48)
    End Sub

    Protected Sub txtLoja48_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja48.TextChanged
        Call TexteChanged_Function(Me.txtLoja48, Me.txtLoja49)
    End Sub

    Protected Sub txtLoja49_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja49.TextChanged
        Call TexteChanged_Function(Me.txtLoja49, Me.txtLoja50)
    End Sub

    Protected Sub txtLoja50_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja50.TextChanged
        Call TexteChanged_Function(Me.txtLoja50, Me.txtLoja51)
    End Sub
    Protected Sub txtLoja51_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja51.TextChanged
        Call TexteChanged_Function(Me.txtLoja51, Me.txtLoja52)
    End Sub
    Protected Sub txtLoja52_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja52.TextChanged
        Call TexteChanged_Function(Me.txtLoja52, Me.txtLoja53)
    End Sub
    Protected Sub txtLoja53_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja53.TextChanged
        Call TexteChanged_Function(Me.txtLoja53, Me.txtLoja54)
    End Sub

    Protected Sub txtLoja54_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja54.TextChanged
        Call TexteChanged_Function(Me.txtLoja54, Me.txtLoja55)
    End Sub
    Protected Sub txtLoja55_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja55.TextChanged
        Call TexteChanged_Function(Me.txtLoja55, Me.txtLoja56)
    End Sub

    Protected Sub txtLoja56_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja56.TextChanged
        Call TexteChanged_Function(Me.txtLoja56, Me.txtLoja57)
    End Sub

    Protected Sub txtLoja57_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja57.TextChanged
        Call TexteChanged_Function(Me.txtLoja57, Me.txtLoja58)
    End Sub

    Protected Sub txtLoja58_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja58.TextChanged
        Call TexteChanged_Function(Me.txtLoja58, Me.txtLoja59)
    End Sub

    Protected Sub txtLoja59_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja59.TextChanged
        Call TexteChanged_Function(Me.txtLoja59, Me.txtLoja58)
    End Sub

    Protected Sub txtLoja60_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja60.TextChanged
        Call TexteChanged_Function(Me.txtLoja60, Me.txtLoja59)
    End Sub

    Protected Sub txtLoja603_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja603.TextChanged
        Call TexteChanged_Function(Me.txtLoja603, Me.txtLoja604)
    End Sub

    Protected Sub txtLoja604_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja604.TextChanged
        Call TexteChanged_Function(Me.txtLoja606, Me.txtLoja604)
    End Sub

    Protected Sub txtLoja606_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja606.TextChanged
        Call TexteChanged_Function(Me.txtLoja604, Me.txtLoja603)
    End Sub

    Protected Sub txtLoja203_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja203.TextChanged
        Call TexteChanged_Function(Me.txtLoja203, Me.txtLoja203)
    End Sub


    Protected Sub txtLoja204_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja204.TextChanged
        Call TexteChanged_Function(Me.txtLoja204, Me.txtLoja203)
    End Sub


    Protected Sub txtLoja205_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja205.TextChanged
        Call TexteChanged_Function(Me.txtLoja205, Me.txtLoja204)
    End Sub


    Protected Sub txtLoja206_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja206.TextChanged
        Call TexteChanged_Function(Me.txtLoja206, Me.txtLoja205)
    End Sub


    Protected Sub txtLoja211_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja211.TextChanged
        Call TexteChanged_Function(Me.txtLoja211, Me.txtLoja206)
    End Sub


    Protected Sub txtLoja212_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja212.TextChanged
        Call TexteChanged_Function(Me.txtLoja212, Me.txtLoja211)
    End Sub


    Protected Sub txtLoja213_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja213.TextChanged
        Call TexteChanged_Function(Me.txtLoja213, Me.txtLoja212)
    End Sub


    Protected Sub txtLoja214_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja214.TextChanged
        Call TexteChanged_Function(Me.txtLoja214, Me.txtLoja213)
    End Sub


    Protected Sub txtLoja215_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja215.TextChanged
        Call TexteChanged_Function(Me.txtLoja215, Me.txtLoja214)
    End Sub


    Protected Sub txtLoja216_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja216.TextChanged
        Call TexteChanged_Function(Me.txtLoja216, Me.txtLoja215)
    End Sub


    Protected Sub txtLoja217_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja217.TextChanged
        Call TexteChanged_Function(Me.txtLoja217, Me.txtLoja216)
    End Sub


    Protected Sub txtLoja218_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja218.TextChanged
        Call TexteChanged_Function(Me.txtLoja218, Me.txtLoja217)
    End Sub


    Protected Sub txtLoja219_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja219.TextChanged
        Call TexteChanged_Function(Me.txtLoja219, Me.txtLoja218)
    End Sub


    Protected Sub txtLoja220_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja220.TextChanged
        Call TexteChanged_Function(Me.txtLoja220, Me.txtLoja219)
    End Sub


    Protected Sub txtLoja221_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja221.TextChanged
        Call TexteChanged_Function(Me.txtLoja221, Me.txtLoja220)
    End Sub


    Protected Sub txtLoja222_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja222.TextChanged
        Call TexteChanged_Function(Me.txtLoja222, Me.txtLoja221)
    End Sub


    Protected Sub txtLoja223_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja223.TextChanged
        Call TexteChanged_Function(Me.txtLoja223, Me.txtLoja222)
    End Sub


    Protected Sub txtLoja224_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja224.TextChanged
        Call TexteChanged_Function(Me.txtLoja224, Me.txtLoja223)
    End Sub


    Protected Sub txtLoja225_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja225.TextChanged
        Call TexteChanged_Function(Me.txtLoja225, Me.txtLoja224)
    End Sub


    Protected Sub txtLoja226_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja226.TextChanged
        Call TexteChanged_Function(Me.txtLoja226, Me.txtLoja225)
    End Sub


    Protected Sub txtLoja227_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja227.TextChanged
        Call TexteChanged_Function(Me.txtLoja227, Me.txtLoja226)
    End Sub

    Protected Sub txtLoja228_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtLoja228.TextChanged
        Call TexteChanged_Function(Me.txtLoja228, Me.txtLoja227)
    End Sub
    

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        oVem.BuscaProgramaStatus(Me.cboAno.CallAno, Me.cboMes.CallMes, "frmCadMetaVendaMes")
        Me.Label1.Text = oVem.vlrRea

        Call Salvar()

        'Select Case oVem.vlrRea
        '    Case 0  'Não foi salvo ainda
        '        Call Salvar()
        '    Case 1  'Já foi salvo
        '        Beep()
        '        oVem.UserMsgBox(Me, "Este período já foi salvo!!! Se você precisar alterar a venda de uma filial especifica vá no Replanejamento e altere lá. Não esqueça de salvar.")
        'End Select

    End Sub

#Region " Salvar"


    Private Sub fnSalvar(ByVal iFilial As Int16, iTextFilial As TextBox)
        oVem.Salvar_Rev(1, Me.cboAno.CallAno, Me.cboMes.CallMes, iFilial, iTextFilial.Text, 100, 1, User.Identity.Name)
    End Sub

    Private Sub fnCalcularMetaRevistaTeorico(ByVal iFilial As Int16)
        oVem.CalcularMetaRevistaTeorico(Me.cboAno.CallAno, Me.cboMes.CallMes, iFilial, User.Identity.Name)
    End Sub

    Private Sub Salvar_Atacarejo()

        fnSalvar(603, txtLoja603)
        fnSalvar(604, txtLoja604)
        fnSalvar(606, txtLoja606)

    End Sub

    Private Sub SalvarPostos()

        fnSalvar(203, txtLoja203)
        fnSalvar(204, txtLoja204)
        fnSalvar(205, txtLoja205)
        fnSalvar(206, txtLoja206)
        fnSalvar(211, txtLoja211)
        fnSalvar(212, txtLoja212)
        fnSalvar(213, txtLoja213)
        fnSalvar(214, txtLoja214)
        fnSalvar(215, txtLoja215)
        fnSalvar(216, txtLoja216)
        fnSalvar(217, txtLoja217)
        fnSalvar(218, txtLoja218)
        fnSalvar(219, txtLoja219)
        fnSalvar(220, txtLoja220)
        fnSalvar(221, txtLoja221)
        fnSalvar(222, txtLoja222)
        fnSalvar(223, txtLoja223)
        fnSalvar(224, txtLoja224)
        fnSalvar(225, txtLoja225)
        fnSalvar(226, txtLoja226)
        fnSalvar(227, txtLoja227)
        fnSalvar(228, txtLoja228)

    End Sub


    Private Sub Salvar()
        Dim oVem As New VendaEmpresaMes
        Dim varVenda, varVlrRevista, varPercRevista, varCalc As Double
        Dim varFilialApoio As Byte

        fnSalvar(3, txtLoja03)
        fnSalvar(4, txtLoja04)
        fnSalvar(5, txtloja05)
        fnSalvar(6, txtLoja06)
        fnSalvar(7, txtLoja07)
        fnSalvar(8, txtLoja08)
        fnSalvar(9, txtLoja09)

        fnSalvar(10, txtLoja10)
        fnSalvar(11, txtLoja11)
        fnSalvar(13, txtLoja13)
        fnSalvar(14, txtLoja14)
        fnSalvar(15, txtLoja15)
        fnSalvar(17, txtLoja17)
        fnSalvar(18, txtLoja18)
        fnSalvar(19, txtLoja19)

        fnSalvar(20, txtLoja20)
        fnSalvar(21, txtLoja21)
        fnSalvar(22, txtLoja22)
        fnSalvar(23, txtLoja23)
        fnSalvar(24, txtLoja24)
        fnSalvar(25, txtLoja25)
        fnSalvar(26, txtLoja26)
        fnSalvar(27, txtLoja27)
        fnSalvar(28, txtLoja28)
        fnSalvar(29, txtLoja29)

        fnSalvar(30, txtLoja30)
        fnSalvar(31, txtLoja31)
        fnSalvar(32, txtLoja32)
        fnSalvar(33, txtLoja33)
        fnSalvar(34, txtLoja34)
        fnSalvar(36, txtLoja36)
        fnSalvar(37, txtLoja37)
        fnSalvar(38, txtLoja38)
        fnSalvar(39, txtLoja39)

        fnSalvar(40, txtLoja40)
        fnSalvar(41, txtLoja41)
        fnSalvar(42, txtLoja42)
        fnSalvar(43, txtLoja43)
        fnSalvar(44, txtLoja44)
        fnSalvar(45, txtLoja45)
        fnSalvar(46, txtLoja46)
        fnSalvar(47, txtLoja47)
        fnSalvar(48, txtLoja48)
        fnSalvar(49, txtLoja49)

        fnSalvar(50, txtLoja50)
        fnSalvar(51, txtLoja51)
        fnSalvar(52, txtLoja52)
        fnSalvar(53, txtLoja53)
        fnSalvar(54, txtLoja54)
        fnSalvar(55, txtLoja55)
        fnSalvar(56, txtLoja56)
        fnSalvar(57, txtLoja57)
        fnSalvar(58, txtLoja58)
        fnSalvar(59, txtLoja59)
        fnSalvar(60, txtLoja60)

        'Informações da Empresa = Codigo: 199
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 199)
        oVem.Salvar_Rev_Empresa(1, Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name)

        'Atualiza as Lojas do Apoio com base na nova venda da empresa
        oVem.AtualizarVendas_LojasDoApoio(Me.cboAno.CallAno, Me.cboMes.CallMes)

        'Informações do SuperHiper = Codigo: 207, 208
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 207)
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 208)
        oVem.Salvar_Rev_SuperHiper(1, Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name)

        'Informações do Regional = Codigo: 204, 205, 206, 209, 214
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 204)
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 205)
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 206)
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 209)
        oVem.Excluir_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 214)
        oVem.Salvar_Rev_Regional(1, Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name)

        'Falta por Região
        '----------------------

        'Calcular Despesas do Apoio com base no % da Original
        varVlrRevista = 0

        'BuscarVenda da Empresa
        oVem.Busca_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 199)
        varVenda = oVem.vlrRev

        'CD --------------------------------------------------------------------------
        varFilialApoio = 1
        '35-Leasing
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        '36-Depreciação
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        'CEASA --------------------------------------------------------------------------
        varFilialApoio = 16
        '35-Leasing
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        '36-Depreciação
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        'ADMINISTRAÇÃO --------------------------------------------------------------------------
        varFilialApoio = 100
        '35-Leasing
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(35, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        '36-Depreciação
        varPercRevista = 0
        varCalc = 0
        oVem.BuscaRevGrupoMes(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio)
        varPercRevista = oVem.percRev
        varCalc = varPercRevista * varVenda / 100
        oVem.Salvar_Rev(36, Me.cboAno.CallAno, Me.cboMes.CallMes, varFilialApoio, varCalc, varPercRevista, 7, User.Identity.Name)

        'Atualizar Despesas do Apoio
        'Exclui a meta revista de despesa antiga do Apoio (todas as contas de despesa)
        'Adicina a meta revista de despesa nova do Apoio (todas as contas de despesa)
        oVem.Apoio_Rev_Atualizar(Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name)

        'Buscar Dados Do Apoio
        Call BuscarApoio()

        'Atualizar o % de Apoio nas Lojas
        oVem.Apoio_Rev_AtualizarPercentualNasLojas(Me.cboAno.CallAno, Me.cboMes.CallMes, User.Identity.Name)

        Me.Label1.Text = ""
        Me.Label1.Text = oVem.varDesc

        'Recalcula as contas do Teórico
        'oVem.CalcularMetaRevistaTeorico(Me.cboAno.CallAno, Me.cboMes.CallMes, 1, User.Identity.Name)
        fnCalcularMetaRevistaTeorico(3)
        fnCalcularMetaRevistaTeorico(4)
        fnCalcularMetaRevistaTeorico(5)
        fnCalcularMetaRevistaTeorico(6)
        fnCalcularMetaRevistaTeorico(7)
        fnCalcularMetaRevistaTeorico(8)
        fnCalcularMetaRevistaTeorico(9)

        fnCalcularMetaRevistaTeorico(10)
        fnCalcularMetaRevistaTeorico(11)
        fnCalcularMetaRevistaTeorico(13)
        fnCalcularMetaRevistaTeorico(14)
        fnCalcularMetaRevistaTeorico(15)
        ' fnCalcularMetaRevistaTeorico( 16)
        fnCalcularMetaRevistaTeorico(17)
        fnCalcularMetaRevistaTeorico(18)
        fnCalcularMetaRevistaTeorico(19)

        fnCalcularMetaRevistaTeorico(20)
        fnCalcularMetaRevistaTeorico(21)
        fnCalcularMetaRevistaTeorico(22)
        fnCalcularMetaRevistaTeorico(23)
        fnCalcularMetaRevistaTeorico(24)
        fnCalcularMetaRevistaTeorico(25)
        fnCalcularMetaRevistaTeorico(26)
        fnCalcularMetaRevistaTeorico(27)
        fnCalcularMetaRevistaTeorico(28)
        fnCalcularMetaRevistaTeorico(29)

        fnCalcularMetaRevistaTeorico(30)
        fnCalcularMetaRevistaTeorico(31)
        fnCalcularMetaRevistaTeorico(32)
        fnCalcularMetaRevistaTeorico(33)
        fnCalcularMetaRevistaTeorico(34)
        fnCalcularMetaRevistaTeorico(35)
        fnCalcularMetaRevistaTeorico(36)
        fnCalcularMetaRevistaTeorico(37)
        fnCalcularMetaRevistaTeorico(38)
        fnCalcularMetaRevistaTeorico(39)

        fnCalcularMetaRevistaTeorico(40)
        fnCalcularMetaRevistaTeorico(41)
        fnCalcularMetaRevistaTeorico(42)
        fnCalcularMetaRevistaTeorico(43)
        fnCalcularMetaRevistaTeorico(44)
        fnCalcularMetaRevistaTeorico(45)
        fnCalcularMetaRevistaTeorico(46)
        fnCalcularMetaRevistaTeorico(47)
        fnCalcularMetaRevistaTeorico(48)
        fnCalcularMetaRevistaTeorico(49)

        fnCalcularMetaRevistaTeorico(50)
        fnCalcularMetaRevistaTeorico(51)
        fnCalcularMetaRevistaTeorico(52)
        fnCalcularMetaRevistaTeorico(53)
        fnCalcularMetaRevistaTeorico(54)
        fnCalcularMetaRevistaTeorico(55)
        fnCalcularMetaRevistaTeorico(56)
        fnCalcularMetaRevistaTeorico(57)
        fnCalcularMetaRevistaTeorico(58)
        fnCalcularMetaRevistaTeorico(59)
        fnCalcularMetaRevistaTeorico(60)

        fnCalcularMetaRevistaTeorico(603)
        fnCalcularMetaRevistaTeorico(604)
        fnCalcularMetaRevistaTeorico(606)

        oVem.UserMsgBox(Me, "As vendas foram salvas com sucesso")

    End Sub

#End Region

    Private Sub BuscarApoio_Original()
        oVem.Busca_Ori_Corporacao(14, Me.cboAno.CallAno, Me.cboMes.CallMes, 198)
        Me.lblVlrApoioOri.Text = oVem.vlrOri
        Me.lblPercApoioOri.Text = oVem.percOri

    End Sub

    Private Sub BuscarApoio_Revisto()
        oVem.Busca_Rev_Corporacao(14, Me.cboAno.CallAno, Me.cboMes.CallMes, 198)
        Me.lblVlrApoioRev.Text = oVem.vlrRev
        Me.lblPercApoioRev.Text = oVem.percRev
    End Sub

    Private Sub BuscarApoio()
        Call BuscarApoio_Original()
        Call BuscarApoio_Revisto()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim varMes As Byte = Month(Now())

            If varMes = 12 Then
                Me.cboAno.CallAno = Year(Now()) + 1
                Me.cboMes.CallMes = 1

            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Call BuscarApoio_Original()
            Call BuscarApoio_Revisto()

            Call BuscarVendaOriginal()
            Call BuscarVendaRevista()
            Call TotalizarOriginal()
            Call TotalizarRevista()
            Me.rndUltimaLinha.Checked = True

            cboMes.AutoPostBack = True
            cboMes.Visible_Ano = False

        End If
    End Sub

    Protected Sub GridRF_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles GridRF.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub rndUltimaLinha_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndUltimaLinha.CheckedChanged
        Call OcultarGrid()
        If Me.rndUltimaLinha.Checked = True Then Me.GridRF.Visible = True
        Me.GridRF.DataBind()
    End Sub

    Private Sub OcultarGrid()
        Me.GridRF.Visible = False
        Me.GridMargem.Visible = False
        Me.GridAgenda23.Visible = False
        Me.GridPart.Visible = False
    End Sub

    Protected Sub rndMargem_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndMargem.CheckedChanged
        Call OcultarGrid()
        If Me.rndMargem.Checked = True Then Me.GridMargem.Visible = True
        Me.GridMargem.DataBind()
    End Sub

    Protected Sub rndAgenda23_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndAgenda23.CheckedChanged
        Call OcultarGrid()
        If Me.rndAgenda23.Checked = True Then Me.GridAgenda23.Visible = True
        Me.GridAgenda23.DataBind()
    End Sub

    Protected Sub rndPart_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndPart.CheckedChanged
        Call OcultarGrid()
        If Me.rndPart.Checked = True Then Me.GridPart.Visible = True
        Me.GridPart.DataBind()
    End Sub


    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call BuscarApoio()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
        Call BuscarApoio()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Atualizar()
        End If
    End Sub

    Protected Sub btnSalvar_Postos_Click(sender As Object, e As EventArgs) Handles btnSalvar_Postos.Click
        SalvarPostos()
    End Sub

    Protected Sub btn_Salvar_Atacarejos_Click(sender As Object, e As EventArgs) Handles btn_Salvar_Atacarejos.Click
        Salvar_Atacarejo()
    End Sub
End Class
