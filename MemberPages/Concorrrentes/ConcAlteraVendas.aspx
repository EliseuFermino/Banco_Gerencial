<%@ Page Title="Alterar Vendas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConcAlteraVendas.aspx.vb" Inherits="MemberPages_ConcAlteraVendas" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table cellspacing="1" class="style1">
        <tr>
            <td style="width: 54px; color: #FFFFFF">
                <b>Mês:</b></td>
            <td style="width: 164px">
                                                <dxe:ASPxComboBox ID="cboMes" runat="server" AutoPostBack="True" 
                                                    
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ImageFolder="~/App_Themes/Aqua/{0}/" 
                    SettingsLoadingPanel-Text="" ShowShadow="False" 
                                                    ValueType="System.String" Width="105px" Theme="DevEx">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Janeiro" Value="1" />
                                                        <dxe:ListEditItem Text="Fevereiro" Value="2" />
                                                        <dxe:ListEditItem Text="Março" Value="3" />
                                                        <dxe:ListEditItem Text="Abril" Value="4" />
                                                        <dxe:ListEditItem Text="Maio" Value="5" />
                                                        <dxe:ListEditItem Text="Junho" Value="6" />
                                                        <dxe:ListEditItem Text="Julho" Value="7" />
                                                        <dxe:ListEditItem Text="Agosto" Value="8" />
                                                        <dxe:ListEditItem Text="Setembro" Value="9" />
                                                        <dxe:ListEditItem Text="Outubro" Value="10" />
                                                        <dxe:ListEditItem Text="Novembro" Value="11" />
                                                        <dxe:ListEditItem Text="Dezembro" Value="12" />
                                                    </Items>
                                                    <ButtonEditEllipsisImage Height="3px" 
                                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" 
                                                        Width="12px" />
                                                    <DropDownButton>
                                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" 
                                                            Width="9px" />
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
            <td style="width: 69px; color: #FFFFFF">
                <b>Ano: </b>
            </td>
            <td>
                                                <dxe:ASPxComboBox ID="cboAno" runat="server" AutoPostBack="True" 
                                                    
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ImageFolder="~/App_Themes/Aqua/{0}/" 
                    SettingsLoadingPanel-Text="" ShowShadow="False" Width="60px" EnableTheming="True" Theme="DevEx">
                                                    <Items>                                                        
                                                        <dxe:ListEditItem Text="2013" Value="2013" />
                                                        <dxe:ListEditItem Text="2014" Value="2014" />
                                                        <dxe:ListEditItem Text="2015" Value="2015" />
                                                        <dxe:ListEditItem Text="2016" Value="2016" />
                                                        <dxe:ListEditItem Text="2017" Value="2017" />
                                                        <dxe:ListEditItem Text="2018" Value="2018" />
                                                        <dxe:ListEditItem Text="2019" Value="2019" />
                                                        <dxe:ListEditItem Text="2020" Value="2020" />
                                                    </Items>
                                                    <ButtonEditEllipsisImage Height="3px" 
                                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" 
                                                        Width="12px" />
                                                    <DropDownButton>
                                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" 
                                                            Width="9px" />
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
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    KeyFieldName="IE" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" Width="700px" EnableTheming="True" Theme="SoftOrange">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#E8F3FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsPager PageSize="18">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" 
                        PopupEditFormHorizontalOffset="500" PopupEditFormModal="True" 
                        PopupEditFormWidth="500px" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" Caption="Edição" Width="150px" ShowClearFilterButton="True" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                        <dxwgv:GridViewDataTextColumn Caption="Inscrição Estadual" FieldName="IE" 
                             VisibleIndex="1" Width="120px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano"  
                            VisibleIndex="3" Width="50px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes"  
                            VisibleIndex="2" Width="50px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrOri" VisibleIndex="4" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="5" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataCheckColumn FieldName="Fechada" VisibleIndex="6" 
                            Width="50px">
                        </dxwgv:GridViewDataCheckColumn>
                        <dxwgv:GridViewDataCheckColumn FieldName="aConfirmar" VisibleIndex="7" 
                            Width="70px">
                        </dxwgv:GridViewDataCheckColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="StatusID" VisibleIndex="8" 
                            Width="70px">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" showverticalscrollbar="True" 
                        verticalscrollableheight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsCommandButton>
                        <ClearFilterButton Text="Limpar Filtro"/>
                        <EditButton Text="Alterar"/>
                        <NewButton Text="Novo"/>
                        <DeleteButton Text="Excluir"/>
                        <CancelButton Text="Cancelar"/>
                        <UpdateButton Text="Atualizar"/>
                    </SettingsCommandButton>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" 
                    DeleteCommand="DELETE FROM [tblDados] WHERE [IE] = @IE AND [Ano] = @Ano AND [Mes] = @Mes" 
                    InsertCommand="INSERT INTO [tblDados] ([IE], [Ano], [Mes], [vlrOri], [vlr], [Fechada], [aConfirmar], [StatusID]) VALUES (@IE, @Ano, @Mes, @vlrOri, @vlr, 1, 0, @StatusID)" 
                    SelectCommand="SELECT [IE], [Ano], [Mes], [vlrOri], [vlr], [Fechada], [aConfirmar], [StatusID]  FROM [tblDados] WHERE (([Ano] = @Ano) AND ([Mes] = @Mes)) ORDER BY [Ano], [Mes], [IE]" 
                    UpdateCommand="UPDATE [tblDados] SET [vlrOri] = @vlrOri, [vlr] = @vlr, [Fechada] = @Fechada, [aConfirmar] = @aConfirmar, [StatusID] = @StatusID WHERE [IE] = @IE AND [Ano] = @Ano AND [Mes] = @Mes">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" PropertyName="Value" 
                            Type="Int16" />
                        <asp:ControlParameter ControlID="cboMes" Name="Mes" PropertyName="Value" 
                            Type="Int16" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="IE" Type="Double" />
                        <asp:Parameter Name="Ano" Type="Int16" />
                        <asp:Parameter Name="Mes" Type="Int16" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="vlrOri" Type="Decimal" />
                        <asp:Parameter Name="vlr" Type="Single" />
                        <asp:Parameter Name="Fechada" Type="Boolean" />
                        <asp:Parameter Name="aConfirmar" Type="Boolean" />
                        <asp:Parameter Name="StatusID" Type="Byte" />
                        <asp:Parameter Name="IE" Type="Double" />
                        <asp:Parameter Name="Ano" Type="Int16" />
                        <asp:Parameter Name="Mes" Type="Int16" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IE" Type="Double" />
                        <asp:Parameter Name="Ano" Type="Int16" />
                        <asp:Parameter Name="Mes" Type="Int16" />
                        <asp:Parameter Name="vlrOri" Type="Decimal" />
                        <asp:Parameter Name="vlr" Type="Single" />
                        <asp:Parameter Name="Fechada" Type="Boolean" />
                        <asp:Parameter Name="aConfirmar" Type="Boolean" />
                        <asp:Parameter Name="StatusID" Type="Byte" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

