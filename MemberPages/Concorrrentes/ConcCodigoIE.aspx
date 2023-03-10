<%@ Page Title="Código da Inscrição Estadual" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConcCodigoIE.aspx.vb" Inherits="MemberPages_ConcCodigoIE" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxdv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
        
                    SelectCommand="SELECT [IE], [idConcorrente], [CNPJ_Principal], [CNPJ_Filial], [Ativo], [Encerrada] FROM [tblEstab_Filiais]" 
                    DeleteCommand="DELETE FROM [tblEstab_Filiais] WHERE [IE] = @IE" 
                    InsertCommand="INSERT INTO [tblEstab_Filiais] ([IE], [idConcorrente], [CNPJ_Principal], [CNPJ_Filial], [Ativo], [Encerrada]) VALUES (@IE, @idConcorrente, @CNPJ_Principal, @CNPJ_Filial, @Ativo, @Encerrada)" 
                    
                    
                    UpdateCommand="UPDATE [tblEstab_Filiais] SET [idConcorrente] = @idConcorrente, [CNPJ_Principal] = @CNPJ_Principal, [CNPJ_Filial] = @CNPJ_Filial, [Ativo] = @Ativo, [Encerrada] = @Encerrada WHERE [IE] = @IE">
    <DeleteParameters>
        <asp:Parameter Name="IE" Type="Double" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="idConcorrente" Type="Int16" />
        <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
        <asp:Parameter Name="CNPJ_Filial" Type="Int32" />
        <asp:Parameter Name="Ativo" Type="Boolean" />
        <asp:Parameter Name="Encerrada" Type="Boolean" />
        <asp:Parameter Name="IE" Type="Double" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="IE" Type="Double" />
        <asp:Parameter Name="idConcorrente" Type="Int16" />
        <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
        <asp:Parameter Name="CNPJ_Filial" Type="Int32" />
        <asp:Parameter Name="Ativo" Type="Boolean" />
        <asp:Parameter Name="Encerrada" Type="Boolean" />
    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    DeleteCommand="DELETE FROM [tblEstab_Filiais] WHERE [IE] = @IE" 
                    InsertCommand="INSERT INTO [tblEstab_Filiais] ([IE], [CEP], [CNPJ_Principal], [CNPJ_Filial], [TipoCod], [cidregCod], [Obs], [Ativo], [idLoja], [Encerrada], [Num], [CNPJ], [idConcorrente], [Telefone], [Endereço]) VALUES (@IE, @CEP, @CNPJ_Principal, @CNPJ_Filial, @TipoCod, @cidregCod, @Obs, @Ativo, @idLoja, @Encerrada, @Num, @CNPJ, @idConcorrente, @Telefone, @Endereço)" 
                    SelectCommand="SELECT [IE], [CEP], [CNPJ_Principal], [CNPJ_Filial], [TipoCod], [cidregCod], [Obs], [Ativo], [idLoja], [Encerrada], [Num], [CNPJ], [idConcorrente], [Telefone], [Endereço] FROM [tblEstab_Filiais] WHERE ([IE] = @IE)" 
                    UpdateCommand="UPDATE [tblEstab_Filiais] SET [CEP] = @CEP, [CNPJ_Principal] = @CNPJ_Principal, [CNPJ_Filial] = @CNPJ_Filial, [TipoCod] = @TipoCod, [cidregCod] = @cidregCod, [Obs] = @Obs, [Ativo] = @Ativo, [idLoja] = @idLoja, [Encerrada] = @Encerrada, [Num] = @Num, [CNPJ] = @CNPJ, [idConcorrente] = @idConcorrente, [Telefone] = @Telefone, [Endereço] = @Endereço WHERE [IE] = @IE">
                    <SelectParameters>
                        <asp:SessionParameter Name="IE" SessionField="CodIE" Type="Double" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="IE" Type="Double" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CEP" Type="Int32" />
                        <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
                        <asp:Parameter Name="CNPJ_Filial" Type="Int32" />
                        <asp:Parameter Name="TipoCod" Type="Int16" />
                        <asp:Parameter Name="cidregCod" Type="Int16" />
                        <asp:Parameter Name="Obs" Type="String" />
                        <asp:Parameter Name="Ativo" Type="Boolean" />
                        <asp:Parameter Name="idLoja" Type="Int16" />
                        <asp:Parameter Name="Encerrada" Type="Boolean" />
                        <asp:Parameter Name="Num" Type="Int16" />
                        <asp:Parameter Name="CNPJ" Type="Double" />
                        <asp:Parameter Name="idConcorrente" Type="Int16" />
                        <asp:Parameter Name="Telefone" Type="String" />
                        <asp:Parameter Name="Endereço" Type="String" />
                        <asp:Parameter Name="IE" Type="Double" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IE" Type="Double" />
                        <asp:Parameter Name="CEP" Type="Int32" />
                        <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
                        <asp:Parameter Name="CNPJ_Filial" Type="Int32" />
                        <asp:Parameter Name="TipoCod" Type="Int16" />
                        <asp:Parameter Name="cidregCod" Type="Int16" />
                        <asp:Parameter Name="Obs" Type="String" />
                        <asp:Parameter Name="Ativo" Type="Boolean" />
                        <asp:Parameter Name="idLoja" Type="Int16" />
                        <asp:Parameter Name="Encerrada" Type="Boolean" />
                        <asp:Parameter Name="Num" Type="Int16" />
                        <asp:Parameter Name="CNPJ" Type="Double" />
                        <asp:Parameter Name="idConcorrente" Type="Int16" />
                        <asp:Parameter Name="Telefone" Type="String" />
                        <asp:Parameter Name="Endereço" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    KeyFieldName="IE" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" Theme="DevEx">
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                                AutoGenerateColumns="False" 
                                
                                DataSourceID="SqlDataSource2" KeyFieldName="IE" 
                                onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect">
                                
                                
                                <SettingsEditing Mode="PopupEditForm" PopupEditFormAllowResize="True" 
                                    PopupEditFormHeight="400px" PopupEditFormModal="True" 
                                    PopupEditFormWidth="800px" />
                                <Columns>
                                    <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True"/>
                                    <dxwgv:GridViewDataTextColumn FieldName="IE" ReadOnly="False" VisibleIndex="1">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CEP" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Filial" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="TipoCod" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="cidregCod" VisibleIndex="6">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Obs" VisibleIndex="7">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataCheckColumn FieldName="Ativo" VisibleIndex="8">
                                    </dxwgv:GridViewDataCheckColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="idLoja" VisibleIndex="9">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataCheckColumn FieldName="Encerrada" VisibleIndex="10">
                                    </dxwgv:GridViewDataCheckColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Num" VisibleIndex="11">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CNPJ" VisibleIndex="12">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="idConcorrente" VisibleIndex="13">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Telefone" VisibleIndex="14">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Endereço" VisibleIndex="15">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <SettingsDetail IsDetailGrid="True" />
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    
                    <SettingsLoadingPanel Text="" />
                    <SettingsPager>
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                   
                    <SettingsText Title="Cadastro de Inscrições Estaduais" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowNewButton="True"/>
                        <dxwgv:GridViewDataTextColumn FieldName="IE" ReadOnly="False" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idConcorrente" VisibleIndex="2">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="3">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Filial" VisibleIndex="4">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataCheckColumn FieldName="Ativo" VisibleIndex="5">
                        </dxwgv:GridViewDataCheckColumn>
                        <dxwgv:GridViewDataCheckColumn FieldName="Encerrada" VisibleIndex="6">
                        </dxwgv:GridViewDataCheckColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsDetail ShowDetailRow="True" />
                   
                </dxwgv:ASPxGridView>
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView3" runat="server" 
                    AutoGenerateColumns="False" 
                     DataSourceID="dsCidade" KeyFieldName="cidregCod" Theme="DevEx">
                                      
                    <SettingsText Title="Cadastro de Cidades" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                        <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="cidregCod" 
                            ReadOnly="True" VisibleIndex="1" Width="60px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Nome da Cidade" FieldName="cidregDesc" 
                            VisibleIndex="2" Width="200px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Estado" FieldName="estadoCod" 
                            VisibleIndex="3" Width="60px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataCheckColumn Caption="Cod Condor" FieldName="cidregCondor" 
                            VisibleIndex="4" Width="80px">
                        </dxwgv:GridViewDataCheckColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Populacao" VisibleIndex="5">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="RendMedio" VisibleIndex="6">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="RendMediano" VisibleIndex="7">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CodCidadeIBGE" VisibleIndex="8">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="dsCidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    DeleteCommand="DELETE FROM [tblCidadeRegiao] WHERE [cidregCod] = @cidregCod" 
                    InsertCommand="INSERT INTO [tblCidadeRegiao] ([cidregCod], [cidregDesc], [estadoCod], [cidregCondor], [Populacao], [RendMedio], [RendMediano], [CodCidadeIBGE]) VALUES (@cidregCod, @cidregDesc, @estadoCod, @cidregCondor, @Populacao, @RendMedio, @RendMediano, @CodCidadeIBGE)" 
                    SelectCommand="SELECT [cidregCod], [cidregDesc], [estadoCod], [cidregCondor], [Populacao], [RendMedio], [RendMediano], [CodCidadeIBGE] FROM [tblCidadeRegiao] ORDER BY [cidregDesc]" 
                    UpdateCommand="UPDATE [tblCidadeRegiao] SET [cidregDesc] = @cidregDesc, [estadoCod] = @estadoCod, [cidregCondor] = @cidregCondor, [Populacao] = @Populacao, [RendMedio] = @RendMedio, [RendMediano] = @RendMediano, [CodCidadeIBGE] = @CodCidadeIBGE WHERE [cidregCod] = @cidregCod">
                    <DeleteParameters>
                        <asp:Parameter Name="cidregCod" Type="Int16" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="cidregDesc" Type="String" />
                        <asp:Parameter Name="estadoCod" Type="Int16" />
                        <asp:Parameter Name="cidregCondor" Type="Boolean" />
                        <asp:Parameter Name="Populacao" Type="Single" />
                        <asp:Parameter Name="RendMedio" Type="Single" />
                        <asp:Parameter Name="RendMediano" Type="Single" />
                        <asp:Parameter Name="CodCidadeIBGE" Type="Int32" />
                        <asp:Parameter Name="cidregCod" Type="Int16" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="cidregCod" Type="Int16" />
                        <asp:Parameter Name="cidregDesc" Type="String" />
                        <asp:Parameter Name="estadoCod" Type="Int16" />
                        <asp:Parameter Name="cidregCondor" Type="Boolean" />
                        <asp:Parameter Name="Populacao" Type="Single" />
                        <asp:Parameter Name="RendMedio" Type="Single" />
                        <asp:Parameter Name="RendMediano" Type="Single" />
                        <asp:Parameter Name="CodCidadeIBGE" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

