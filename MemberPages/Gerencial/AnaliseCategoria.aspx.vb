Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_AnaliseCategoria
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect

    Private Sub CreateSession()
        Dim varID As Byte

        If Me.cboMercadologico.opcaoDeptoChecked = True Then varID = 1
        If Me.cboMercadologico.opcaoSecaoChecked = True Then varID = 2
        If Me.cboMercadologico.opcaoGrupoChecked = True Then varID = 3
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varID = 4
        Session("sID") = varID
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sORDEM") = Me.cboClassificacao.SelectedValue
        Session("sMERCADOLOGICO") = 1
    End Sub

    Private Sub ClearBorder(ByVal myField As String)
        Me.grid.Columns.Item(myField).CellStyle.BorderRight.BorderColor = Drawing.Color.Empty
    End Sub

    Private Sub FillBorder(ByVal myField As String)
        With Me.grid.Columns.Item(myField).CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 1
        End With

    End Sub

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        Dim oVem As New VendaEmpresaMes
        Dim varID As Byte

        If Me.cboMercadologico.opcaoDeptoChecked = True Then varID = 1
        If Me.cboMercadologico.opcaoSecaoChecked = True Then varID = 2
        If Me.cboMercadologico.opcaoGrupoChecked = True Then varID = 3
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varID = 4
        Session("sID") = varID
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sORDEM") = Me.cboClassificacao.SelectedValue



        'Mostrar Venda
        If Me.chkMostrar_Venda.Checked = True Then
            Me.grid.Columns.Item("Venda_RC").Visible = True
            Me.grid.Columns.Item("Venda_RM").Visible = True
            Me.grid.Columns.Item("Venda_RCO").Visible = True
            Me.grid.Columns.Item("Venda_RN").Visible = True
            Me.grid.Columns.Item("Venda_RP").Visible = True
        Else
            Me.grid.Columns.Item("Venda_RC").Visible = False
            Me.grid.Columns.Item("Venda_RM").Visible = False
            Me.grid.Columns.Item("Venda_RCO").Visible = False
            Me.grid.Columns.Item("Venda_RN").Visible = False
            Me.grid.Columns.Item("Venda_RP").Visible = False
        End If

        'Mostrar Volume
        If Me.chkMostrar_Volume.Checked = True Then
            Me.grid.Columns.Item("Qtde_RC").Visible = True
            Me.grid.Columns.Item("Qtde_RM").Visible = True
            Me.grid.Columns.Item("Qtde_RCO").Visible = True
            Me.grid.Columns.Item("Qtde_RN").Visible = True
            Me.grid.Columns.Item("Qtde_RP").Visible = True
        Else
            Me.grid.Columns.Item("Qtde_RC").Visible = False
            Me.grid.Columns.Item("Qtde_RM").Visible = False
            Me.grid.Columns.Item("Qtde_RCO").Visible = False
            Me.grid.Columns.Item("Qtde_RN").Visible = False
            Me.grid.Columns.Item("Qtde_RP").Visible = False
        End If
 
        'Mostrar Classificação
        If Me.chkMostrar_Class.Checked = True Then
            Me.grid.Columns.Item("Class_RC").Visible = True
            Me.grid.Columns.Item("Class_RM").Visible = True
            Me.grid.Columns.Item("Class_RCO").Visible = True
            Me.grid.Columns.Item("Class_RN").Visible = True
            Me.grid.Columns.Item("Class_RP").Visible = True
        Else
            Me.grid.Columns.Item("Class_RC").Visible = False
            Me.grid.Columns.Item("Class_RM").Visible = False
            Me.grid.Columns.Item("Class_RCO").Visible = False
            Me.grid.Columns.Item("Class_RN").Visible = False
            Me.grid.Columns.Item("Class_RP").Visible = False
        End If

        'Mostrar Status
        If Me.chkMostrar_Status.Checked = True Then
            Me.grid.Columns.Item("Cat_RC").Visible = True
            Me.grid.Columns.Item("Cat_RM").Visible = True
            Me.grid.Columns.Item("Cat_RCO").Visible = True
            Me.grid.Columns.Item("Cat_RN").Visible = True
            Me.grid.Columns.Item("Cat_RP").Visible = True
        Else
            Me.grid.Columns.Item("Cat_RC").Visible = False
            Me.grid.Columns.Item("Cat_RM").Visible = False
            Me.grid.Columns.Item("Cat_RCO").Visible = False
            Me.grid.Columns.Item("Cat_RN").Visible = False
            Me.grid.Columns.Item("Cat_RP").Visible = False
        End If

        'Mostrar % de Margem
        If Me.chkMostrar_PercMargem.Checked = True Then
            Me.grid.Columns.Item("percMargem_RC").Visible = True
            Me.grid.Columns.Item("percMargem_RM").Visible = True
            Me.grid.Columns.Item("percMargem_RCO").Visible = True
            Me.grid.Columns.Item("percMargem_RN").Visible = True
            Me.grid.Columns.Item("percMargem_RP").Visible = True
        Else
            Me.grid.Columns.Item("percMargem_RC").Visible = False
            Me.grid.Columns.Item("percMargem_RM").Visible = False
            Me.grid.Columns.Item("percMargem_RCO").Visible = False
            Me.grid.Columns.Item("percMargem_RN").Visible = False
            Me.grid.Columns.Item("percMargem_RP").Visible = False
        End If

        'Mostrar Participação
        If Me.chkMostrar_Participacao.Checked = True Then
            Me.grid.Columns.Item("Part_RC").Visible = True
            Me.grid.Columns.Item("Part_RM").Visible = True
            Me.grid.Columns.Item("Part_RCO").Visible = True
            Me.grid.Columns.Item("Part_RN").Visible = True
            Me.grid.Columns.Item("Part_RP").Visible = True
        Else
            Me.grid.Columns.Item("Part_RC").Visible = False
            Me.grid.Columns.Item("Part_RM").Visible = False
            Me.grid.Columns.Item("Part_RCO").Visible = False
            Me.grid.Columns.Item("Part_RN").Visible = False
            Me.grid.Columns.Item("Part_RP").Visible = False
        End If

        'Mostrar Lucro
        If Me.chkMostrar_Lucro.Checked = True Then
            Me.grid.Columns.Item("Lucro_RC").Visible = True
            Me.grid.Columns.Item("Lucro_RM").Visible = True
            Me.grid.Columns.Item("Lucro_RCO").Visible = True
            Me.grid.Columns.Item("Lucro_RN").Visible = True
            Me.grid.Columns.Item("Lucro_RP").Visible = True
        Else
            Me.grid.Columns.Item("Lucro_RC").Visible = False
            Me.grid.Columns.Item("Lucro_RM").Visible = False
            Me.grid.Columns.Item("Lucro_RCO").Visible = False
            Me.grid.Columns.Item("Lucro_RN").Visible = False
            Me.grid.Columns.Item("Lucro_RP").Visible = False
        End If



        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Total - Exibe todos os departamento
            Me.grid.Columns.Item("nomeProduto").Caption = "Departamento"
            oVem.AtualizarEstatisticaPrograma(159, User.Identity.Name)
            Session("sMERCADOLOGICO") = Me.cboMercadologico.CallDepto
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid.Columns.Item("nomeProduto").Caption = "Seção"

            oVem.AtualizarEstatisticaPrograma(160, User.Identity.Name)
            Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSecao
        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.Columns.Item("nomeProduto").Caption = "Grupo"
            oVem.AtualizarEstatisticaPrograma(161, User.Identity.Name)
            Session("sMERCADOLOGICO") = Me.cboMercadologico.CallGrupo
        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.Columns.Item("nomeProduto").Caption = "Familia"
            oVem.AtualizarEstatisticaPrograma(162, User.Identity.Name)
            Session("sMERCADOLOGICO") = Me.cboMercadologico.CallSub grupo
        End If

        Me.grid.Visible = True
        Me.grid.DataBind()
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 5

        Call Classificacao()
  
    End Sub

    Private Sub Classificacao()
        'Bordas ---------------------------------------------------------------------------------------------------------------------
        If Me.chkMostrar_Class.Checked = True And Me.chkMostrar_Status.Checked = True Then  'Se a Class e o Status esta selecionado
            If Me.chkMostrar_Venda.Checked = True Then  'Se a venda esta selecionado
                'Limpar a borda padrão
                Call ClearBorder("Cat_RC")
                Call ClearBorder("Cat_RM")
                Call ClearBorder("Cat_RCO")
                Call ClearBorder("Cat_RN")
                Call ClearBorder("Cat_RP")

                If Me.chkMostrar_Lucro.Checked = False Then
                    'Preencher a borda do lado da coluna Venda
                    Call FillBorder("Venda_RC")
                    Call FillBorder("Venda_RM")
                    Call FillBorder("Venda_RCO")
                    Call FillBorder("Venda_RN")
                    Call FillBorder("Venda_RP")
                Else
                    Call FillBorder("Lucro_RC")
                    Call FillBorder("Lucro_RM")
                    Call FillBorder("Lucro_RCO")
                    Call FillBorder("Lucro_RN")
                    Call FillBorder("Lucro_RP")
                End If

            ElseIf Me.chkMostrar_Volume.Checked = True Then  'Se o Volume esta selecionado
                'Limpar a borda padrão
                Call ClearBorder("Cat_RC")
                Call ClearBorder("Cat_RM")
                Call ClearBorder("Cat_RCO")
                Call ClearBorder("Cat_RN")
                Call ClearBorder("Cat_RP")

                'Preencher a borda do lado da coluna Volume
                Call FillBorder("Qtde_RC")
                Call FillBorder("Qtde_RM")
                Call FillBorder("Qtde_RCO")
                Call FillBorder("Qtde_RN")
                Call FillBorder("Qtde_RP")

            ElseIf Me.chkMostrar_Lucro.Checked = True Then  'Se o Lucro esta selecionado
                'Limpar a borda padrão
                Call ClearBorder("Cat_RC")
                Call ClearBorder("Cat_RM")
                Call ClearBorder("Cat_RCO")
                Call ClearBorder("Cat_RN")
                Call ClearBorder("Cat_RP")

                'Preencher a borda do lado da coluna Lucro               
                Call FillBorder("Lucro_RC")
                Call FillBorder("Lucro_RM")
                Call FillBorder("Lucro_RCO")
                Call FillBorder("Lucro_RN")
                Call FillBorder("Lucro_RP")

            ElseIf Me.chkMostrar_Participacao.Checked = True Then  'Se a Participação esta selecionado
                'Limpar a borda padrão
                Call ClearBorder("Cat_RC")
                Call ClearBorder("Cat_RM")
                Call ClearBorder("Cat_RCO")
                Call ClearBorder("Cat_RN")
                Call ClearBorder("Cat_RP")

                'Preencher a borda do lado da coluna Lucro               
                Call FillBorder("Part_RC")
                Call FillBorder("Part_RM")
                Call FillBorder("Part_RCO")
                Call FillBorder("Part_RN")
                Call FillBorder("Part_RP")

            ElseIf Me.chkMostrar_PercMargem.Checked = True Then  'Se a Participação esta selecionado
                'Limpar a borda padrão
                Call ClearBorder("Cat_RC")
                Call ClearBorder("Cat_RM")
                Call ClearBorder("Cat_RCO")
                Call ClearBorder("Cat_RN")
                Call ClearBorder("Cat_RP")

                'Preencher a borda do lado da coluna Lucro               
                Call FillBorder("percMargem_RC")
                Call FillBorder("percMargem_RM")
                Call FillBorder("percMargem_RCO")
                Call FillBorder("percMargem_RN")
                Call FillBorder("percMargem_RP")


            Else    'Se a Class e o Status NÃO esta selecionado
                Call FillBorder("Cat_RC")
                Call FillBorder("Cat_RM")
                Call FillBorder("Cat_RCO")
                Call FillBorder("Cat_RN")
                Call FillBorder("Cat_RP")
            End If

        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2009
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboAno.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Categoria"
    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback
        Call Classificacao()
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        Dim col = TryCast(e.Column, GridViewDataColumn)
        If col Is Nothing Then
            Return
        End If

        Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim fieldName As String = col.FieldName
        Dim value As Decimal

        If e.IsTotalFooter Then
            Dim item = g.TotalSummary(fieldName)
            If item Is Nothing Then
                Return
            End If
            value = CDec(g.GetTotalSummaryValue(item))
        Else
            Dim item = g.GroupSummary(fieldName)
            If item Is Nothing Then
                Return
            End If

            value = CDec(g.GetGroupSummaryValue(e.VisibleIndex, item))
        End If

        If value < 0 Then
            e.Cell.ForeColor = Drawing.Color.Red
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        'Band Região Curitiba
        If e.DataColumn.FieldName = "Class_RC" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToInt16(e.CellValue) < 1 Then
                    e.Cell.BackColor = System.Drawing.Color.Transparent
                ElseIf Convert.ToInt16(e.CellValue) >= 1 And CInt(e.CellValue) <= 5 Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf CInt(e.CellValue) >= 6 And CInt(e.CellValue) <= 10 Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf CInt(e.CellValue) >= 11 And CInt(e.CellValue) <= 20 Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf CInt(e.CellValue) >= 21 And CInt(e.CellValue) <= 50 Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf CInt(e.CellValue) >= 51 And CInt(e.CellValue) <= 100 Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                Else
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Cat_RC" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "A" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "B" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "C" Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf Convert.ToString(e.CellValue) = "CA" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf Convert.ToString(e.CellValue) = "CB" Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                ElseIf Convert.ToString(e.CellValue) = "CC" Then
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        'Band Região Metropolitana
        If e.DataColumn.FieldName = "Class_RM" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToInt16(e.CellValue) < 1 Then
                    e.Cell.BackColor = System.Drawing.Color.Transparent
                ElseIf Convert.ToInt16(e.CellValue) >= 1 And CInt(e.CellValue) <= 5 Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf CInt(e.CellValue) >= 6 And CInt(e.CellValue) <= 10 Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf CInt(e.CellValue) >= 11 And CInt(e.CellValue) <= 20 Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf CInt(e.CellValue) >= 21 And CInt(e.CellValue) <= 50 Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf CInt(e.CellValue) >= 51 And CInt(e.CellValue) <= 100 Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                Else
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Cat_RM" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "A" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "B" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "C" Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf Convert.ToString(e.CellValue) = "CA" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf Convert.ToString(e.CellValue) = "CB" Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                ElseIf Convert.ToString(e.CellValue) = "CC" Then
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        'Band Região Centro-Oeste
        If e.DataColumn.FieldName = "Class_RCO" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToInt16(e.CellValue) < 1 Then
                    e.Cell.BackColor = System.Drawing.Color.Transparent
                ElseIf Convert.ToInt16(e.CellValue) >= 1 And CInt(e.CellValue) <= 5 Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf CInt(e.CellValue) >= 6 And CInt(e.CellValue) <= 10 Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf CInt(e.CellValue) >= 11 And CInt(e.CellValue) <= 20 Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf CInt(e.CellValue) >= 21 And CInt(e.CellValue) <= 50 Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf CInt(e.CellValue) >= 51 And CInt(e.CellValue) <= 100 Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                Else
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Cat_RCO" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "A" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "B" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "C" Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf Convert.ToString(e.CellValue) = "CA" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf Convert.ToString(e.CellValue) = "CB" Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                ElseIf Convert.ToString(e.CellValue) = "CC" Then
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        'Band Região Norte
        If e.DataColumn.FieldName = "Class_RN" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToInt16(e.CellValue) < 1 Then
                    e.Cell.BackColor = System.Drawing.Color.Transparent
                ElseIf Convert.ToInt16(e.CellValue) >= 1 And CInt(e.CellValue) <= 5 Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf CInt(e.CellValue) >= 6 And CInt(e.CellValue) <= 10 Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf CInt(e.CellValue) >= 11 And CInt(e.CellValue) <= 20 Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf CInt(e.CellValue) >= 21 And CInt(e.CellValue) <= 50 Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf CInt(e.CellValue) >= 51 And CInt(e.CellValue) <= 100 Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                Else
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Cat_RN" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "A" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "B" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "C" Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf Convert.ToString(e.CellValue) = "CA" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf Convert.ToString(e.CellValue) = "CB" Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                ElseIf Convert.ToString(e.CellValue) = "CC" Then
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        'Band Região Paranaguá
        If e.DataColumn.FieldName = "Class_RP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToInt16(e.CellValue) < 1 Then
                    e.Cell.BackColor = System.Drawing.Color.Transparent
                ElseIf Convert.ToInt16(e.CellValue) >= 1 And CInt(e.CellValue) <= 5 Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf CInt(e.CellValue) >= 6 And CInt(e.CellValue) <= 10 Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf CInt(e.CellValue) >= 11 And CInt(e.CellValue) <= 20 Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf CInt(e.CellValue) >= 21 And CInt(e.CellValue) <= 50 Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf CInt(e.CellValue) >= 51 And CInt(e.CellValue) <= 100 Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                Else
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Cat_RP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "A" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "B" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "C" Then
                    e.Cell.BackColor = System.Drawing.Color.Yellow
                ElseIf Convert.ToString(e.CellValue) = "CA" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                ElseIf Convert.ToString(e.CellValue) = "CB" Then
                    e.Cell.BackColor = System.Drawing.Color.LightCoral
                ElseIf Convert.ToString(e.CellValue) = "CC" Then
                    e.Cell.BackColor = System.Drawing.Color.Khaki
                End If
            End If
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Me.cboMercadologico.Visible_rndTotal = False
            Me.cboMercadologico.Visible_rndDepto = True
            Me.cboMercadologico.opcaoSecaoChecked = True
            Me.cboMercadologico.Visible_LegendaDepto = True
            Me.cboMercadologico.Visible_Depto = True
            Me.cboMercadologico.Visible_LegendaSecao = True
            Me.cboMercadologico.Visible_Secao = True
            
            Call CreateSession()
            Me.grid.Visible = True
            Me.grid.DataBind()
        End If

    End Sub

    Protected Sub wucBotaoExcel_BotaoClick(sender As Object, e As EventArgs) Handles wucBotaoExcel.BotaoClick
        Me.wucBotaoExcel.CallGridViewID = "grid"
    End Sub


End Class
