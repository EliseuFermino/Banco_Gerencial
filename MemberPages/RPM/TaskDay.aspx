    <%@ Page Title="Tarefas de Hoje" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="TaskDay.aspx.vb" Inherits="MemberPages_RPM_TaskDay" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsGrid" AutoGenerateColumns="False" KeyFieldName="dayKey">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="dayKey" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="dayDia" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="dayDescricao" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="dayExecutada" VisibleIndex="4">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="dayDiaAte" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="idStatus" VisibleIndex="11" Caption="idStatus" Width="1px">
                    <DataItemTemplate>
                                            </DataItemTemplate>
                    <EditItemTemplate>
                        <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="dsStatus" TextField="descStatus" ValueField="idStatus" ValueType="System.Byte">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_Status" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="dayOrder" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idTipo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Duration" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idCatPersonal" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Status" FieldName="descStatus" VisibleIndex="6" Width="100px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsCommandButton>
                <EditButton Text="Alterar"/>
                <NewButton Text="Novo"/>
                <DeleteButton Text="Excluir"/>
                <CancelButton Text="Cancelar"/>
                <UpdateButton Text="Atualizar"/>
            </SettingsCommandButton>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" DeleteCommand="DELETE FROM [tblDia] WHERE [dayKey] = @dayKey" InsertCommand="INSERT INTO [Dados].[tblDia] ([dayDia], [dayDescricao], [dayExecutada], [dayDiaAte], [idStatus], [dayOrder], [idTipo], [Duration], [idCatPersonal]) VALUES (@dayDia, @dayDescricao, @dayExecutada, @dayDiaAte, @idStatus, @dayOrder, @idTipo, @Duration, @idCatPersonal)" SelectCommand="UspBuscarDadosRPM" UpdateCommand="UPDATE [Dados].[tblDia] SET [dayDia] = @dayDia, [dayDescricao] = @dayDescricao, [dayExecutada] = @dayExecutada, [dayDiaAte] = @dayDiaAte, [idStatus] = @idStatus, [dayOrder] = @dayOrder, [idTipo] = @idTipo, [Duration] = @Duration, [idCatPersonal] = @idCatPersonal WHERE [dayKey] = @dayKey" SelectCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="dayKey" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter DbType="Date" Name="dayDia" />
                <asp:Parameter Name="dayDescricao" Type="String" />
                <asp:Parameter Name="dayExecutada" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="dayDiaAte" />
                <asp:Parameter Name="idStatus" Type="Byte" />
                <asp:Parameter Name="dayOrder" Type="Byte" />
                <asp:Parameter Name="idTipo" Type="Byte" />
                <asp:Parameter Name="Duration" Type="String" />
                <asp:Parameter Name="idCatPersonal" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="dayDia" />
                <asp:Parameter Name="dayDescricao" Type="String" />
                <asp:Parameter Name="dayExecutada" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="dayDiaAte" />
                <asp:Parameter Name="idStatus" Type="Byte" />
                <asp:Parameter Name="dayOrder" Type="Byte" />
                <asp:Parameter Name="idTipo" Type="Byte" />
                <asp:Parameter Name="Duration" Type="String" />
                <asp:Parameter Name="idCatPersonal" Type="Byte" />
                <asp:Parameter Name="dayKey" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

