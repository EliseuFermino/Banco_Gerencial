<%@ Page Title="Ficha - PDCA" Language="VB" MasterPageFile="~/MemberPages/PDCA/mpPlanejamento.master" AutoEventWireup="false" CodeFile="planej01_Ficha.aspx.vb" Inherits="Ranking_planej01_Ficha" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register Src="~/MemberPages/PDCA/Controles/wuc_cboProjeto_Subprojeto.ascx" TagPrefix="uc1" TagName="wuc_cboProjeto_Subprojeto" %>




<%@ PreviousPageType VirtualPath="~/MemberPages/Projetos/projMenuPrincipal.aspx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divListaProjetos">      

        <uc1:wuc_cboProjeto_Subprojeto runat="server" ID="cboProjeto" />

    </div>         

    <div id="divDados" style="clear:both; float:left; padding-top: 5px" runat="server">        
    
        <asp:Panel ID="pan" runat="server" BorderColor="#8ab216" BorderStyle="Dotted" 
        BorderWidth="1px" Width="845px" Height="394px">
        <table class="style1">
            <tr>
                <td align="left" style="width: 163px" valign="top">
                    <table class="style1">
                        <tr>
                            <td style="align-content:center;font-weight:bolder; font-size:40px;text-align:center">
                                Problema
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dxe:ASPxButton ID="btnAlterar" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageSpacing="5px" Text="Alterar" Width="120px" Theme="Youthful">
                                    <Image Url="~/image/note-edit-icon_24.png" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dxe:ASPxButton ID="btnNovo" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageSpacing="5px" Text="Novo " Width="120px" Theme="Youthful">
                                    <Image Url="~/image/note-add-icon_24.png" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dxe:ASPxButton ID="btnSalvar" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageSpacing="5px" Text="Salvar" Width="120px" Enabled="False" Theme="Youthful">
                                    <Image Url="~/image/note-accept-icon_24.png" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dxe:ASPxButton ID="btnExcluir" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageSpacing="5px" Text="Excluir" Width="120px" Theme="RedWine">
                                    <Image Url="~/image/note-remove-icon_24.png" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <dxe:ASPxButton ID="btnCancelar" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageSpacing="5px" Text="Cancelar" Width="120px" Enabled="False" Theme="Youthful">
                                    <Image Url="~/image/undo-icon_24.png" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td align="left" valign="top" style="width: 677px">
                    <asp:Panel ID="panFicha" runat="server" Height="385px" BorderColor="#8ab216"
                        BorderStyle="Dotted" BorderWidth="1px" Width="700px">
                        <table class="style1">
                            <tr>
                                <td class="auto-style1" style="background-color: #336600; vertical-align: middle; text-align: center; color: #FFFFFF;" colspan="3">
                                    <asp:Label ID="lblNome" runat="server" Font-Size="XX-Large" ForeColor="White" Text="Projeto"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" style="width: 179px; "><b style="color: #336600">Nome : </b></td>
                                <td align="left" valign="top">                                        
                                    <dxe:ASPxMemo ID="txtSubProjeto" runat="server" Height="61px" Width="406px" ReadOnly="True" Font-Size="Medium"  Theme="Youthful" ></dxe:ASPxMemo>                                  
                                </td>
                                <td style="width: 144px">&nbsp;</td>
                            </tr>
                                </tr>
                                <td class="auto-style1" style="width: 179px; "><b style="color: #336600">Problema : </b></td>
                                <td align="left" valign="top">                                        
                                    <dxe:ASPxMemo ID="txtProblema" runat="server" Height="61px" Width="406px" ReadOnly="True" Font-Size="Medium"  Theme="Youthful" ></dxe:ASPxMemo>                                  
                                </td>
                                <td style="width: 144px">&nbsp;</td>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left" class="style10" style="font-weight: bold; width: 157px; color: #336600;" 
                                    valign="center">
                                    Meta :</td>
                                <td align="left" valign="top">
                                     <dxe:ASPxMemo ID="txtObjetivoProjeto" runat="server" Height="61px" Width="406px" ReadOnly="True" Font-Size="Medium"  Theme="Youthful" ></dxe:ASPxMemo>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left" class="style10" style="font-weight: bold; width: 157px; color: #336600;" 
                                    valign="middle">
                                    Data de Inicio :</td>
                                <td class="style9" style="width: 155px">
                                    <dxe:ASPxDateEdit ID="txtDataInicio" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" 
                                        ImageFolder="~/App_Themes/Office2003 Blue/{0}/" ReadOnly="True" Theme="Youthful">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td align="left" class="auto-style1" style="width: 135px; " 
                                    valign="middle">
                                    <b style="color: #336600">Data de Término:</b></td>
                                <td>
                                    <dxe:ASPxDateEdit ID="txtDataTermino" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" 
                                        Width="111px" ReadOnly="True" Theme="Youthful">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left" class="auto-style1" style="width: 157px; " 
                                    valign="middle">
                                    <b style="color: #336600">Responsável : </b>
                                </td>
                                <td style="width: 204px">
                                    <dxe:ASPxComboBox ID="cboCoordenador" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                                        DataSourceID="dsFichaCoordenador" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" 
                                        TextField="CoordenadorDesc" ValueField="CoordenadorID" 
                                        ValueType="System.String" ReadOnly="True" Theme="Youthful">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td style="width: 77px; " class="auto-style1">
                                    <b style="color: #336600">Facilitador:</b></td>
                                <td>
                             
                                    <dxe:ASPxTextBox ID="txtFacilitador" runat="server" Height="21px" Width="195px" ReadOnly="True" Font-Size="Medium"  Theme="Youthful" ></dxe:ASPxTextBox>

                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left" class="style10" style="width: 158px; color: #4B60A2;" 
                                    valign="top">
                                    <b style="color: #336600"><span class="auto-style1">Participantes :<br />
                                    &nbsp;&nbsp; (<span style="font-size: small">e-mail</span></span>)</b></td>
                                <td align="left" valign="top">
                                    
                                    <dxe:ASPxMemo ID="txtParticipantes" runat="server" Height="61px" Width="406px" ReadOnly="True" Font-Size="Medium"  Theme="Youthful" ></dxe:ASPxMemo>

                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left" class="style10" style="font-weight: bold; width: 250px; color: #336600;" 
                                    valign="middle">
                                    Qual é a Periodicidade da Reunião?</td>
                                <td>
                                    <dxe:ASPxComboBox ID="cboPeriodicidade" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                                        DataSourceID="dsFichaPeriodicidade" 
                                        ImageFolder="~/App_Themes/Office2003 Blue/{0}/" TextField="PeriodicidadeDesc" 
                                        ValueField="PeriodicidadeID" ValueType="System.String" Width="151px" ReadOnly="True" Theme="Youthful">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td>
                                    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                                </td>
                                <td align="center">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:SqlDataSource ID="dsFichaCoordenador" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                        SelectCommand="SELECT [CoordenadorID], [CoordenadorDesc] FROM [projCadCoordenador] ORDER BY [CoordenadorDesc]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="dsFichaPeriodicidade" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                        SelectCommand="SELECT [PeriodicidadeID], [PeriodicidadeDesc] FROM [tblCadPeriodicidade]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>

    </div>
</asp:Content>


