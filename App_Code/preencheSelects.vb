Imports System.Data.SqlClient
Imports System.Runtime.InteropServices

Public Class preencheSelects

    Public Sub Define_Corporacao(ByVal sDepartamento As String, ByRef sSelect As DropDownList)
        Dim iStr As String = ""

        Select Case sDepartamento
            Case "gestor_comercial", "comercial"
                iStr = "SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade IN (3,8,9,199)"
            Case "postos"
                iStr = "SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade = 5"
            Case "loja"
                iStr = "SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista WHERE idUnidade IN (3,9)"
            Case "suprimentos"
                iStr = "SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista"
            Case Else
                iStr = "SELECT idUnidade ,descUnidade FROM gerCadastros.Cad.tblUnidadeLista"
        End Select

        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        ' Define the binding
        sSelect.DataSource = cmd.ExecuteReader()
        sSelect.DataTextField = "descUnidade"
        sSelect.DataValueField = "idUnidade"

        ' Activate the binding.
        sSelect.DataBind()

        con.Close()

        sSelect.SelectedIndex = 0

    End Sub

    Public Sub Define_Filial(ByVal sTipo As String, ByVal sDepartamento As String, ByVal sUsu As String, ByVal sFilial As String, ByRef sSelect As DropDownList)
        Dim iStr As String = ""

        Select Case sTipo
            Case 3  ' Lojas
                Select Case sDepartamento

                    Case "supervisor"
                        If sUsu = "bendixen" Then   'Supervisor Norte
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1006 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "352100" Then  ' Supervisor Edison
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1005 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "1075390" Then ' Claudinei Fitz
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1004 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "68977" Then   ' João Carlos
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1014 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "100400" Then   ' Wilson
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "valdecir" Then   ' Valdecir
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "388690" Then   ' Samoel
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1016 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "774" Then   ' Usuario Supervisor (Esta setado para Atacarejo)
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1016 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "supervisor" Then
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        ElseIf sUsu = "898890" Then  ' Rosineli - Lojas do Norte
                            preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegiao IN (203,217) ORDER BY nomeFilial", sSelect)
                            sSelect.SelectedIndex = 0
                        End If
                    Case "supervisor_trainee"
                        preencheFilial("SELECT Filial, RTRIM(FilialLista) AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE CodigoRegional=1015 ORDER BY nomeFilial", sSelect)
                        sSelect.SelectedIndex = 0
                    Case "gerente_cd"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (1,12,16)", sSelect)
                        sSelect.SelectedValue = 1
                    Case "rh_folha"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (100)", sSelect)
                        sSelect.SelectedValue = 100
                    Case "Entreposto"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial = 2", sSelect)
                        sSelect.SelectedValue = 2
                    Case "presidência", "comercial", "comercial_perdas", "gestor_comercial", "gerente_comercial", "gestor_assistente"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE IsLoja=1", sSelect)
                        sSelect.SelectedValue = 3
                    Case "controladoria", "administração", "perdas_supervisor", "seguranca_supervisor", "projetos_perdas", "suprimentos", "gerente_rh"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE idLojasCDs=1 OR IsAtacarejo=1", sSelect)
                        sSelect.SelectedValue = 3

                    Case "gerente cd"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial IN (1,12,16)", sSelect)
                        sSelect.SelectedIndex = 0
                    Case "diretor", "diretor_informatica", "diretor_marketing", "contabilidade", "gerente_contabilidade", "gerente_financeiro", "trade marketing"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE idLojasCDs = 1", sSelect)
                        sSelect.SelectedIndex = 0
                    Case "marketing", "marketing bi"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE  idLojasCDs = 1", sSelect)
                        sSelect.SelectedIndex = 0
                    Case "gerente hsa", "hsa"
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE  idLojasCDs = 1", sSelect)
                        sSelect.SelectedIndex = 0
                    Case Else
                        preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE Filial=" & sFilial & "", sSelect)
                        sSelect.SelectedIndex = 0
                End Select

            Case 4  ' Regionais
                preencheFilial("SELECT CodRegional As Filial ,Descricao AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais_Regional", sSelect)
                sSelect.SelectedIndex = 0
            Case 5  ' Posto
                preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE IsPosto=1", sSelect)
                sSelect.SelectedIndex = 2
            Case 6  ' Gestor
            Case 7  ' Comprador
            Case 8  ' Atacarejo
                preencheFilial("SELECT idFilial AS Filial ,nomeFilial, icone FROM DW.dbo.DimFilial WHERE IsAtacarejo = 1 OR idFilial = 601 ORDER BY idFilial", sSelect)
                sSelect.SelectedIndex = 0
            Case 9  ' Delivery
                preencheFilial("SELECT idFilial AS Filial ,FilialDesc AS nomeFilial, icone FROM DW.dbo.DimFilial WHERE IsDelivery = 1", sSelect)
                sSelect.SelectedIndex = 0
            Case 12  ' Hipermais
                preencheFilial("SELECT Filial ,RTRIM(FilialLista) AS nomeFilial, icone FROM gerCadastros.Cadastros.tblCadFiliais WHERE Tipo=12", sSelect)
                sSelect.SelectedIndex = 0
            Case 199    'Corporação
                Select Case sDepartamento
                    Case "gestor_comercial", "comercial"
                        preencheFilial("SELECT Filial, Descricao AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE Filial IN (99,98,699) ORDER BY nomeFilial", sSelect)
                        sSelect.SelectedIndex = 0
                        'Session("sFILIAL", sSelect) = sSelect.SelectedValue
                    Case Else
                        preencheFilial("SELECT Filial, Descricao AS nomeFilial, icone FROM Cadastros.tblCadFiliaisLista WHERE Filial IN (99,198,199,98,699) ORDER BY nomeFilial", sSelect)
                        sSelect.SelectedIndex = 0
                        'Session("sFILIAL") = sSelect.SelectedValue
                End Select

        End Select

        Try
            If sFilial IsNot Nothing Then
                For i As Integer = 0 To sSelect.Items.Count
                    If sSelect.Items(i).Value = sFilial Then
                        sSelect.SelectedValue = sFilial
                        sSelect.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
        Catch ex As Exception

        End Try


    End Sub

    Private Sub preencheFilial(ByVal iStr As String, ByRef sSelect As DropDownList)
        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            sSelect.DataSource = cmd.ExecuteReader()
            sSelect.DataTextField = "nomeFilial"
            sSelect.DataValueField = "Filial"

            ' Activate the binding.
            sSelect.DataBind()

            con.Close()

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try

    End Sub

    Public Sub preencherPerfis(ByVal iStr As String, ByRef sSelect As DropDownList)
        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.LocalSqlServer)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            sSelect.DataSource = cmd.ExecuteReader()
            sSelect.DataTextField = "Depto"
            sSelect.DataValueField = "DeptoId"

            ' Activate the binding.
            sSelect.DataBind()
            con.Close()

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try

        sSelect.Items.Insert(0, New ListItem("", "0"))
        sSelect.SelectedIndex = -1
        sSelect.ClearSelection()
        sSelect.SelectedItem.Selected = False


    End Sub

End Class
