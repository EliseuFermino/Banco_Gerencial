<%@ Page Title="Páscoa Inicial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Pascoa1.aspx.vb" Inherits="MemberPages_Campanhas_Pascoa_Pascoa1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
    
        <table class="auto-style1"> 
            <tr>
                <td colspan="5" rowspan="1" style="color:slategray">
                    <asp:Label ID="lblPeriodo1" runat="server" Text="Label"></asp:Label> 
                </td>
            </tr>  <%--Cabeçalho Diferença--%>
            <tr> 
                <td colspan="5" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b>Comparativo Proporcional ao Mesmo Periodo de 2014 e 2013</b>
                </td>
                <td colspan="2" rowspan="1" style="background-color:gray ; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblAnoAT" runat="server" Text="Label"></asp:Label></b>
                </td>
            </tr>  <%--Realizado Pascoa--%>        
            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloReal" runat="server" Text="Realizado Páscoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Realizado Pascoa--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:160px">Atingimento <br />
                    <asp:Label  ID="lblPercentualAtingimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td>  <%--Atingimento--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkorange;color:white; height:70px; text-align:center; width:180px">Margem Realizada <br />
                    <asp:Label  ID="lblMargemRealizada" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Margem Realizada--%>

                 <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Lucratividade <br />
                   R$ <asp:Label  ID="lblLucratividade" runat="server" Text="0" Font-Size="35px" ></asp:Label>
                </td> <%--Lucratividade--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Participação <br />
                    <asp:Label  ID="lblParticipacao" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Participação--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkgreen;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMeta" runat="server" Text="Meta Pascoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Meta Pascoa--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkred;color:white; height:70px; text-align:center; width:180px">Crescimento <br />
                    <asp:Label  ID="lblCrescimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>        
                    
            </tr>  <%-- Dados do Ano Atual--%> 

            <tr>
                <td colspan="5" rowspan="1" style="color:slategray">
                    <asp:Label ID="lblPeriodo2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>  <%--Período 2--%>

            <tr> 
                <td colspan="5" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b>Comparativo Proporcional ao Mesmo Periodo de 2013 e 2012</b>
                </td>
                <td colspan="2" rowspan="1" style="background-color:gray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblAnoAA" runat="server" Text="0"></asp:Label></b>
                </td>
            </tr>  <%--Cabeçalho Período 2--%>   

            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloRealAA" runat="server" Text="Realizado Páscoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Meta Pascoa--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:160px">Atingimento <br />
                    <asp:Label  ID="lblPercentualAtingimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Atingimento AA--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkorange;color:white; height:70px; text-align:center; width:180px">Margem Realizada <br />
                    <asp:Label  ID="lblMargemRealizadaAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Margem Realizada AA--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Lucratividade <br />
                   R$ <asp:Label  ID="lblLucratividadeAA" runat="server" Text="0" Font-Size="35px" ></asp:Label>
                </td> <%--Lucratividade AA--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Participação <br />
                    <asp:Label  ID="lblParticipacaoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Atingimento--%>   
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkgreen;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMetaAA" runat="server" Text="Meta Pascoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Margem Realizada--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkred;color:white; height:70px; text-align:center; width:180px">Crescimento <br />
                    <asp:Label  ID="lblCrescimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Participação--%>             
            </tr>  <%--Meta Pascoa--%>
            
            <tr> 
                <td colspan="7" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b>Diferenças</b>
                </td>
            </tr>  <%--Crescimento--%>   
            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloRealDif" runat="server" Text="Valor"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoaDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Informações Diferença--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:160px">Percentual <br />
                    <asp:Label  ID="lblPercentualAtingimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Atingimento--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkorange;color:white; height:70px; text-align:center; width:180px">Percentual <br />
                    <asp:Label  ID="lblMargemRealizadaDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Diferença Margem Realizada--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Percentual <br />
                    <asp:Label  ID="lblLucratividadeDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Diferença Lucratividade--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Percentual <br />
                    <asp:Label  ID="lblParticipacaoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Participação--%>   
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkgreen;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMetaDif" runat="server" Text="Valor"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoaDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Meta Pascoa--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkred;color:white; height:70px; text-align:center; width:180px">Percentual <br />
                    <asp:Label  ID="lblCrescimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>             
            </tr>  <%--Informações Diferença--%>
        </table>

        <table class="auto-style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsAnaliseDia" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspPascoaBuscaAcompanhamentoPorDia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="Cod" SessionField="sCOD" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>

        <table class="auto-style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        
</asp:Content>

