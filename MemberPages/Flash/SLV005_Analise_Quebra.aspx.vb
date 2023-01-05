
Partial Class MemberPages_Flash_SLV005_Analise_Quebra
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            cboPeriodo.Visible_MesAnterior = True
            cboPeriodo.Visible_MesmosDias = True

        End If

    End Sub


#Region " SESSION"

    Private Sub CallSession()

        On Error Resume Next

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal

        If cboPeriodo.Checked_MesmosDias = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If


        ' MES ANTERIOR
        If cboPeriodo.Checked_MesAnterior = True Then
            Session("sMES_ANTERIOR") = 2  'MES ANTERIOR
        Else
            Session("sMES_ANTERIOR") = 1  'ANO ANTERIOR
        End If
    End Sub

#End Region


    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Call CallSession()

        grid.Visible = True
        grid.DataBind()

        If cboFilial.CallCorporacao = 3 Then

            grid2_Item.Visible = True
            grid2_Item.DataBind()

            grid2.Visible = False
            
        ElseIf cboFilial.CallCorporacao = 199 Then

            grid2.Visible = True
            grid2.DataBind()

            grid2_Item.Visible = False

        End If


    End Sub

 
End Class
