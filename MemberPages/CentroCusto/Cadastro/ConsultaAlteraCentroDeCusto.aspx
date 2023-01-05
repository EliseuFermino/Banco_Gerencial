<%@ Page Title="Consulta / Altera Centro de Custo" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConsultaAlteraCentroDeCusto.aspx.vb" Inherits="MemberPages_CentroCusto_Cadastro_ConsultaAlteraCentroDeCusto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divDados" style="margin-left:2px; ">
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="idCentroCusto" Width="98%">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="idCentroCusto" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CENTRODECUSTO" VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCentroCusto" VisibleIndex="3" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCentroCustoRes" VisibleIndex="4" Width="200px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ativo" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idSecao" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Grau" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idDepto" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="idNivelRateio" VisibleIndex="10" Caption="Nivel Rateio">
                    <PropertiesComboBox DataSourceID="dsNivelRateio" TextField="descNivelRateio" ValueField="idNivelRateio">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn VisibleIndex="12" FieldName="idEspecie" Caption="Especie">
                    <PropertiesComboBox DataSourceID="dsEspecie" TextField="descEspecie" ValueField="idEspecie">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="idTipoCentroCusto" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="SqlDataSource2" TextField="descTipoCentroCusto" ValueField="idTipoCentroCusto">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="Inline" />
            <Settings ShowFilterRow="True" VerticalScrollableHeight="465" VerticalScrollBarMode="Visible" />
            <Styles>
                <AlternatingRow BackColor="#F0F0F0">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF">
                </FocusedRow>
            </Styles>
            <SettingsCommandButton>
                <EditButton Text="Alterar"/>
                <NewButton Text="Novo"/>
                <DeleteButton Text="Excluir"/>
                <CancelButton Text="Cancelar"/>
                <UpdateButton Text="Atualizar"/>
                <ClearFilterButton Text="Limpar"/>
            </SettingsCommandButton>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="SELECT [idCentroCusto], [CENTRODECUSTO], [descCentroCusto], [descCentroCustoRes], [idEspecie], [idTipoCentroCusto], [Ativo], [idSecao], [Grau], [idDepto], [idNivelRateio] FROM [Cadastros].[tblCentroCusto]" DeleteCommand="DELETE FROM [Cadastros].[tblCentroCusto] WHERE [idCentroCusto] = @idCentroCusto" InsertCommand="INSERT INTO [Cadastros].[tblCentroCusto] ([idCentroCusto], [CENTRODECUSTO], [descCentroCusto], [descCentroCustoRes], [idEspecie], [idTipoCentroCusto], [Ativo], [idSecao], [Grau], [idDepto], [idNivelRateio]) VALUES (@idCentroCusto, @CENTRODECUSTO, @descCentroCusto, @descCentroCustoRes, @idEspecie, @idTipoCentroCusto, @Ativo, @idSecao, @Grau, @idDepto, @idNivelRateio)" UpdateCommand="UPDATE [Cadastros].[tblCentroCusto] SET [CENTRODECUSTO] = @CENTRODECUSTO, [descCentroCusto] = @descCentroCusto, [descCentroCustoRes] = @descCentroCustoRes, [idEspecie] = @idEspecie, [idTipoCentroCusto] = @idTipoCentroCusto, [Ativo] = @Ativo, [idSecao] = @idSecao, [Grau] = @Grau, [idDepto] = @idDepto, [idNivelRateio] = @idNivelRateio WHERE [idCentroCusto] = @idCentroCusto">
            <DeleteParameters>
                <asp:Parameter Name="idCentroCusto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idCentroCusto" Type="Int32" />
                <asp:Parameter Name="CENTRODECUSTO" Type="String" />
                <asp:Parameter Name="descCentroCusto" Type="String" />
                <asp:Parameter Name="descCentroCustoRes" Type="String" />
                <asp:Parameter Name="idEspecie" Type="Byte" />
                <asp:Parameter Name="idTipoCentroCusto" Type="Byte" />
                <asp:Parameter Name="Ativo" Type="Byte" />
                <asp:Parameter Name="idSecao" Type="Int16" />
                <asp:Parameter Name="Grau" Type="Byte" />
                <asp:Parameter Name="idDepto" Type="Byte" />
                <asp:Parameter Name="idNivelRateio" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CENTRODECUSTO" Type="String" />
                <asp:Parameter Name="descCentroCusto" Type="String" />
                <asp:Parameter Name="descCentroCustoRes" Type="String" />
                <asp:Parameter Name="idEspecie" Type="Byte" />
                <asp:Parameter Name="idTipoCentroCusto" Type="Byte" />
                <asp:Parameter Name="Ativo" Type="Byte" />
                <asp:Parameter Name="idSecao" Type="Int16" />
                <asp:Parameter Name="Grau" Type="Byte" />
                <asp:Parameter Name="idDepto" Type="Byte" />
                <asp:Parameter Name="idNivelRateio" Type="Byte" />
                <asp:Parameter Name="idCentroCusto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="SELECT [idTipoCentroCusto], [descTipoCentroCusto] FROM [Cadastros].[tblCentroCusto_Tipo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsNivelRateio" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="Cadastros.uspLista_CentroCusto_NivelRateio" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsEspecie" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="Cadastros.uspLista_CentroCusto_Especie" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerDespesas" Anotacao2="Tabela: Cadastros.tblCentroCusto" />

</asp:Content>

