Imports System.Data.SqlClient
Imports DevExpress.CodeParser

Partial Class wucListaLojasComCorporacao
    Inherits System.Web.UI.UserControl

    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListCorporacaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Private vFilial As Int16
    Public Property idRegional As Byte
    Public Property nomeUsuario As String

    Dim oProj As New Projeto

#Region " Property"

    Public Property CallFilial() As String
        Get
            Return cboFilial.Value
        End Get
        Set(ByVal value As String)
            cboFilial.Value = value
        End Set
    End Property

    Public Property CallFilialNome() As String
        Get
            Return cboFilial.Text
        End Get
        Set(ByVal value As String)
            cboFilial.Text = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboFilial.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboFilial.AutoPostBack = value
        End Set
    End Property

    Public Property Visible_cboCorporacao() As Boolean
        Get
            Return cboCorporacao.Visible
            'Return lblTitleCorporacao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboCorporacao.Visible = value

            'lblTitleCorporacao.Visible = value
        End Set
    End Property

    Public Property IsLoja As Boolean
        Get
            IsLoja = vIsLoja
        End Get
        Set(ByVal value As Boolean)
            vIsLoja = value
        End Set
    End Property

    Public Property IsRegional As Boolean
        Get
            IsRegional = vIsRegional
        End Get
        Set(ByVal value As Boolean)
            vIsRegional = value
        End Set
    End Property

    Public Property Departamento As String
        Get
            Departamento = vDepartamento
        End Get
        Set(ByVal value As String)
            vDepartamento = value
        End Set
    End Property

    Public Property Enabled_cboFilial() As Boolean
        Get
            Return cboFilial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Enabled = value
        End Set
    End Property

    Public Property CallCorporacao() As String
        Get
            Return cboCorporacao.Value
        End Get
        Set(ByVal value As String)
            cboCorporacao.Value = value
        End Set
    End Property

    Public Property Caption_Filial() As String
        Get
            Return cboFilial.Caption
        End Get
        Set(ByVal value As String)
            cboFilial.Caption = value
        End Set
    End Property

    Public Property Css_Filial() As String
        Get
            Return cboFilial.CssClass
        End Get
        Set(ByVal value As String)
            cboFilial.CssClass = value
        End Set
    End Property

#End Region

#Region " Page"

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not Me.IsPostBack Then

            Call Session_Departamento()
            Define_Corporacao()

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then

          
            Select Case LCase(Trim(oProj.BuscarLocalDoUsuario(Page.User.Identity.Name)))
                Case "adm"
                    Me.cboFilial.Enabled = True
                Case "loja"
                    Me.cboFilial.Enabled = False
                    Me.cboCorporacao.Visible = False
                Case "cd"
                    Me.cboCorporacao.Visible = False
                Case "hipermais"
                    Me.cboCorporacao.Visible = False
                Case Else
                    Me.cboFilial.Enabled = True
            End Select

            Call Define_Filial()


            'If IsNothing(Session("sUSUARIO")) Then
            '    lblError.Text = "Nada"
            'Else
            '    lblError.Text = Session("sUSUARIO") & " - " & vFilial & " - Session: " & Session("sFILIAL")
            'End If

            'Call Session_Departamento()

        End If

    End Sub

#End Region


    Private Sub Define_Corporacao()
        Select Case Session("sDEPARTAMENTO")
            Case "gestor_comercial", "comercial"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade IN (3,8,9,199)")
            Case "postos"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade = 5")
            Case "supervisor_postos"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade = 5")
            Case "loja"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade IN (3,9)")
            Case "hipermais"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade IN (12)")
            Case "suprimentos"
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista")
                cboCorporacao.Enabled = False
            Case Else
                Preenche_Corporacao("SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista")
        End Select

    End Sub

    Private Sub Define_Filial()
        On Error Resume Next
        Select Case cboCorporacao.Value
            Case 3  ' Lojas
                Select Case Session("sDEPARTAMENTO")

                    Case "supervisor"

                        cboCorporacao.Visible = False

                        If Session("sUSUARIO") = "bendixen" Then   'Supervisor Norte
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1006 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "352100" Then  ' Supervisor Edison
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1005 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "1075390" Then ' Claudinei Fitz
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1004 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "68977" Then   ' João Carlos
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1014 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "207888" Then   ' Domingos
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1018 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "388690" Then   ' Samoel
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1016 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "774" Then   ' Usuario Supervisor (Esta setado para Atacarejo)
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1018 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "supervisor" Then
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "898890" Then  ' Rosineli - Lojas do Norte
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegiao IN (203,217) ORDER BY nomeFilial")
                            cboCorporacao.Visible = False
                            cboFilial.SelectedIndex = 0

                        End If

                    Case "diretor_operacao"

                        cboCorporacao.Visible = False

                        If Session("sUSUARIO") = "Valdecir" Then   ' Valdecir
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE idDiretor_Operacao=1 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "781" Then   ' Valdecir
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE idDiretor_Operacao=1 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        End If
                    Case "supervisor_trainee"
                        Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial")
                        cboFilial.SelectedIndex = 0
                    Case "gerente_cd"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (1,12,16)")
                        cboFilial.Value = 1
                    Case "rh_folha"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (100)")
                        cboFilial.Value = 100
                    Case "Entreposto"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial = 2")
                        cboFilial.Value = 2
                    Case "presidência", "comercial", "comercial_perdas", "gestor_comercial", "gerente_comercial", "gestor_assistente"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE IsLoja=1")
                        cboFilial.Value = 3
                    Case "controladoria", "administração", "perdas_supervisor", "seguranca_supervisor", "projetos_perdas", "suprimentos", "gerente_rh"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE  idLojasCDs = 1 OR IsPosto =1 OR isAtacarejo = 1 OR isHipermais = 1")
                        cboFilial.Value = 3
                    Case "gerente cd"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (1,12,16)")
                        cboFilial.SelectedIndex = 0
                    Case "diretor", "diretor_informatica", "diretor_marketing", "contabilidade", "gerente_contabilidade", "gerente_financeiro", "trade marketing"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE  idLojasCDs = 1 OR IsPosto =1 OR isAtacarejo = 1 OR isHipermais = 1")
                        cboFilial.SelectedIndex = 0
                    Case "marketing", "marketing bi"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE  idLojasCDs = 1")
                        cboFilial.SelectedIndex = 0
                    Case "gerente hsa", "hsa"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE  idLojasCDs = 1")
                        cboFilial.SelectedIndex = 0
                    Case "controle_caminhao_ceasa"
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE IsLoja=1 OR isAtacarejo = 1")
                        cboFilial.Value = 3
                    Case Else
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial=" & vFilial & "")
                        cboFilial.SelectedIndex = 0
                End Select

            Case 4  ' Regionais
                Preenche_cboFilial("SELECT CodRegional As Filial ,Descricao AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais_Regional")
                cboFilial.SelectedIndex = 0
            Case 5  ' Posto
                Select Case Session("sDEPARTAMENTO")

                    Case "supervisor_postos"

                        cboCorporacao.Visible = False

                        If Session("sUSUARIO") = "101437" Then   'Eliane
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1019 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "101436" Then   'Joilnen
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1020 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        ElseIf Session("sUSUARIO") = "20118" Or Session("sUSUARIO") = "881" Then
                            Call Preenche_cboFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1020 ORDER BY nomeFilial")
                            cboFilial.SelectedIndex = 0
                        End If

                    Case Else
                        Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE IsPosto=1")

                End Select

            Case 6  ' Gestor
            Case 7  ' Comprador
            Case 8  ' Atacarejo
                Preenche_cboFilial("SELECT idFilial AS Filial ,nomeFilial, icone FROM DW.dbo.DimFilial WHERE IsAtacarejo = 1 OR idFilial = 601 ORDER BY idFilial")
                cboFilial.SelectedIndex = 0
            Case 9  ' Delivery
                Preenche_cboFilial("SELECT idFilial AS Filial ,FilialDesc AS nomeFilial, icone FROM DW.dbo.DimFilial WHERE IsDelivery = 1")
                cboFilial.SelectedIndex = 0
            Case 11  ' Indústrias
                Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE IsIndustria=1")
                cboFilial.SelectedIndex = 0
            Case 12  ' Hipermais
                Preenche_cboFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE Tipo=12")
                cboFilial.SelectedIndex = 0
                cboCorporacao.Visible = False
            Case 199    'Corporação
                Select Case Session("sDEPARTAMENTO")

                    Case "gestor_comercial", "comercial"
                        Preenche_cboFilial("SELECT Filial, Descricao AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE Filial IN (99,98,699,799) ORDER BY nomeFilial")
                        cboFilial.SelectedIndex = 0
                        'Session("sFILIAL") = cboFilial.Value
                    Case Else
                        Preenche_cboFilial("SELECT Filial, Descricao AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE Filial IN (99,198,199,98,699,799) ORDER BY nomeFilial")
                        cboFilial.SelectedIndex = 0
                        'Session("sFILIAL") = cboFilial.Value
                End Select

        End Select

        ' Session("sFILIAL") = cboFilial.SelectedItem.Value
        Session("sCORPORACAO") = cboCorporacao.SelectedItem.Value
    End Sub

    Public Sub Preenche_Corporacao(ByVal iStr As String)
        On Error Resume Next

        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)

        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        ' Define the binding
        cboCorporacao.DataSource = cmd.ExecuteReader()
        cboCorporacao.TextField = "descUnidade"
        cboCorporacao.ValueField = "idUnidade"

        ' Activate the binding.
        cboCorporacao.DataBind()

        con.Close()

        cboCorporacao.SelectedIndex = 0
        Session("sCORPORACAO") = cboCorporacao.SelectedItem.Value

    End Sub

    Private Sub Preenche_cboFilial(ByVal iStr As String)
        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()


        Try
            ' Define the binding
            cboFilial.DataSource = cmd.ExecuteReader()
            cboFilial.TextField = "nomeFilial"
            cboFilial.ValueField = "Filial"

            ' Activate the binding.
            cboFilial.DataBind()

            con.Close()

        Catch ex As Exception
            lblError.Text = iStr
        Finally
            con.Close()
        End Try
        
    End Sub

    Protected Sub cboCorporacao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCorporacao.SelectedIndexChanged

        If Session("sDEPARTAMENTO") <> "loja" Then
            Define_Filial()
            RaiseEvent ListCorporacaoChanged(sender, e)
        End If
        'lblError.Text = Session("sDEPARTAMENTO")
        
    End Sub


#Region " Session"

    Private Sub Session_Usuario()
        Session("sUSUARIO") = LCase(Trim(Page.User.Identity.Name))
    End Sub

    Private Sub Session_Departamento()
        'Dim oProj As New Projeto

        vDepartamento = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
        vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
        ' lblError.Text = vDepartamento

        Session("sDEPARTAMENTO") = vDepartamento
        Session("sFILIAL") = vFilial


        IsLoja = oProj.Isloja
        IsRegional = oProj.IsRegional

    End Sub

#End Region



    Protected Sub cboFilial_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboFilial.SelectedIndexChanged
        On Error Resume Next

        Session("sFILIAL") = cboFilial.SelectedItem.Value


        RaiseEvent ListFilialChanged(sender, e)

    End Sub

End Class

