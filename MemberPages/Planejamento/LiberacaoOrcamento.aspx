<%@ Page Title="Liberação" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="LiberacaoOrcamento.aspx.vb" Inherits="MemberPages_Planejamento_LiberacaoOrcamento" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>                 
                                     
               <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" KeyFieldName="ID">
                   <Columns>
                       <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                       <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                       </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="idPrograma" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Programa" Width="50px">
                       </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="descPrograma" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Nome do Programa" Width="250px">
                           <CellStyle Wrap="False">
                           </CellStyle>
                       </dx:GridViewDataTextColumn>
                       <dx:GridViewDataCheckColumn FieldName="Libera_Loja" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Loja Liberada">
                       </dx:GridViewDataCheckColumn>
                       <dx:GridViewDataCheckColumn FieldName="Libera_Adm" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Adm Liberada">
                       </dx:GridViewDataCheckColumn>
                       <dx:GridViewDataCheckColumn FieldName="Libera_Coml" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Coml Liberado">
                       </dx:GridViewDataCheckColumn>
                       <dx:GridViewDataCheckColumn FieldName="Libera_Definitiva" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Definitico Liberado">
                       </dx:GridViewDataCheckColumn>
                       <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                           <EditFormSettings Visible="False" />
                       </dx:GridViewDataTextColumn>
                   </Columns>
                   <SettingsBehavior AllowFocusedRow="True" />
                   <SettingsPager Mode="ShowAllRecords">
                   </SettingsPager>
                   <Settings ShowFilterRow="True" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#E6E6E6">
                        </AlternatingRow>
                   </Styles>
                    <SettingsCommandButton>
                        <EditButton Text="Alterar"/>
                        <NewButton Text="Novo"/>
                        <DeleteButton Text="Excluir"/>
                        <CancelButton Text="Cancelar"/>
                        <UpdateButton Text="Salvar"/>
                    </SettingsCommandButton>
                    </dx:ASPxGridView>  
                      
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>" SelectCommand="SELECT [Ano], [idPrograma], [descPrograma], [Libera_Loja], [Libera_Adm], [Libera_Coml], [Libera_Definitiva], [ID] FROM [tblCadLiberaPrograma]" DeleteCommand="DELETE FROM [tblCadLiberaPrograma] WHERE (([Ano] = @Ano) OR ([Ano] IS NULL AND @Ano IS NULL)) AND (([idPrograma] = @idPrograma) OR ([idPrograma] IS NULL AND @idPrograma IS NULL))" InsertCommand="INSERT INTO [tblCadLiberaPrograma] ([Ano], [idPrograma], [descPrograma], [Libera_Loja], [Libera_Adm], [Libera_Coml], [Libera_Definitiva]) VALUES (@Ano, @idPrograma, @descPrograma, @Libera_Loja, @Libera_Adm, @Libera_Coml, @Libera_Definitiva)" UpdateCommand="UPDATE [tblCadLiberaPrograma] SET [descPrograma] = @descPrograma, [Libera_Loja] = @Libera_Loja, [Libera_Adm] = @Libera_Adm, [Libera_Coml] = @Libera_Coml, [Libera_Definitiva] = @Libera_Definitiva WHERE (([Ano] = @Ano) OR ([Ano] IS NULL AND @Ano IS NULL)) AND (([idPrograma] = @idPrograma) OR ([idPrograma] IS NULL AND @idPrograma IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="Ano" Type="Int16" />
                            <asp:Parameter Name="idPrograma" Type="Byte" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Ano" Type="Int16" />
                            <asp:Parameter Name="idPrograma" Type="Byte" />
                            <asp:Parameter Name="descPrograma" Type="String" />
                            <asp:Parameter Name="Libera_Loja" Type="Boolean" />
                            <asp:Parameter Name="Libera_Adm" Type="Boolean" />
                            <asp:Parameter Name="Libera_Coml" Type="Boolean" />
                            <asp:Parameter Name="Libera_Definitiva" Type="Boolean" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="descPrograma" Type="String" />
                            <asp:Parameter Name="Libera_Loja" Type="Boolean" />
                            <asp:Parameter Name="Libera_Adm" Type="Boolean" />
                            <asp:Parameter Name="Libera_Coml" Type="Boolean" />
                            <asp:Parameter Name="Libera_Definitiva" Type="Boolean" />
                            <asp:Parameter Name="ID" Type="Int16" />
                            <asp:Parameter Name="Ano" Type="Int16" />
                            <asp:Parameter Name="idPrograma" Type="Byte" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


