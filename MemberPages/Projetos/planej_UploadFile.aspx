<%@ Page Title="Importar arquivo para projeto" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="planej_UploadFile.aspx.vb" Inherits="MemberPages_planejUploadArquivo" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
    <script language ="javascript" type ="text/javascript">
       function OnGridFocusedRowChanged() {
           grid.GetRowValues(grid.GetFocusedRowIndex(), 'idFile;NomeArquivo;linkFile;ArquivoComExtensao', OnGetRowValues);
       }

       function OnGetRowValues(values) {
           txtNum.SetText(values[0]);
           txtFile.SetText(values[3]);
       }
    </script>

    
    <style type="text/css">
        
.dxeButtonEdit_Office2003_Blue
{
    background-color: white;
    border: solid 1px #6a8ccb;
    width: 170px;
}

.dxeEditArea_Office2003_Blue 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: solid 1px #6a8ccb;
}
.dxeButtonEditButton_Office2003_Blue
{
	background: #d7e8fd url('../App_Themes/Office2003%20Blue/Editors/edtButtonBack.gif') repeat-x center bottom;
    padding-bottom: 4px;
    padding-top: 2px;
            padding-left: 1px;
            padding-right: 1px;
        }
.dxeButtonEditButton_Office2003_Blue, .dxeCalendarButton_Office2003_Blue,
.dxeSpinIncButton_Office2003_Blue, .dxeSpinDecButton_Office2003_Blue,
.dxeSpinLargeIncButton_Office2003_Blue, .dxeSpinLargeDecButton_Office2003_Blue
{
	vertical-align: middle;
	border: solid 1px #6a8ccb;
	cursor: pointer;
	cursor: hand;
} 
        .style9
        {
            font-weight: bold;
            color: #FFFFFF;
        }
        .style5
    {
        width: 607px;
    }
        .style7
        {
            width: 553px;
        }
        .style10
        {
            width: 310px;
        }
        .style11
        {
            width: 456px;
        }
        .style12
        {
            width: 275px;
        }
        .style13
        {
            height: 23px;
        }
        .style14
        {
            width: 275px;
            color: #FFFFFF;
            font-weight: bold;
        }
        .style15
        {
            font-weight: bold;
            color: #FFFF00;
        }
        .auto-style1 {
        color: #333333;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellspacing="1" class="style1">
            <tr>
                <td align="center" valign="top" class="style11">
                    <asp:Panel ID="Panel1" runat="server" BorderColor="#D2E9FF" BorderStyle="Solid" 
        BorderWidth="1px" Height="350px" Width="400px">
        <p>
            <table cellspacing="1" class="style1">
                <tr>
                    <td class="style9" align="center" bgcolor="#999966" colspan="2">
                        Adicionar Arquivos ao Projeto</td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;<span class="auto-style1">Projeto:</span>
                    </td>
                    <td>
                        <dxe:ASPxComboBox ID="cboProjeto" runat="server" AutoPostBack="True" 
                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue" DataSourceID="dsListaProjeto" 
                            ImageFolder="~/App_Themes/Office2003 Blue/{0}/" TextField="ProjetoDesc" 
                            ValueField="ProjetoID" ValueType="System.String" Width="250px">
                            <ButtonStyle Width="13px">
                            </ButtonStyle>
                        </dxe:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <table cellspacing="1" class="style1">
                <tr>
                    <td>
                        <span class="style2">&nbsp;Selecione o arquivo que será enviado para o Projeto:&nbsp;&nbsp;
                        </span>
                        <asp:FileUpload ID="MyFile" runat="server" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <table cellspacing="1" class="style1">
                <tr>
                    <td class="style5">
                        <b><span class="style3">&nbsp;Nome amigável do arquivo:</span>&nbsp;&nbsp; </b>
                        <asp:TextBox ID="txtNomeArquivoAmigavel" runat="server" Width="350px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <table cellspacing="1" class="style1">
                <tr>
                    <td class="style7">
                        <span class="style2">&nbsp;Nome do usuário do arquivo&nbsp;&nbsp;
                        <asp:TextBox ID="txtNomeUsuario" runat="server" Width="200px"></asp:TextBox>
                        </span>
                    </td>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="left" class="style13">
                        <dxe:ASPxCheckBox ID="ASPxCheckBox1" runat="server" 
                            Text="Enviar o arquivo para todos os coordenadores de projeto." 
                            ForeColor="#333333">
                        </dxe:ASPxCheckBox>
                    </td>
                    <td class="style13">
                        </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSubmit_Manutencao" runat="server" Text="Postar arquivo" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </p>
        <p>
            <table cellspacing="1" class="style1">
                <tr>
                    <td class="style15">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style6" colspan="3">
                        <asp:Label ID="lbl" runat="server" ForeColor="White" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="dsListaProjeto" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                    
                SelectCommand="SELECT [ProjetoDesc], [ProjetoID] FROM [projProjeto]">
            </asp:SqlDataSource>
        </p>
    </asp:Panel>
                </td>
                <td align="center" valign="top" class="style10">
                    <asp:Panel ID="panelDelete" runat="server" BorderColor="#D2E9FF" 
                        BorderStyle="Solid" BorderWidth="1px" Height="350px" Width="570px">
                        <table cellspacing="1" class="style1" 
    style="width: 88%; margin-left: 0px;">
                            <tr>
                                <td bgcolor="#4B5C91" class="style12">
                                    <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientInstanceName="txtNum" 
                                    Width="10px" BackColor="#4B5C91" ForeColor="#4B5C91" ReadOnly="True">
                                        <Border BorderColor="#4B5C91" BorderStyle="Solid" BorderWidth="1px" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td bgcolor="#4B5C91" class="style14">
                                    Exclusão de Arquivos</td>
                                <td bgcolor="#4B5C91" class="style12">
                                    <dxe:ASPxTextBox ID="ASPxTextBox2" runat="server" BackColor="#4B5C91" 
                                        ClientInstanceName="txtFile" ForeColor="#4B5C91" Width="10px" 
                                        ReadOnly="True">
                                        <Border BorderColor="#4B5C91" BorderStyle="Dashed" BorderWidth="1px" />
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <dxwgv:ASPxGridView ID="gridView" runat="server" AutoGenerateColumns="False" 
                            ClientInstanceName="grid" DataSourceID="SqlDataSource1" 
                            KeyFieldName="idFile" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue" Width="570px" Theme="DevEx">
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                CssPostfix="Office2003_Blue">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
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
                            <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged()
}" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFile" ReadOnly="True" 
                                    VisibleIndex="0" Width="30px">
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="NomeArquivo" ToolTip="Nome do arquivo" 
                                    VisibleIndex="1" Width="250px" SortIndex="0" SortOrder="Ascending">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Nome" 
                                    ToolTip="Nome do colaborador que postou ou ira usar o arquivo" VisibleIndex="2" 
                                    Width="100px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Dia" FieldName="Data" 
                                    ToolTip="Dia em que o arquivo foi carregado para o Projeto." VisibleIndex="3" 
                                    Width="100px">
                                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="linkFile" Visible="False" 
                                    VisibleIndex="4">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Hora" VisibleIndex="4">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="ArquivoComExtensao" VisibleIndex="5" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="270" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dxwgv:ASPxGridView>
                        <table cellspacing="1" class="style1">
                            <tr>
                                <td align="center">
                                    <dxe:ASPxButton ID="btnExport" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        Text="Exportar para Excel" Width="150px">
                                    </dxe:ASPxButton>
                                </td>
                                <td align="center">
                                    <dxe:ASPxButton ID="btnDelete" runat="server" 
                                        CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine" 
                                        Text="Excluir Arquivos do Projeto" Width="200px">
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <dxwgv:ASPxGridViewExporter ID="Exporter1" runat="server" GridViewID="gridView">
                        </dxwgv:ASPxGridViewExporter>
                        &nbsp;
                        <br />
                        <br />
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                        
                        
                        
                        SelectCommand="SELECT idFile, NomeArquivo, Nome, ProjetoID, dataUpload AS Data, horaUpload  AS Hora, linkFile, ArquivoComExtensao FROM projArquivos WHERE (ProjetoID = @ProjetoID OR ProjetoID=999)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cboProjeto" Name="ProjetoID" 
                                PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
                <td class="style10">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

