<%@ Page Title="Cadastro de Funcionários" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="CadastroEquipe.aspx.vb" Inherits="MemberPages_Inventario_Programa_CadastroEquipe" %>

<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="auto-style1">
        <tr>
            <td>
                <table cellspacing="1" class="auto-style2">
                    <tr>
                        <td style="height: 279px">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnSalvar" />
                                </Triggers>
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                                        BorderWidth="1px" Height="264px" Width="400px">
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td class="auto-style6" colspan="4" style="text-align: center" 
                                                    bgcolor="#18508A">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" ForeColor="White" 
                                                        style="font-weight: 700; font-size: large;" Text="Cadastro de Equipe"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6" style="width: 95px">Nº Equipe:</td>
                                                <td>
                                                    <asp:TextBox ID="txtNumEquipe" runat="server" Width="50px"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="txtNumEquipe" ErrorMessage="Informe o nº da Equipe" 
                                                        ForeColor="Red">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6" style="width: 105px">Membro 1:</td>
                                                <td colspan="2">
                                                    <dx:ASPxComboBox ID="cboMembro1" runat="server" DataSourceID="dsMembros" 
                                                        TextField="Nome" ValueField="Matricula" CallbackPageSize="50" DropDownRows="15" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" Width="300px">
                                                    </dx:ASPxComboBox>
                                                    <asp:SqlDataSource ID="dsMembros" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
                                                        SelectCommand="Programa.uspListaColaboradores" 
                                                        SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="cboMembro1" ErrorMessage="Selecione um membro" 
                                                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="width: 105px">Membro 2:</td>
                                                <td class="auto-style7" colspan="3">
                                                    <dx:ASPxComboBox ID="cboMembro2" runat="server" DataSourceID="dsMembros" 
                                                        TextField="Nome" ValueField="Matricula" CallbackPageSize="50" DropDownRows="15" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" Width="300px">
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="width: 105px">Membro 3:</td>
                                                <td class="auto-style7" colspan="3">
                                                    <dx:ASPxComboBox ID="cboMembro3" runat="server" DataSourceID="dsMembros" 
                                                        TextField="Nome" ValueField="Matricula" CallbackPageSize="50" DropDownRows="15" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains"  Width="300px">
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <%--<td class="auto-style7" style="width: 95px">Setor</td>--%>
                                                <td class="auto-style7" colspan="3">
                                                    <dx:ASPxComboBox ID="cboSetor" runat="server" DataSourceID="dsSetor" 
                                                        TextField="SetorDesc" ValueField="idSetor" Width="120px" Visible="False">
                                                    </dx:ASPxComboBox>
                                                    <asp:SqlDataSource ID="dsSetor" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
                                                        SelectCommand="Programa.uspListaSetor" SelectCommandType="StoredProcedure">
                                                    </asp:SqlDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="width: 95px">&nbsp;</td>
                                                <td class="auto-style7" colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="auto-style7" colspan="4">
                                                    <uc1:wucBotaoAtualizar ID="btnSalvar" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>

                    <tr>
                        <td>

                        </td>
                    </tr>

                    <tr>
                        <td>

                            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="CodEquipe">
                                <Columns>
                                    <asp:BoundField DataField="CodEquipe" HeaderText="Último nº de equipe" ReadOnly="True" SortExpression="CodEquipe">
                                    <ItemStyle Font-Size="Large" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" SelectCommand="SELECT [CodEquipe] FROM [Programa].[vUltimoNumEquipe]"></asp:SqlDataSource>

                            <br />
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" Width="450px">
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0" Width="10px" ShowClearFilterButton="True"/>
                                    <dx:GridViewDataTextColumn Caption="Equipe" FieldName="CodEquipe" VisibleIndex="1" Width="40px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Matricula" VisibleIndex="2" Width="50px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome do Funcionário" FieldName="nomeFunc" VisibleIndex="3" Width="150px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowFilterRow="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="100" VerticalScrollBarMode="Visible" />
                                <SettingsText EmptyDataRow="Nenhuma equipe cadastrada ainda." Title="Lista de Colaboradores por Equipe" />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" SelectCommand="SELECT * FROM [Programa].[vListaFuncionario]"></asp:SqlDataSource>

                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

