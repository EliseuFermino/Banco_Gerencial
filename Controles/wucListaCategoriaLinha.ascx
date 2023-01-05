<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaCategoriaLinha.ascx.vb" Inherits="Controles_wucListaCategoriaLinha" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<style type="text/css">
    .style2
    {
        width: 59px;
        font-weight: bold;
        color: #FFFFFF;
    }
    .style4
    {
        width: 296px;
    }
    .style5
    {
        width: 51px;
        font-weight: bold;
        color: #FFFFFF;
        font-family: "Times New Roman", Times, serif;
    }
    .style6
    {
        width: 347px;
    }
    </style>
<table>
    <tr>
        <td >
            <asp:Label ID="lblGrupo" runat="server" Text="Grupo:" ForeColor="#333333"></asp:Label>
        </td>
        <td class="style4">
                <dxe:ASPxComboBox ID="cboGrupo" runat="server" AutoPostBack="True" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" 
                    ShowShadow="False" TextField="GrupoDesc" ValueField="idGrupo" 
                    Width="250px" Native="True" Theme="DevEx" DataSourceID="dsDepto">
                    <ButtonEditEllipsisImage Height="3px" 
                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                    <DropDownButton>
                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                    </DropDownButton>
                    <ValidationSettings>
                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                            Width="14px" />
                        <ErrorFrameStyle ImageSpacing="4px">
                            <ErrorTextPaddings PaddingLeft="4px" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                </dxe:ASPxComboBox>
            </td>
        <td >
            &nbsp;</td>
    </tr>
</table>
    <asp:SqlDataSource ID="dsDepto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
        
    
    
    SelectCommand="SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha ORDER BY  idGrupo">
    </asp:SqlDataSource>


    



<asp:HiddenField ID="lblPosicao" runat="server" />



    



