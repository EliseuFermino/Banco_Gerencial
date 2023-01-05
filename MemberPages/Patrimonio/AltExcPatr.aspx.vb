
Partial Class MemberPages_Patrimonio_AltExcPatr
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        'Dim contexto As New gerProjetosEntities
        'rptClientes.DataSource = contexto.tblDados.ToList()
        'rptClientes.DataBind()

        Using NWcontext As New gerProjetos_Entities()
            Dim dadosFurtos = From s In NWcontext.tblDados
                                Where s.idFilial = 21

            rptClientes.DataSource = dadosFurtos.ToList()
            rptClientes.DataBind()

        End Using

    End Sub

   
End Class
