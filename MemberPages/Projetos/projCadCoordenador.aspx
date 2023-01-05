<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="projCadCoordenador.aspx.vb" Inherits="Ranking_projCadCoordenador" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    KeyFieldName="CoordenadorID" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" Theme="DevEx">
                    <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="AliceBlue">
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
                    <SettingsText ConfirmDelete="Gostaria realmente de excluir esse coordenador?" 
                        Title="Cadastro de Coordenador" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="Opções" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                        <dxwgv:GridViewDataTextColumn FieldName="CoordenadorID" ReadOnly="True" 
                            VisibleIndex="1" Caption="Nº">
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CoordenadorDesc" VisibleIndex="2" 
                            Caption="Nome do Coordenador">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CoordenadorDepto" VisibleIndex="3" 
                            Caption="Departamento">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsCommandButton>
                        <EditButton>
                            <Image Url="~/image/note-edit-icon_16.png"/>
                        </EditButton>
                        <NewButton>
                            <Image Url="~/image/note-add-icon_16.png"/>
                        </NewButton>
                        <DeleteButton>
                            <Image Url="~/image/note-remove-icon_16.png"/>
                        </DeleteButton>
                        <CancelButton>
                            <Image Url="~/image/undo-icon_24.png"/>
                        </CancelButton>
                        <UpdateButton>
                            <Image Url="~/image/note-accept-icon_24.png"/>
                        </UpdateButton>
                    </SettingsCommandButton>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    DeleteCommand="DELETE FROM [projCadCoordenador] WHERE [CoordenadorID] = @CoordenadorID" 
                    InsertCommand="INSERT INTO [projCadCoordenador] ([CoordenadorDesc], [CoordenadorDepto]) VALUES (@CoordenadorDesc, @CoordenadorDepto)" 
                    ProviderName="<%$ ConnectionStrings:gerContConn2008.ProviderName %>" 
                    SelectCommand="SELECT [CoordenadorID], [CoordenadorDesc], [CoordenadorDepto] FROM [projCadCoordenador]" 
                    UpdateCommand="UPDATE [projCadCoordenador] SET [CoordenadorDesc] = @CoordenadorDesc, [CoordenadorDepto] = @CoordenadorDepto WHERE [CoordenadorID] = @CoordenadorID">
                    <DeleteParameters>
                        <asp:Parameter Name="CoordenadorID" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CoordenadorDesc" Type="String" />
                        <asp:Parameter Name="CoordenadorDepto" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CoordenadorDesc" Type="String" />
                        <asp:Parameter Name="CoordenadorDepto" Type="String" />
                        <asp:Parameter Name="CoordenadorID" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

