Imports Microsoft.VisualBasic
Imports System.Math
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class MyFunction

    Private varLojaAdm As String
    Private varPosicao As String
    Private varGestor As String
    Private varFilial As String
    'Private connString As String = "Data Source=NS3;Initial Catalog=gerContSQL1;User ID=eliseuf; PWD=RD700sx"
    Public varPrograma As String

    Public Property vPrograma() As String
        Get
            vPrograma = varPrograma
        End Get
        Set(ByVal value As String)
            varPrograma = value
        End Set
    End Property

    Public Property vLojaAdm() As String
        Get
            vLojaAdm = varLojaAdm
        End Get
        Set(ByVal value As String)
            varLojaAdm = value
        End Set
    End Property

    Public Property vFilial() As String
        Get
            vFilial = varFilial
        End Get
        Set(ByVal value As String)
            varFilial = value
        End Set
    End Property

    Public Property vPosicao() As String
        '---------- Posição  ---------------
        '  1 = Loja
        '  2 = Administração
        '  3 = Definitivo
        '  4 = Comercial
        '-----------------------------------
        Get
            vPosicao = varPosicao
        End Get
        Set(ByVal value As String)
            varPosicao = value
        End Set
    End Property

    Public Property vGestor() As String
        '---------- Gestor ---------------
        '  1 = Joanir
        '  2 = João
        '  3 = Wanclei
        '  4 = Adailton
        '  5 = Renato
        '  6 = Vladimir
        '  7 = Aliceu
        '  8 = Elaine
        ' 99 = Todos
        '---------------------------------
        Get
            vGestor = varGestor
        End Get
        Set(ByVal value As String)
            varGestor = value
        End Set
    End Property

    Public Sub Programa(ByVal iPrograma As String)
        varPrograma = iPrograma
    End Sub

    Public Function DefinirLojaAdm(ByVal iUsuario As String) As Byte
        If StrConv(Left(iUsuario, 4), VbStrConv.Lowercase) = "loja" Then
            varLojaAdm = 1  'Lojas
            'Definir o nº da Filial da Loja
            If Len(iUsuario) = 5 Then   'Loja9 - até 9
                DefinirLojaAdm = Right(iUsuario, 1)
            ElseIf Len(iUsuario) = 6 Then 'Loja11 - Maior que 9
                DefinirLojaAdm = Right(iUsuario, 2)
            End If
        ElseIf StrConv(Left(iUsuario, 6), VbStrConv.Lowercase) = "perdas" Then
            varLojaAdm = 1  'Lojas
            'Definir o nº da Filial da Loja
            If Len(iUsuario) = 7 Then   'Loja9 - até 9
                DefinirLojaAdm = Right(iUsuario, 1)
            ElseIf Len(iUsuario) = 8 Then 'Loja11 - Maior que 9
                DefinirLojaAdm = Right(iUsuario, 2)
            End If
        Else
            varLojaAdm = 2  'Não é Lojas 
            DefinirLojaAdm = 3
        End If
        Return DefinirLojaAdm
    End Function

    Public Function DefinirPosicao(ByVal iUsuario As String, ByVal iDDL_Posicao As DropDownList, ByVal iDDL_Filial As DropDownList) As Byte
        'iDDL = Me.cboPosição (DropDownList) da página de chamada.
        Call DefinirLojaAdm(iUsuario)
        If varLojaAdm = 2 Then  'Administração. Não é lojas.
            Select Case LCase(iUsuario)
                Case "pires", "mauricio", "ana baum", "sidnéia", "adailton", "samir", "jucelia", "eliane", "creuza", "áurea"    'Adailton
                    varPosicao = 2
                    varGestor = 4
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "renato", "suzan", "bárbara"
                    varPosicao = 2
                    varGestor = 5
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "vladimir"
                    varPosicao = 2
                    varGestor = 6
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "aliceu", "fernanda"
                    varPosicao = 2
                    varGestor = 7
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "elaine"
                    varPosicao = 2
                    varGestor = 8
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "joão", "ana", "idilson", "osvaldo", "nelci", "sandra", "sérgio", "bernardo", "simone", "paulo", "josué", "otávio"
                    varPosicao = 4
                    varGestor = 2
                    iDDL_Posicao.Enabled = False
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "eliseufermino", "eder", "márcio", "edison", "jorge"
                    varPosicao = 2
                    varGestor = 99
                    iDDL_Posicao.Enabled = True
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "regional1", "regional2", "regional3"
                    varPosicao = 1
                    varGestor = 99
                    iDDL_Posicao.Enabled = True
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
            End Select
        Else    'Se for Loja
            varPosicao = 1
            iDDL_Posicao.Enabled = False
            iDDL_Filial.Enabled = False
            iDDL_Filial.Text = varFilial
        End If
    End Function

    Public Function DefinirPosicaoRevista(ByVal iUsuario As String, ByVal iDDL_Filial As DropDownList) As Byte
        'iDDL = Me.cboPosição (DropDownList) da página de chamada.
        Call DefinirLojaAdm(iUsuario)
        If varLojaAdm = 2 Then  'Administração. Não é lojas.
            Select Case LCase(iUsuario)
                Case "pires", "mauricio", "ana baum", "sidnéia", "adailton", "samir", "jucelia", "eliane", "creuza", "áurea"    'Adailton
                    varPosicao = 2
                    varGestor = 4
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "renato", "suzan", "bárbara"
                    varPosicao = 2
                    varGestor = 5
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "vladimir"
                    varPosicao = 2
                    varGestor = 6
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "aliceu", "fernanda"
                    varPosicao = 2
                    varGestor = 7
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "elaine"
                    varPosicao = 2
                    varGestor = 8
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "joão", "ana", "idilson", "osvaldo", "nelci", "sandra", "sérgio", "bernardo", "simone", "paulo", "josué", "otávio"
                    varPosicao = 4
                    varGestor = 2
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "eliseufermino", "eder", "márcio", "edison", "jorge"
                    varPosicao = 2
                    varGestor = 99
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
                Case "regional1", "regional2", "regional3"
                    varPosicao = 1
                    varGestor = 99
                    iDDL_Filial.Enabled = True
                    iDDL_Filial.Text = varFilial
            End Select
        Else    'Se for Loja
            varPosicao = 1
            iDDL_Filial.Enabled = False
            iDDL_Filial.Text = varFilial
        End If
    End Function

    Shared Function UpperCaseFirstLetter(ByVal val As String) As String
        ' Test for nothing or empty.
        If String.IsNullOrEmpty(val) Then
            Return val
        End If

        ' Convert to character array.
        Dim array() As Char = val.ToCharArray

        ' Uppercase first character.
        array(0) = Char.ToUpper(array(0))

        ' Return new string.
        Return New String(array)
    End Function



End Class
