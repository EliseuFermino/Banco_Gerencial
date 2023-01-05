<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucMargemNegativaFilial.ascx.vb" Inherits="Controles_MargemNegativaFilial" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>









<style type ="text/css" >

    #divWUC_Filial {
        clear: both ;
        float: left;
        margin-left: 2px;
        margin-top: 10px;
    }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }


    #divWUC_dados {
        clear: both;
        float :left ;
        margin-left: 2px;
        margin-top: 1px;
    }

    #divQuadro1 {
        
        float :left ;
        margin-left: 2px;
        margin-top: 1px;
    }

    #divQuadro2 {
        
        float :left ;
        margin-left: 10px;
        margin-top: 1px;
    }

</style>

<div id="divWUC_Filial">
    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
</div>



    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


<div id="divWUC_dados">

    <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
    <PanelCollection>
        <dx:PanelContent>

    <div id="divQuadro1">
        <dx:ASPxGridView ID="grid1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados1" KeyFieldName="idProduto" Width="500px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: {0:n0}" FieldName="idProduto" ShowInColumn="nomeProduto" SummaryType="Count" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" FixedStyle="Left" VisibleIndex="1" Width="70px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" VisibleIndex="3" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" VisibleIndex="5" Width="55px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Venda (R$)" FieldName="vlrVenda" VisibleIndex="4" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ToolTip="% da Margem Comercial" VisibleIndex="6" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" FixedStyle="Left" VisibleIndex="2" Width="150px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" VisibleIndex="7" Width="150px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="185" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#E4E4E4">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDados1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_VendasConnectionString %>" SelectCommand="uspMargemNegativa" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="divQuadro2">
        <dx:ASPxGridView ID="grid2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados2" KeyFieldName="idProduto" Width="420px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: {0:n0}" FieldName="idProduto" ShowInColumn="nomeProduto" SummaryType="Count" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
            </TotalSummary>
            <Columns>

                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" VisibleIndex="3" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" VisibleIndex="5" Width="55px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Venda (R$)" FieldName="vlrVenda" VisibleIndex="4" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ToolTip="% da Margem Comercial" VisibleIndex="6" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descrição da Filial" FieldName="nomeFilialLista" VisibleIndex="2" Width="150px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="208" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#E4E4E4">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDados2" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_VendasConnectionString %>" SelectCommand="uspMargemNegativaResumoLojas" SelectCommandType="StoredProcedure">

        </asp:SqlDataSource>
    </div>


            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>


</div>