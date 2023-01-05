
Partial Class MemberPages_Consulta12MesesLojas
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes

    Private Sub AtualizarTitulo()
        ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            'oVem.AtualizarEstatisticaPrograma(41, User.Identity.Name)

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())


            Me.cboGrupo.Visible_cboSubgrupo = False
            Me.cboGrupo.Visible_LabelSubGrupo = False


            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr1", "Janeiro", "Valor do mês de Janeiro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr2", "Fevereiro", "Valor do mês de Fevereiro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr3", "Março", "Valor do mês de Março", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr4", "Abril", "Valor do mês de Abril", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr5", "Maio", "Valor do mês de Maio", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr6", "Junho", "Valor do mês de Junho", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr7", "Julho", "Valor do mês de Julho", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr8", "Agosto", "Valor do mês de Agosto", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr9", "Setembro", "Valor do mês de Setembro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr10", "Outubro", "Valor do mês de Outubro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr11", "Novembro", "Valor do mês de Novembro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr12", "Dezembro", "Valor do mês de Dezembro", Funcoes.CasaDecimais.Nenhuma, 80)
            oFun.Grid_ColumnFormat(ASPxGridView1, "vlr99", "Ano", "Valor do Ano", Funcoes.CasaDecimais.Nenhuma, 80)

            oFun.Grid_ColumnFormat(ASPxGridView1, "perc1", "%", "Percentual do mês de Janeiro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc2", "%", "Percentual do mês de Fevereiro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc3", "%", "Percentual do mês de Março", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc4", "%", "Percentual do mês de Abril", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc5", "%", "Percentual do mês de Maio", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc6", "%", "Percentual do mês de Junho", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc7", "%", "Percentual do mês de Julho", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc8", "%", "Percentual do mês de Agosto", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc9", "%", "Percentual do mês de Setembro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc10", "%", "Percentual do mês de Outubro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc11", "%", "Percentual do mês de Novembro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc12", "%", "Percentual do mês de Dezembro", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(ASPxGridView1, "perc99", "%", "Percentual do Ano", Funcoes.CasaDecimais.Duas, 60)

            oFun.Grid_Column_BorderRight(ASPxGridView1, "Descricao", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc1", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc2", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc3", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc4", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc5", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc6", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc7", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc8", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc9", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc10", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc11", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "perc12", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_Wrap(ASPxGridView1, "Descricao", DevExpress.Utils.DefaultBoolean.False)

            Session("sANO") = Me.cboAno.CallAno
            
            'Me.cboGrupo.Text = 1
            ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Consulta de Despesa por Grupo - 12 meses"
    End Sub


    Sub Atualizar()
        ASPxGridView1.Visible = True
        ASPxGridView1.DataBind()
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
        Atualizar()

    End Sub
End Class
