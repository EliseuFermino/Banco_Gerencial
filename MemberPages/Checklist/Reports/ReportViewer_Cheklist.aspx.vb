﻿Imports DevExpress.Web.ASPxHtmlEditor.Internal
Imports DevExpress.Xpf.Docking.VisualElements
Imports GeniusCode.Framework.Support
Imports Microsoft.Reporting.WebForms.ReportViewer
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing.Printing
Imports System.Runtime.InteropServices

Partial Class MemberPages_Checklist_Reports_ReportViewer_Cheklist
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            carregaRelatorio()

        End If
    End Sub

    Private Sub carregaRelatorio()
        Dim html As String
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCheckListConnectionString").ConnectionString
        Dim selectSQL As String = <![CDATA[SELECT	Fil.FilialLista 
			  ,CONCAT(Convert(varchar,a.Dia,103), ' ', Hora) Dia
			  ,Gru.listaGrupo 
			  ,Su.listaSubgrupo     
			  ,Perg.descPergunta     
			  ,a.Descricao
			  ,im.imgData
			  ,im.imgTitle
		  FROM Dados.tblFilial_3 AS a JOIN Cadastro.tblCadGrupo AS Gru
		  ON a.idGrupo = Gru.idGrupo JOIN Cadastro.tblCadSubgrupo AS Su
		  ON a.idGrupo = Su.idGrupo
		  AND a.idSubgrupo = Su.idSubgrupo JOIN Cadastro.tblCadPerguntas AS Perg
		  ON a.idGrupo = Perg.idGrupo 
		  AND a.idSubgrupo = Perg.idSubgrupo 
		  AND a.idCod = Perg.idPergunta JOIN gerManager.Cadastros.tblCadFiliais AS Fil
		  ON a.idFilial = Fil.Filial LEFT JOIN Fotos.tblFilial_3 AS Im
		  ON a.Dia = im.Dia 
		  AND a.idFilial = im.idFilial 
		  AND a.idGrupo = im.idGrupo 
		  AND a.idSubgrupo = im.idSubgrupo 
		  AND a.idCod = im.idCod    
	WHERE a.Dia='2022-04-02'
and LEN(CONVERT(VARCHAR(25),A.Descricao)) > 0]]>.Value()

        html = <![CDATA[<br />
        <br />
        <div Class="row justify-content-center" style="color: #008080; font-size: 25pt">
        <strong> Relatório Diário - Cheklist</strong>
        </div>
        <br /><br />]]>.Value()

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(selectSQL)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        For Each tabela In ds.Tables(0).Rows

                            html += <![CDATA[<div Class="row row-cols-auto" style="align-content: center; align-items: center;">
                            <div Class="col-1"></div>
                            <div Class="col-6">
                            <div Class="row justify-content-between">
                            <div Class="col-2">
                            <strong> Filial: </strong>
                            </div>
                            <div Class="col-4">]]>.Value()

                            html += tabela(0)

                            html += <![CDATA[</div>
                            <div Class="col-2">
                            <strong> Dia: </strong>
                            </div>
                            <div Class="col-4">]]>.Value()

                            html += tabela(1)

                            html += <![CDATA[</div>
                            </div>
                            <hr>
                            <div Class="row justify-content-between">
                            <div Class="col-2">
                            <strong> Grupo: </strong>
                            </div>
                            <div Class="col-4">]]>.Value()

                            html += tabela(2)

                            html += <![CDATA[</div>
                            <div Class="col-2">
                            <strong> Sub-Grupo: </strong>
                            </div>
                            <div Class="col-4">]]>.Value()

                            html += tabela(3)

                            html += <![CDATA[</div>
                            </div>
                            <hr>
                            <div Class="row justify-content-between">
                            <div Class="col-2" style="color: #0000FF">
                            <strong> Pergunta: </strong>
                            </div>
                            <div Class="col-10" style="color: #0001FF"> ]]>.Value().ToString()

                            html += Replace(tabela(4), "–", "-")

                            html += <![CDATA[</div>
                            </div>
                            <hr>
                            <div Class="row justify-content-between" >
                            <div Class="col-2" style="color: #FF0000">
                            <strong> Resposta: </strong>
                            </div>
                            <div Class="col-10" style="color: #FF0001"> ]]>.Value()

                            html += tabela(5)

                            If (tabela(7).ToString.Length > 0) Then
                                html += <![CDATA[<br /><b style="color: white">_</b></div>
                                </div>
                                </div>                                
                                <div Class="col-4">]]>.Value()

                                Dim imageBytes() As Byte = tabela(6)

                                html += "<img src='"
                                html += String.Format("data:image/{0};base64,{1}", "png", Convert.ToBase64String(imageBytes))
                                html += "'>"
                            Else
                                html += <![CDATA[</div>
                                </div>
                                </div>
                                <div Class="col-4">]]>.Value()

                            End If

                            html += <![CDATA[</div>
                            <div Class="col-1"></div>
                            </div>
                            <hr class="mb-3">]]>.Value()

                        Next
                    End Using
                End Using
            End Using
        End Using

        renderRel.InnerHtml = html

        'Dim idFilial = Request.QueryString("idFilial").ToString()
        'Dim Data = Request.QueryString("data").ToString()
        'Dim imgs() As String = Split("3;2;4;5;6;7", ";", -1)
        'Dim compil = ""

        'For Each complilaImgs In imgs
        '    If complilaImgs.ToString() <> "" Then
        '        compil += "<a href='Arquivos\" + complilaImgs.ToString() + "' target='_blank'><img src='../../Images/photo_icon.png' style='width 25px; height: 25px'/></a>"
        '    End If
        'Next
        'renderRel.InnerHtml += Server.HtmlDecode(compil)


        'renderRel.InnerHtml = "<h1>Bootstrap Tutorial</h1><p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p></div><div id='customers'></div>"

    End Sub
End Class
