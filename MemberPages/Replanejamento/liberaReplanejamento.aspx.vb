
Partial Class MemberPages_Replanejamento_liberaReplanejamento
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2017
            Me.cboAno.AnoFinal = Year(DateAndTime.Now()) + 1
            Me.cboAno.CallAno = Year(DateAndTime.Now())
        End If
    End Sub

    Protected Sub btnSelecionarTodasLojas_Click(sender As Object, e As EventArgs) Handles btnSelecionarTodasLojas.Click
        Call Marcar(Me.chk_Loja03)
        Call Marcar(Me.chk_Loja04)
        Call Marcar(Me.chk_Loja05)
        Call Marcar(Me.chk_Loja06)
        Call Marcar(Me.chk_Loja07)
        Call Marcar(Me.chk_Loja08)
        Call Marcar(Me.chk_Loja09)

        Call Marcar(Me.chk_Loja10)
        Call Marcar(Me.chk_Loja11)
        Call Marcar(Me.chk_Loja13)
        Call Marcar(Me.chk_Loja14)
        Call Marcar(Me.chk_Loja15)
        Call Marcar(Me.chk_Loja17)
        Call Marcar(Me.chk_Loja18)
        Call Marcar(Me.chk_Loja19)

        Call Marcar(Me.chk_Loja20)
        Call Marcar(Me.chk_Loja21)
        Call Marcar(Me.chk_Loja22)
        Call Marcar(Me.chk_Loja23)
        Call Marcar(Me.chk_Loja24)
        Call Marcar(Me.chk_Loja25)
        Call Marcar(Me.chk_Loja26)
        Call Marcar(Me.chk_Loja27)
        Call Marcar(Me.chk_Loja28)
        Call Marcar(Me.chk_Loja29)

        Call Marcar(Me.chk_Loja30)
        Call Marcar(Me.chk_Loja31)
        Call Marcar(Me.chk_Loja32)
        Call Marcar(Me.chk_Loja33)
        Call Marcar(Me.chk_Loja34)
        Call Marcar(Me.chk_Loja36)
        Call Marcar(Me.chk_Loja37)
        Call Marcar(Me.chk_Loja38)
        Call Marcar(Me.chk_Loja39)

        Call Marcar(Me.chk_Loja40)
        Call Marcar(Me.chk_Loja41)
        Call Marcar(Me.chk_Loja42)
        Call Marcar(Me.chk_Loja43)
        Call Marcar(Me.chk_Loja44)
        Call Marcar(Me.chk_Loja45)
        Call Marcar(Me.chk_Loja46)
        Call Marcar(Me.chk_Loja47)
        Call Marcar(Me.chk_Loja48)
        Call Marcar(Me.chk_Loja49)

        Call Marcar(Me.chk_Loja50)
        Call Marcar(Me.chk_Loja51)
        Call Marcar(Me.chk_Loja52)
        Call Marcar(Me.chk_Loja53)
        Call Marcar(Me.chk_Loja54)

        Call Marcar(Me.chk_Loja55)
        Call Marcar(Me.chk_Loja56)
        Call Marcar(Me.chk_Loja57)
        Call Marcar(Me.chk_Loja58)
        Call Marcar(Me.chk_Loja59)
        Call Marcar(Me.chk_Loja60)

        Call Marcar(Me.chk_Loja603)
        Call Marcar(Me.chk_Loja604)
        Call Marcar(Me.chk_Loja605)
        Call Marcar(Me.chk_Loja606)

        Call Marcar(Me.chk_Loja203)
        Call Marcar(Me.chk_Loja204)
        Call Marcar(Me.chk_Loja205)
        Call Marcar(Me.chk_Loja206)
        Call Marcar(Me.chk_Loja211)
        Call Marcar(Me.chk_Loja212)
        Call Marcar(Me.chk_Loja213)

        Call Marcar(Me.chk_Loja214)
        Call Marcar(Me.chk_Loja215)
        Call Marcar(Me.chk_Loja216)
        Call Marcar(Me.chk_Loja217)
        Call Marcar(Me.chk_Loja218)
        Call Marcar(Me.chk_Loja219)
        Call Marcar(Me.chk_Loja220)

        Call Marcar(Me.chk_Loja221)
        Call Marcar(Me.chk_Loja222)
        Call Marcar(Me.chk_Loja223)
        Call Marcar(Me.chk_Loja224)
        Call Marcar(Me.chk_Loja225)
        Call Marcar(Me.chk_Loja226)

        Call Marcar(Me.chk_Loja227)
        Call Marcar(Me.chk_Loja228)

    End Sub


    Protected Sub btnSelecionarCondor_Click(sender As Object, e As EventArgs) Handles btnSelecionarCondor.Click



        Call Marcar(Me.chk_Loja03)
        Call Marcar(Me.chk_Loja04)
        Call Marcar(Me.chk_Loja05)
        Call Marcar(Me.chk_Loja06)
        Call Marcar(Me.chk_Loja07)
        Call Marcar(Me.chk_Loja08)
        Call Marcar(Me.chk_Loja09)

        Call Marcar(Me.chk_Loja10)
        Call Marcar(Me.chk_Loja11)
        Call Marcar(Me.chk_Loja13)
        Call Marcar(Me.chk_Loja14)
        Call Marcar(Me.chk_Loja15)
        Call Marcar(Me.chk_Loja17)
        Call Marcar(Me.chk_Loja18)
        Call Marcar(Me.chk_Loja19)

        Call Marcar(Me.chk_Loja20)
        Call Marcar(Me.chk_Loja21)
        Call Marcar(Me.chk_Loja22)
        Call Marcar(Me.chk_Loja23)
        Call Marcar(Me.chk_Loja24)
        Call Marcar(Me.chk_Loja25)
        Call Marcar(Me.chk_Loja26)
        Call Marcar(Me.chk_Loja27)
        Call Marcar(Me.chk_Loja28)
        Call Marcar(Me.chk_Loja29)

        Call Marcar(Me.chk_Loja30)
        Call Marcar(Me.chk_Loja31)
        Call Marcar(Me.chk_Loja32)
        Call Marcar(Me.chk_Loja33)
        Call Marcar(Me.chk_Loja34)
        Call Marcar(Me.chk_Loja36)
        Call Marcar(Me.chk_Loja37)
        Call Marcar(Me.chk_Loja38)
        Call Marcar(Me.chk_Loja39)

        Call Marcar(Me.chk_Loja40)
        Call Marcar(Me.chk_Loja41)
        Call Marcar(Me.chk_Loja42)
        Call Marcar(Me.chk_Loja43)
        Call Marcar(Me.chk_Loja44)
        Call Marcar(Me.chk_Loja45)
        Call Marcar(Me.chk_Loja46)
        Call Marcar(Me.chk_Loja47)
        Call Marcar(Me.chk_Loja48)
        Call Marcar(Me.chk_Loja49)

        Call Marcar(Me.chk_Loja50)
        Call Marcar(Me.chk_Loja51)
        Call Marcar(Me.chk_Loja52)
        Call Marcar(Me.chk_Loja53)
        Call Marcar(Me.chk_Loja54)

        Call Marcar(Me.chk_Loja55)
        Call Marcar(Me.chk_Loja56)
        Call Marcar(Me.chk_Loja57)
        Call Marcar(Me.chk_Loja58)
        Call Marcar(Me.chk_Loja59)
        Call Marcar(Me.chk_Loja60)

    End Sub


    Protected Sub btnSelecionarGigante_Click(sender As Object, e As EventArgs) Handles btnSelecionarGigante.Click

        Call Marcar(Me.chk_Loja603)
        Call Marcar(Me.chk_Loja604)
        Call Marcar(Me.chk_Loja605)
        Call Marcar(Me.chk_Loja606)

    End Sub


    Private Sub Desmarcar(ByVal myCheck As CheckBox)
        myCheck.Checked = False
    End Sub

    Private Sub Marcar(ByVal myCheck As CheckBox)
        myCheck.Checked = True
    End Sub

    Protected Sub btnDesmarcarTodasLojas_Click(sender As Object, e As EventArgs) Handles btnDesmarcarTodasLojas.Click
        Call Desmarcar(Me.chk_Loja03)
        Call Desmarcar(Me.chk_Loja04)
        Call Desmarcar(Me.chk_Loja05)
        Call Desmarcar(Me.chk_Loja06)
        Call Desmarcar(Me.chk_Loja07)
        Call Desmarcar(Me.chk_Loja08)
        Call Desmarcar(Me.chk_Loja09)

        Call Desmarcar(Me.chk_Loja10)
        Call Desmarcar(Me.chk_Loja11)
        Call Desmarcar(Me.chk_Loja13)
        Call Desmarcar(Me.chk_Loja14)
        Call Desmarcar(Me.chk_Loja15)
        Call Desmarcar(Me.chk_Loja17)
        Call Desmarcar(Me.chk_Loja18)
        Call Desmarcar(Me.chk_Loja19)

        Call Desmarcar(Me.chk_Loja20)
        Call Desmarcar(Me.chk_Loja21)
        Call Desmarcar(Me.chk_Loja22)
        Call Desmarcar(Me.chk_Loja23)
        Call Desmarcar(Me.chk_Loja24)
        Call Desmarcar(Me.chk_Loja25)
        Call Desmarcar(Me.chk_Loja26)
        Call Desmarcar(Me.chk_Loja27)
        Call Desmarcar(Me.chk_Loja28)
        Call Desmarcar(Me.chk_Loja29)

        Call Desmarcar(Me.chk_Loja30)
        Call Desmarcar(Me.chk_Loja31)
        Call Desmarcar(Me.chk_Loja32)
        Call Desmarcar(Me.chk_Loja33)
        Call Desmarcar(Me.chk_Loja34)
        Call Desmarcar(Me.chk_Loja36)
        Call Desmarcar(Me.chk_Loja37)
        Call Desmarcar(Me.chk_Loja38)
        Call Desmarcar(Me.chk_Loja39)

        Call Desmarcar(Me.chk_Loja40)
        Call Desmarcar(Me.chk_Loja41)
        Call Desmarcar(Me.chk_Loja42)
        Call Desmarcar(Me.chk_Loja43)
        Call Desmarcar(Me.chk_Loja44)
        Call Desmarcar(Me.chk_Loja45)
        Call Desmarcar(Me.chk_Loja46)
        Call Desmarcar(Me.chk_Loja47)
        Call Desmarcar(Me.chk_Loja48)
        Call Desmarcar(Me.chk_Loja49)

        Call Desmarcar(Me.chk_Loja50)
        Call Desmarcar(Me.chk_Loja51)
        Call Desmarcar(Me.chk_Loja52)
        Call Desmarcar(Me.chk_Loja53)
        Call Desmarcar(Me.chk_Loja54)

        Call Desmarcar(Me.chk_Loja55)
        Call Desmarcar(Me.chk_Loja56)
        Call Desmarcar(Me.chk_Loja57)
        Call Desmarcar(Me.chk_Loja58)
        Call Desmarcar(Me.chk_Loja59)
        Call Desmarcar(Me.chk_Loja60)

        Call Desmarcar(Me.chk_Loja603)
        Call Desmarcar(Me.chk_Loja604)
        Call Desmarcar(Me.chk_Loja605)
        Call Desmarcar(Me.chk_Loja606)

        Call Desmarcar(Me.chk_Loja203)
        Call Desmarcar(Me.chk_Loja204)
        Call Desmarcar(Me.chk_Loja205)
        Call Desmarcar(Me.chk_Loja206)
        Call Desmarcar(Me.chk_Loja211)
        Call Desmarcar(Me.chk_Loja212)
        Call Desmarcar(Me.chk_Loja213)

        Call Desmarcar(Me.chk_Loja214)
        Call Desmarcar(Me.chk_Loja215)
        Call Desmarcar(Me.chk_Loja216)
        Call Desmarcar(Me.chk_Loja217)
        Call Desmarcar(Me.chk_Loja218)
        Call Desmarcar(Me.chk_Loja219)
        Call Desmarcar(Me.chk_Loja220)

        Call Desmarcar(Me.chk_Loja221)
        Call Desmarcar(Me.chk_Loja222)
        Call Desmarcar(Me.chk_Loja223)
        Call Desmarcar(Me.chk_Loja224)
        Call Desmarcar(Me.chk_Loja225)
        Call Desmarcar(Me.chk_Loja226)

        Call Desmarcar(Me.chk_Loja227)
        Call Desmarcar(Me.chk_Loja228)

    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If Me.chk_Replanejamento.Checked = True Then Atualizar_Replanejamento()
        If Me.chk_Participacao.Checked = True Then Atualizar_Participacao()
        If Me.chk_Margem.Checked = True Then Atualizar_Margem()
        If Me.chk_Agenda23.Checked = True Then Atualizar_Agenda23()

        If Me.chk_Replanejamento.Checked = False AndAlso
           Me.chk_Participacao.Checked = False AndAlso
           Me.chk_Margem.Checked = False AndAlso
           Me.chk_Agenda23.Checked = False Then
            oVem.UserMsgBox(Me, "Você deve selecionar uma opção, exemplo: 'Replanejamento' ou 'Margem' etc...")
        Else
            oVem.UserMsgBox(Me, "As informações foram salvas com sucesso!!!")
        End If

    End Sub

#Region " Salvar"

    Private Sub Salvar(ByVal chkLoja As CheckBox, ByVal Filial As Int16, ByVal Tipo As Byte)

        If chkLoja.Checked = True Then
            oVem.AtualizaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Filial, Tipo, 1)
        End If
    End Sub

#End Region

#Region " Atualizações"

    Private Sub Atualizar_Replanejamento()
        Dim varTipo As Byte
        varTipo = 1 'Replanejamento
        Call Salvar(Me.chk_Loja03, 3, varTipo)
        Call Salvar(Me.chk_Loja04, 4, varTipo)
        Call Salvar(Me.chk_Loja05, 5, varTipo)
        Call Salvar(Me.chk_Loja06, 6, varTipo)
        Call Salvar(Me.chk_Loja07, 7, varTipo)
        Call Salvar(Me.chk_Loja08, 8, varTipo)
        Call Salvar(Me.chk_Loja09, 9, varTipo)

        Call Salvar(Me.chk_Loja10, 10, varTipo)
        Call Salvar(Me.chk_Loja11, 11, varTipo)
        Call Salvar(Me.chk_Loja13, 13, varTipo)
        Call Salvar(Me.chk_Loja14, 14, varTipo)
        Call Salvar(Me.chk_Loja15, 15, varTipo)
        Call Salvar(Me.chk_Loja17, 17, varTipo)
        Call Salvar(Me.chk_Loja18, 18, varTipo)
        Call Salvar(Me.chk_Loja19, 19, varTipo)

        Call Salvar(Me.chk_Loja20, 20, varTipo)
        Call Salvar(Me.chk_Loja21, 21, varTipo)
        Call Salvar(Me.chk_Loja22, 22, varTipo)
        Call Salvar(Me.chk_Loja23, 23, varTipo)
        Call Salvar(Me.chk_Loja24, 24, varTipo)
        Call Salvar(Me.chk_Loja25, 25, varTipo)
        Call Salvar(Me.chk_Loja26, 26, varTipo)
        Call Salvar(Me.chk_Loja27, 27, varTipo)
        Call Salvar(Me.chk_Loja28, 28, varTipo)
        Call Salvar(Me.chk_Loja29, 29, varTipo)

        Call Salvar(Me.chk_Loja30, 30, varTipo)
        Call Salvar(Me.chk_Loja31, 31, varTipo)
        Call Salvar(Me.chk_Loja32, 32, varTipo)
        Call Salvar(Me.chk_Loja33, 33, varTipo)
        Call Salvar(Me.chk_Loja34, 34, varTipo)
        Call Salvar(Me.chk_Loja36, 36, varTipo)
        Call Salvar(Me.chk_Loja37, 37, varTipo)
        Call Salvar(Me.chk_Loja38, 38, varTipo)
        Call Salvar(Me.chk_Loja39, 39, varTipo)

        Call Salvar(Me.chk_Loja40, 40, varTipo)
        Call Salvar(Me.chk_Loja41, 41, varTipo)
        Call Salvar(Me.chk_Loja42, 42, varTipo)
        Call Salvar(Me.chk_Loja43, 43, varTipo)
        Call Salvar(Me.chk_Loja44, 44, varTipo)
        Call Salvar(Me.chk_Loja45, 45, varTipo)
        Call Salvar(Me.chk_Loja46, 46, varTipo)
        Call Salvar(Me.chk_Loja47, 47, varTipo)
        Call Salvar(Me.chk_Loja48, 48, varTipo)
        Call Salvar(Me.chk_Loja49, 49, varTipo)

        Call Salvar(Me.chk_Loja50, 50, varTipo)
        Call Salvar(Me.chk_Loja51, 51, varTipo)
        Call Salvar(Me.chk_Loja52, 52, varTipo)
        Call Salvar(Me.chk_Loja53, 53, varTipo)
        Call Salvar(Me.chk_Loja54, 54, varTipo)

        Call Salvar(Me.chk_Loja55, 55, varTipo)
        Call Salvar(Me.chk_Loja56, 56, varTipo)
        Call Salvar(Me.chk_Loja57, 57, varTipo)
        Call Salvar(Me.chk_Loja58, 58, varTipo)
        Call Salvar(Me.chk_Loja59, 59, varTipo)
        Call Salvar(Me.chk_Loja60, 60, varTipo)

        Call Salvar(Me.chk_Loja603, 603, varTipo)
        Call Salvar(Me.chk_Loja604, 604, varTipo)
        Call Salvar(Me.chk_Loja605, 605, varTipo)
        Call Salvar(Me.chk_Loja606, 606, varTipo)

        Call Salvar(Me.chk_Loja203, 203, varTipo)
        Call Salvar(Me.chk_Loja204, 204, varTipo)
        Call Salvar(Me.chk_Loja205, 205, varTipo)
        Call Salvar(Me.chk_Loja206, 206, varTipo)
        Call Salvar(Me.chk_Loja211, 211, varTipo)
        Call Salvar(Me.chk_Loja212, 212, varTipo)

        Call Salvar(Me.chk_Loja213, 213, varTipo)
        Call Salvar(Me.chk_Loja214, 214, varTipo)
        Call Salvar(Me.chk_Loja215, 215, varTipo)
        Call Salvar(Me.chk_Loja216, 216, varTipo)
        Call Salvar(Me.chk_Loja217, 217, varTipo)
        Call Salvar(Me.chk_Loja218, 218, varTipo)

        Call Salvar(Me.chk_Loja219, 219, varTipo)
        Call Salvar(Me.chk_Loja220, 220, varTipo)
        Call Salvar(Me.chk_Loja221, 221, varTipo)
        Call Salvar(Me.chk_Loja222, 222, varTipo)
        Call Salvar(Me.chk_Loja223, 223, varTipo)
        Call Salvar(Me.chk_Loja224, 224, varTipo)

        Call Salvar(Me.chk_Loja225, 225, varTipo)
        Call Salvar(Me.chk_Loja226, 226, varTipo)
        Call Salvar(Me.chk_Loja227, 227, varTipo)
        Call Salvar(Me.chk_Loja228, 228, varTipo)

    End Sub

    Private Sub Atualizar_Participacao()
        Dim varTipo As Byte
        varTipo = 2 'Participacao
        Call Salvar(Me.chk_Loja03, 3, varTipo)
        Call Salvar(Me.chk_Loja04, 4, varTipo)
        Call Salvar(Me.chk_Loja05, 5, varTipo)
        Call Salvar(Me.chk_Loja06, 6, varTipo)
        Call Salvar(Me.chk_Loja07, 7, varTipo)
        Call Salvar(Me.chk_Loja08, 8, varTipo)
        Call Salvar(Me.chk_Loja09, 9, varTipo)

        Call Salvar(Me.chk_Loja10, 10, varTipo)
        Call Salvar(Me.chk_Loja11, 11, varTipo)
        Call Salvar(Me.chk_Loja13, 13, varTipo)
        Call Salvar(Me.chk_Loja14, 14, varTipo)
        Call Salvar(Me.chk_Loja15, 15, varTipo)
        Call Salvar(Me.chk_Loja17, 17, varTipo)
        Call Salvar(Me.chk_Loja18, 18, varTipo)
        Call Salvar(Me.chk_Loja19, 19, varTipo)

        Call Salvar(Me.chk_Loja20, 20, varTipo)
        Call Salvar(Me.chk_Loja21, 21, varTipo)
        Call Salvar(Me.chk_Loja22, 22, varTipo)
        Call Salvar(Me.chk_Loja23, 23, varTipo)
        Call Salvar(Me.chk_Loja24, 24, varTipo)
        Call Salvar(Me.chk_Loja25, 25, varTipo)
        Call Salvar(Me.chk_Loja26, 26, varTipo)
        Call Salvar(Me.chk_Loja27, 27, varTipo)
        Call Salvar(Me.chk_Loja28, 28, varTipo)
        Call Salvar(Me.chk_Loja29, 29, varTipo)

        Call Salvar(Me.chk_Loja30, 30, varTipo)
        Call Salvar(Me.chk_Loja31, 31, varTipo)
        Call Salvar(Me.chk_Loja32, 32, varTipo)
        Call Salvar(Me.chk_Loja33, 33, varTipo)
        Call Salvar(Me.chk_Loja34, 34, varTipo)
        Call Salvar(Me.chk_Loja36, 36, varTipo)
        Call Salvar(Me.chk_Loja37, 37, varTipo)
        Call Salvar(Me.chk_Loja38, 38, varTipo)
        Call Salvar(Me.chk_Loja39, 39, varTipo)

        Call Salvar(Me.chk_Loja40, 40, varTipo)
        Call Salvar(Me.chk_Loja41, 41, varTipo)
        Call Salvar(Me.chk_Loja42, 42, varTipo)
        Call Salvar(Me.chk_Loja43, 43, varTipo)
        Call Salvar(Me.chk_Loja44, 44, varTipo)
        Call Salvar(Me.chk_Loja45, 45, varTipo)
        Call Salvar(Me.chk_Loja46, 46, varTipo)
        Call Salvar(Me.chk_Loja47, 47, varTipo)
        Call Salvar(Me.chk_Loja48, 48, varTipo)
        Call Salvar(Me.chk_Loja49, 49, varTipo)

        Call Salvar(Me.chk_Loja50, 50, varTipo)
        Call Salvar(Me.chk_Loja51, 51, varTipo)
        Call Salvar(Me.chk_Loja52, 52, varTipo)
        Call Salvar(Me.chk_Loja53, 53, varTipo)
        Call Salvar(Me.chk_Loja54, 54, varTipo)

        Call Salvar(Me.chk_Loja55, 55, varTipo)
        Call Salvar(Me.chk_Loja56, 56, varTipo)
        Call Salvar(Me.chk_Loja57, 57, varTipo)
        Call Salvar(Me.chk_Loja58, 58, varTipo)
        Call Salvar(Me.chk_Loja59, 59, varTipo)
        Call Salvar(Me.chk_Loja60, 60, varTipo)

        Call Salvar(Me.chk_Loja603, 603, varTipo)
        Call Salvar(Me.chk_Loja604, 604, varTipo)
        Call Salvar(Me.chk_Loja605, 605, varTipo)
        Call Salvar(Me.chk_Loja606, 606, varTipo)


    End Sub

    Private Sub Atualizar_Margem()
        Dim varTipo As Byte
        varTipo = 3 'Margem
        Call Salvar(Me.chk_Loja03, 3, varTipo)
        Call Salvar(Me.chk_Loja04, 4, varTipo)
        Call Salvar(Me.chk_Loja05, 5, varTipo)
        Call Salvar(Me.chk_Loja06, 6, varTipo)
        Call Salvar(Me.chk_Loja07, 7, varTipo)
        Call Salvar(Me.chk_Loja08, 8, varTipo)
        Call Salvar(Me.chk_Loja09, 9, varTipo)

        Call Salvar(Me.chk_Loja10, 10, varTipo)
        Call Salvar(Me.chk_Loja11, 11, varTipo)
        Call Salvar(Me.chk_Loja13, 13, varTipo)
        Call Salvar(Me.chk_Loja14, 14, varTipo)
        Call Salvar(Me.chk_Loja15, 15, varTipo)
        Call Salvar(Me.chk_Loja17, 17, varTipo)
        Call Salvar(Me.chk_Loja18, 18, varTipo)
        Call Salvar(Me.chk_Loja19, 19, varTipo)

        Call Salvar(Me.chk_Loja20, 20, varTipo)
        Call Salvar(Me.chk_Loja21, 21, varTipo)
        Call Salvar(Me.chk_Loja22, 22, varTipo)
        Call Salvar(Me.chk_Loja23, 23, varTipo)
        Call Salvar(Me.chk_Loja24, 24, varTipo)
        Call Salvar(Me.chk_Loja25, 25, varTipo)
        Call Salvar(Me.chk_Loja26, 26, varTipo)
        Call Salvar(Me.chk_Loja27, 27, varTipo)
        Call Salvar(Me.chk_Loja28, 28, varTipo)
        Call Salvar(Me.chk_Loja29, 29, varTipo)

        Call Salvar(Me.chk_Loja30, 30, varTipo)
        Call Salvar(Me.chk_Loja31, 31, varTipo)
        Call Salvar(Me.chk_Loja32, 32, varTipo)
        Call Salvar(Me.chk_Loja33, 33, varTipo)
        Call Salvar(Me.chk_Loja34, 34, varTipo)
        Call Salvar(Me.chk_Loja36, 36, varTipo)
        Call Salvar(Me.chk_Loja37, 37, varTipo)
        Call Salvar(Me.chk_Loja38, 38, varTipo)
        Call Salvar(Me.chk_Loja39, 39, varTipo)

        Call Salvar(Me.chk_Loja40, 40, varTipo)
        Call Salvar(Me.chk_Loja41, 41, varTipo)
        Call Salvar(Me.chk_Loja42, 42, varTipo)
        Call Salvar(Me.chk_Loja43, 43, varTipo)
        Call Salvar(Me.chk_Loja44, 44, varTipo)
        Call Salvar(Me.chk_Loja45, 45, varTipo)
        Call Salvar(Me.chk_Loja46, 46, varTipo)
        Call Salvar(Me.chk_Loja47, 47, varTipo)
        Call Salvar(Me.chk_Loja48, 48, varTipo)
        Call Salvar(Me.chk_Loja49, 49, varTipo)

        Call Salvar(Me.chk_Loja50, 50, varTipo)
        Call Salvar(Me.chk_Loja51, 51, varTipo)
        Call Salvar(Me.chk_Loja52, 52, varTipo)
        Call Salvar(Me.chk_Loja53, 53, varTipo)
        Call Salvar(Me.chk_Loja54, 54, varTipo)

        Call Salvar(Me.chk_Loja55, 55, varTipo)
        Call Salvar(Me.chk_Loja56, 56, varTipo)
        Call Salvar(Me.chk_Loja57, 57, varTipo)
        Call Salvar(Me.chk_Loja58, 58, varTipo)
        Call Salvar(Me.chk_Loja59, 59, varTipo)
        Call Salvar(Me.chk_Loja60, 60, varTipo)

        Call Salvar(Me.chk_Loja603, 603, varTipo)
        Call Salvar(Me.chk_Loja604, 604, varTipo)
        Call Salvar(Me.chk_Loja605, 605, varTipo)
        Call Salvar(Me.chk_Loja606, 606, varTipo)

        Call Salvar(Me.chk_Loja203, 203, varTipo)
        Call Salvar(Me.chk_Loja204, 204, varTipo)
        Call Salvar(Me.chk_Loja205, 205, varTipo)
        Call Salvar(Me.chk_Loja206, 206, varTipo)
        Call Salvar(Me.chk_Loja211, 211, varTipo)
        Call Salvar(Me.chk_Loja212, 212, varTipo)

        Call Salvar(Me.chk_Loja213, 213, varTipo)
        Call Salvar(Me.chk_Loja214, 214, varTipo)
        Call Salvar(Me.chk_Loja215, 215, varTipo)
        Call Salvar(Me.chk_Loja216, 216, varTipo)
        Call Salvar(Me.chk_Loja217, 217, varTipo)
        Call Salvar(Me.chk_Loja218, 218, varTipo)

        Call Salvar(Me.chk_Loja219, 219, varTipo)
        Call Salvar(Me.chk_Loja220, 220, varTipo)
        Call Salvar(Me.chk_Loja221, 221, varTipo)
        Call Salvar(Me.chk_Loja222, 222, varTipo)
        Call Salvar(Me.chk_Loja223, 223, varTipo)
        Call Salvar(Me.chk_Loja224, 224, varTipo)

        Call Salvar(Me.chk_Loja225, 225, varTipo)
        Call Salvar(Me.chk_Loja226, 226, varTipo)
        Call Salvar(Me.chk_Loja227, 227, varTipo)
        Call Salvar(Me.chk_Loja228, 228, varTipo)

    End Sub

    Private Sub Atualizar_Agenda23()
        Dim varTipo As Byte
        varTipo = 4 'Agenda 23
        Call Salvar(Me.chk_Loja03, 3, varTipo)
        Call Salvar(Me.chk_Loja04, 4, varTipo)
        Call Salvar(Me.chk_Loja05, 5, varTipo)
        Call Salvar(Me.chk_Loja06, 6, varTipo)
        Call Salvar(Me.chk_Loja07, 7, varTipo)
        Call Salvar(Me.chk_Loja08, 8, varTipo)
        Call Salvar(Me.chk_Loja09, 9, varTipo)

        Call Salvar(Me.chk_Loja10, 10, varTipo)
        Call Salvar(Me.chk_Loja11, 11, varTipo)
        Call Salvar(Me.chk_Loja13, 13, varTipo)
        Call Salvar(Me.chk_Loja14, 14, varTipo)
        Call Salvar(Me.chk_Loja15, 15, varTipo)
        Call Salvar(Me.chk_Loja17, 17, varTipo)
        Call Salvar(Me.chk_Loja18, 18, varTipo)
        Call Salvar(Me.chk_Loja19, 19, varTipo)

        Call Salvar(Me.chk_Loja20, 20, varTipo)
        Call Salvar(Me.chk_Loja21, 21, varTipo)
        Call Salvar(Me.chk_Loja22, 22, varTipo)
        Call Salvar(Me.chk_Loja23, 23, varTipo)
        Call Salvar(Me.chk_Loja24, 24, varTipo)
        Call Salvar(Me.chk_Loja25, 25, varTipo)
        Call Salvar(Me.chk_Loja26, 26, varTipo)
        Call Salvar(Me.chk_Loja27, 27, varTipo)
        Call Salvar(Me.chk_Loja28, 28, varTipo)
        Call Salvar(Me.chk_Loja29, 29, varTipo)

        Call Salvar(Me.chk_Loja30, 30, varTipo)
        Call Salvar(Me.chk_Loja31, 31, varTipo)
        Call Salvar(Me.chk_Loja32, 32, varTipo)
        Call Salvar(Me.chk_Loja33, 33, varTipo)
        Call Salvar(Me.chk_Loja34, 34, varTipo)
        Call Salvar(Me.chk_Loja36, 36, varTipo)
        Call Salvar(Me.chk_Loja37, 37, varTipo)
        Call Salvar(Me.chk_Loja38, 38, varTipo)
        Call Salvar(Me.chk_Loja39, 39, varTipo)

        Call Salvar(Me.chk_Loja40, 40, varTipo)
        Call Salvar(Me.chk_Loja41, 41, varTipo)
        Call Salvar(Me.chk_Loja42, 42, varTipo)
        Call Salvar(Me.chk_Loja43, 43, varTipo)
        Call Salvar(Me.chk_Loja44, 44, varTipo)
        Call Salvar(Me.chk_Loja45, 45, varTipo)
        Call Salvar(Me.chk_Loja46, 46, varTipo)
        Call Salvar(Me.chk_Loja47, 47, varTipo)
        Call Salvar(Me.chk_Loja48, 48, varTipo)
        Call Salvar(Me.chk_Loja49, 49, varTipo)

        Call Salvar(Me.chk_Loja50, 50, varTipo)
        Call Salvar(Me.chk_Loja51, 51, varTipo)
        Call Salvar(Me.chk_Loja52, 52, varTipo)
        Call Salvar(Me.chk_Loja53, 53, varTipo)
        Call Salvar(Me.chk_Loja54, 54, varTipo)

        Call Salvar(Me.chk_Loja55, 55, varTipo)
        Call Salvar(Me.chk_Loja56, 56, varTipo)
        Call Salvar(Me.chk_Loja57, 57, varTipo)
        Call Salvar(Me.chk_Loja58, 58, varTipo)
        Call Salvar(Me.chk_Loja59, 59, varTipo)
        Call Salvar(Me.chk_Loja60, 60, varTipo)

        Call Salvar(Me.chk_Loja603, 603, varTipo)
        Call Salvar(Me.chk_Loja604, 604, varTipo)
        Call Salvar(Me.chk_Loja605, 605, varTipo)
        Call Salvar(Me.chk_Loja606, 606, varTipo)

        Call Salvar(Me.chk_Loja203, 203, varTipo)
        Call Salvar(Me.chk_Loja204, 204, varTipo)
        Call Salvar(Me.chk_Loja205, 205, varTipo)
        Call Salvar(Me.chk_Loja206, 206, varTipo)
        Call Salvar(Me.chk_Loja211, 211, varTipo)
        Call Salvar(Me.chk_Loja212, 212, varTipo)

        Call Salvar(Me.chk_Loja213, 213, varTipo)
        Call Salvar(Me.chk_Loja214, 214, varTipo)
        Call Salvar(Me.chk_Loja215, 215, varTipo)
        Call Salvar(Me.chk_Loja216, 216, varTipo)
        Call Salvar(Me.chk_Loja217, 217, varTipo)
        Call Salvar(Me.chk_Loja218, 218, varTipo)

        Call Salvar(Me.chk_Loja219, 219, varTipo)
        Call Salvar(Me.chk_Loja220, 220, varTipo)
        Call Salvar(Me.chk_Loja221, 221, varTipo)
        Call Salvar(Me.chk_Loja222, 222, varTipo)
        Call Salvar(Me.chk_Loja223, 223, varTipo)
        Call Salvar(Me.chk_Loja224, 224, varTipo)

        Call Salvar(Me.chk_Loja225, 225, varTipo)
        Call Salvar(Me.chk_Loja226, 226, varTipo)
        Call Salvar(Me.chk_Loja227, 227, varTipo)
        Call Salvar(Me.chk_Loja228, 228, varTipo)

    End Sub

#End Region

    Protected Sub btnLimparTudo_Click(sender As Object, e As EventArgs) Handles btnLimparTudo.Click
        oVem.LimparLiberaProgramaReplanejamento()
        oVem.UserMsgBox(Me, "Todas as liberações foram excluídas com sucesso!!!")
    End Sub

 
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Liberação do Replanejamento, Participação, Margem e Agenda 23"
    End Sub

    Protected Sub btnSelecionarPosto_Click(sender As Object, e As EventArgs) Handles btnSelecionarPosto.Click
        Call Marcar(Me.chk_Loja203)
        Call Marcar(Me.chk_Loja204)
        Call Marcar(Me.chk_Loja205)
        Call Marcar(Me.chk_Loja206)
        Call Marcar(Me.chk_Loja211)
        Call Marcar(Me.chk_Loja212)
        Call Marcar(Me.chk_Loja213)

        Call Marcar(Me.chk_Loja214)
        Call Marcar(Me.chk_Loja215)
        Call Marcar(Me.chk_Loja216)
        Call Marcar(Me.chk_Loja217)
        Call Marcar(Me.chk_Loja218)
        Call Marcar(Me.chk_Loja219)
        Call Marcar(Me.chk_Loja220)

        Call Marcar(Me.chk_Loja221)
        Call Marcar(Me.chk_Loja222)
        Call Marcar(Me.chk_Loja223)
        Call Marcar(Me.chk_Loja224)
        Call Marcar(Me.chk_Loja225)
        Call Marcar(Me.chk_Loja226)

        Call Marcar(Me.chk_Loja227)
        Call Marcar(Me.chk_Loja228)
    End Sub
End Class
