<%@ Page Title="Páscoa Inicial" Language="VB" MasterPageFile="~/MemberPages/mpCampanha_Pascoa.master" AutoEventWireup="false" CodeFile="PascoaCapa.aspx.vb" Inherits="MemberPages_Campanhas_Pascoa_PascoaCapa" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>


<%@ Register src="../../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
            .auto-style2 {
                height: 70px;
                width: 164px;
            }
            .auto-style3 {
                width: 460px;
                font-weight: 700;
            }
            .auto-style4 {
                width: 183px;
            }
            .auto-style5 {
                width: 390px;
                text-align: center;
            }
    </style>
    
        <table class="auto-style1"> 
            <%--Atingimento--%>
            <tr> 
                <td colspan="7" style="background-color:lightgray; text-align: left;  font-size: 20px; height:5px; padding:0px;  border:1px solid darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <table class="dxflInternalEditorTable_Office2010Silver">
                        <tr>
                            <td class="auto-style3">
                    <asp:Label ID="lblPeriodo1" runat="server" Text="Label" style="font-size: medium"></asp:Label> 
                            </td>
                            <td class="auto-style4">
                        <dx:ASPxComboBox ID="cboCod" runat="server" EnableTheming="True" SelectedIndex="0" Theme="Default" Font-Size="Large" ForeColor="#333333" Width="200px" DropDownRows="9">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Total Páscoa" Value="0" />
                            <dx:ListEditItem Text="Ovos" Value="2" />
                            <dx:ListEditItem Text="Caixa de Bombom" Value="1" />
                            <dx:ListEditItem Text="Coelhinho" Value="3" />
                            <dx:ListEditItem Text="Colomba" Value="4" />
                            <dx:ListEditItem Text="Bacalhau" Value="5" />
                            <dx:ListEditItem Text="Barras de Chocolate" Value="6" />
                            <dx:ListEditItem Text="Chocolate Presentes" Value="7" />
                            <dx:ListEditItem Text="Mundo Chocolate" Value="100" />
                        </Items>
                    </dx:ASPxComboBox>

                            </td>
                            <td class="auto-style5">
                                <uc2:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                            </td>
                            <td>
                                <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis">
                                </dx:ASPxButton>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>  
            <tr> 
                <td colspan="6" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblDescricaoAT" runat="server" Text="Label"></asp:Label></b>&nbsp;</td>
                <td colspan="2" rowspan="1" style="background-color:gray ; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblAnoAT" runat="server" Text="Label" ForeColor="White"></asp:Label></b>
                </td>
            </tr>  <%--Diferença Margem Realizada--%>        
            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloReal" runat="server" Text="Realizado Páscoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Diferença Lucratividade--%>
                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size:20px; background-color:darkred; color:white; text-align:center; " class="auto-style2">Crescimento <br />
                    <asp:Label  ID="lblCrescimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td>  <%--Participação--%>

                <td style="border:solid; border-width:1px; font-size:18px; background-color:darkorange;color:white; height:70px; text-align:center; width:90px">Margem PDV <br />
                    <asp:Label  ID="lblMargemPDV" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Meta Pascoa--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:#58c72c;color:white; height:70px; text-align:center; width:90px">Margem Final <br />
                    <asp:Label  ID="lblMargemFinal" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Meta Pascoa--%>

                 <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Lucratividade <br />
                   R$ <asp:Label  ID="lblLucratividade" runat="server" Text="0" Font-Size="35px" ></asp:Label>
                </td> <%--Crescimento--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Participação <br />
                    <asp:Label  ID="lblParticipacao" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Dados 2012--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkgreen;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMeta" runat="server" Text="Meta Pascoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Diferenças--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:180px">Atingimento <br />
                    <asp:Label  ID="lblPercentualAtingimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Informações Diferença--%>             
            </tr>  <%--Atingimento--%> 

            <tr>
                <td colspan="5" rowspan="1" style="color:slategray">
                    <asp:Label ID="lblPeriodo2" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>  <%--Diferença Margem Realizada--%>

            <tr> 
                <td colspan="6" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblDescricaoAA" runat="server" Text="Label"></asp:Label></b>
                </td>
                <td colspan="2" rowspan="1" style="background-color:gray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblAnoAA" runat="server" Text="0"></asp:Label></b>
                </td>
            </tr>  <%--Diferença Lucratividade--%>   

            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloRealAA" runat="server" Text="Realizado Páscoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Participação--%>
                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size:20px; background-color:darkred; color:white; text-align:center; " class="auto-style2">Crescimento <br />
                    &nbsp;<asp:Label  ID="lblCrescimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Meta Pascoa--%>

                <td style="border:solid; border-width:1px; font-size:18px; background-color:darkorange;color:white; height:70px; text-align:center; width:90px">Margem PDV <br />
                    <asp:Label  ID="lblMargemPDV_AA" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:#58c72c;color:white; height:70px; text-align:center; width:90px">Margem Final <br />
                    <asp:Label  ID="lblMargemFinal_AA" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Lucratividade <br />
                   R$ <asp:Label  ID="lblLucratividadeAA" runat="server" Text="0" Font-Size="35px" ></asp:Label>
                </td> <%--Informações Diferença--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Participação <br />
                    <asp:Label  ID="lblParticipacaoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Diferenças--%>   
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMetaAA" runat="server" Text="Realizado Pascoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Informações Diferença--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:180px">Atingimento <br />
                    <asp:Label  ID="lblPercentualAtingimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Atingimento--%>             
            </tr>  <%--Diferença Margem Realizada--%>



            <tr>
                <td colspan="5" rowspan="1" style="color:slategray">
                    <asp:Label ID="lblPeriodo3" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>  <%--Diferença Lucratividade--%>

            <tr> 
                <td colspan="6" rowspan="1" style="background-color:lightgray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblDescricaoAA1" runat="server" Text="Label"></asp:Label></b>&nbsp;</td>
                <td colspan="2" rowspan="1" style="background-color:gray; text-align: center;  font-size: 20px; height:5px; padding:0px;  border:solid; border-width:1px; border-color:darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                    <b><asp:Label ID="lblAnoAA1" runat="server" Text="0"></asp:Label></b>
                </td>
            </tr>  <%--Participação--%>   

            <tr>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloRealAA1" runat="server" Text="Realizado Páscoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblRealPascoaAA1" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Meta Pascoa--%>
                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size:20px; background-color:darkred; color:white; text-align:center; " class="auto-style2">Crescimento <br />
                    <asp:Label  ID="lblCrescimentoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:darkorange;color:white; height:70px; text-align:center; width:90px">Margem PDV<br />
                    <asp:Label  ID="lblMargemPDV_AA1" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Informações Diferença--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:#58c72c;color:white; height:70px; text-align:center; width:90px">Margem Final <br />
                    <asp:Label  ID="lblMargemFinal_AA1" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Informações Diferença--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:200px">Lucratividade <br />
                   R$ <asp:Label  ID="lblLucratividadeAA1" runat="server" Text="0" Font-Size="35px" ></asp:Label>
                </td> <%--Atingimento--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Participação <br />
                    <asp:Label  ID="lblParticipacaoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Diferença Margem Realizada--%>   
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkblue;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMetaAA1" runat="server" Text="Meta Pascoa Total"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoaAA1" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Diferença Lucratividade--%>

                <td style="border:solid; border-width:1px; font-size:20px; background-color:gray;color:white; height:70px; text-align:center; width:180px">Atingimento <br />
                    <asp:Label  ID="lblPercentualAtingimentoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="True"  ></asp:Label>
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
                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size:20px; background-color:gray; color:white; text-align:center; " class="auto-style2">Percentual <br />
                    <asp:Label  ID="lblPercentualAtingimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Atingimento--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:darkorange;color:white; height:70px; text-align:center; width:90px">Margem PDV <br />
                    <asp:Label  ID="lblMargemPDV_Dif" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td> <%--Diferença Margem Realizada--%>
                <td style="border:solid; border-width:1px; font-size:18px; background-color:#58c72c;color:white; height:70px; text-align:center; width:90px">Margem Final <br />
                    <asp:Label  ID="lblMargemFinal_Dif" runat="server" Text="0" Font-Size="25px" Font-Bold="true"  ></asp:Label>
                </td>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:chocolate;color:white; height:70px; text-align:center; width:100px">Lucratividade <br />
                    <asp:Label  ID="lblLucratividadeDif" runat="server" Text="0" Font-Size="35px"  ></asp:Label>
                </td> <%--Diferença Lucratividade--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkslategray;color:white; height:70px; text-align:center; width:180px">Percentual <br />
                    <asp:Label  ID="lblParticipacaoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Participação--%>   
                <td style="border:solid; border-width:1px; font-size:20px; background-color:forestgreen;color:white; height:70px; text-align:center; width:220px">
                    <asp:Label ID="lblTituloMetaDif" runat="server" Text="Valor"></asp:Label> <br />
                    R$ <asp:Label ID="lblMetaPascoaDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                </td> <%--Meta Pascoa--%>
                <td style="border:solid; border-width:1px; font-size:20px; background-color:darkred;color:white; height:70px; text-align:center; width:180px">Percentual <br />
                    <asp:Label  ID="lblCrescimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"  ></asp:Label>
                </td> <%--Crescimento--%>             
            </tr>  <%--Informações Diferença--%>
        </table>
        
    
</asp:Content>

