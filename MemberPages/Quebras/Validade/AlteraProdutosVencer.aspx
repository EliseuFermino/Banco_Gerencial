<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AlteraProdutosVencer.aspx.vb" Inherits="MemberPages_Quebras_Validade_AlteraProdutosVencer" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>




<%@ Register Src="~/Controles/wucListaLojas.ascx" TagPrefix="uc1" TagName="wucListaLojas" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../../css/bootstrap.css" rel="stylesheet" />
    <link href="../../../css/bootstrap-theme.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <uc1:wucListaLojas runat="server" ID="cboFilial" />
            </div>

            <div class="col-md-3">
                <uc1:wucListaDia runat="server" ID="cboDia" />
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="ID">
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="Manutenção" ShowEditButton="True" ShowDeleteButton="True">
                            <CellStyle Font-Bold="True" ForeColor="#666666">
                            </CellStyle>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" VisibleIndex="1" Caption="Filial">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Dia" ReadOnly="True" VisibleIndex="2" Caption="Dia da &lt;br&gt; Digitação">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="dataVencimento" ReadOnly="True" VisibleIndex="3" Caption="Dia de &lt;br&gt; Vencimento">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Setor" ReadOnly="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="numCorredor" ReadOnly="True" VisibleIndex="5" Caption="Nº &lt;br&gt; Corredor">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="EAN" ReadOnly="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrPrecoVenda" VisibleIndex="8" Caption="Preço &lt;br&gt; Venda" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True" ForeColor="Blue">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Quantidade" VisibleIndex="7" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>                        
                 
                    </Columns>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="400" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#E4E4E4">
                        </AlternatingRow>
                    </Styles>
                    <SettingsCommandButton>
                        <EditButton Text="Alterar"/>
                        <DeleteButton Text="Excluir"/>
                        <CancelButton Text="Cancelar"/>
                        <UpdateButton Text="Atualizar"/>
                    </SettingsCommandButton>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" DeleteCommand="DELETE FROM [Validade].[tblValidadeProdutos] WHERE [idFilial] = @idFilial AND [Dia] = @Dia AND [dataVencimento] = @dataVencimento AND [Setor] = @Setor AND [numCorredor] = @numCorredor AND [EAN] = @EAN"  SelectCommand="SELECT * FROM [Validade].[tblValidadeProdutos] WHERE (([dataVencimento] = @dataVencimento) AND ([idFilial] = @idFilial))" UpdateCommand="UPDATE [Validade].[tblValidadeProdutos] SET [vlrPrecoVenda] = @vlrPrecoVenda, [Quantidade] = @Quantidade, [Usuario] = @Usuario, [Hora] = @Hora WHERE [idFilial] = @idFilial AND [Dia] = @Dia AND [dataVencimento] = @dataVencimento AND [Setor] = @Setor AND [numCorredor] = @numCorredor AND [EAN] = @EAN">
                    <DeleteParameters>
                        <asp:Parameter Name="idFilial" Type="Byte" />
                        <asp:Parameter DbType="Date" Name="Dia" />
                        <asp:Parameter DbType="Date" Name="dataVencimento" />
                        <asp:Parameter Name="Setor" Type="Int16" />
                        <asp:Parameter Name="numCorredor" Type="Int16" />
                        <asp:Parameter Name="EAN" Type="Int64" />
                    </DeleteParameters>
                    
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="dataVencimento" SessionField="sDIA" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="vlrPrecoVenda" Type="Decimal" />
                        <asp:Parameter Name="Quantidade" Type="Decimal" />                        
                        <asp:Parameter Name="Usuario" Type="String" />
                        <asp:Parameter Name="Hora" Type="String" />
                        <asp:Parameter Name="idFilial" Type="Byte" />
                        <asp:Parameter DbType="Date" Name="Dia" />
                        <asp:Parameter DbType="Date" Name="dataVencimento" />
                        <asp:Parameter Name="Setor" Type="Int16" />
                        <asp:Parameter Name="numCorredor" Type="Int16" />
                        <asp:Parameter Name="EAN" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div> 

</asp:Content>

