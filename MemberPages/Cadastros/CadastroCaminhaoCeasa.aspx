<%@ Page Title="Cadastro Chegada Caminhão Ceasa" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroCaminhaoCeasa.aspx.vb" Inherits="MemberPages_Quebras_Validade_CadastroValidade" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        .cssFilial {
            margin-top: -8px;
            margin-left: -5px;
            margin-right: -7px;
        }


        .cssTitle {
            font-size: larger;
        }

        .cssForm {
            padding-top: 30px;
        }

        #divFilial {
            clear: both;
            float: left;
            padding-top: 5px;
            margin-left: 5px;
        }

        #divDia {
            clear: both;
            float: left;
            padding-top: 10px;
            margin-left: 5px;
        }

        #divContainer {
            width: 100%;
        }

        #divCadastro {
            clear: both;
            float: left;
            padding-top: 2px;
            margin-left: 2px;
        }

        #divSalvar_ {
            clear: both;
            float: left;
            padding-top: 7px;
            padding-left: 2%;
        }

        #divGrid {
            clear: both;
            float: left;
            margin-left: 25px;
            padding-top: 5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="divContainer">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSalvar" />
            </Triggers>
            <ContentTemplate>


                <table class="w-100">
                    <tr>
                        <td>
                            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" CssClass="cssForm" AlignItemCaptionsInAllGroups="True" UseDefaultPaddings="False" Width="350px" Theme="Mulberry" EnableTheming="True">

                                <Items>
                                    <dx:LayoutGroup Caption="Informações Gerais" ColumnCount="1" CssClass="cssTitle " GroupBoxDecoration="Box" GroupBoxStyle-Caption-Font-Size="X-Large" GroupBoxStyle-Caption-BackColor="#efeeef">

                                        <GroupBoxStyle>
                                            <Caption BackColor="#EFEEEF" Font-Size="X-Large">
                                            </Caption>
                                        </GroupBoxStyle>


                                        <Items>

                                            <dx:LayoutItem Caption="Vencimento" ColSpan="1">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                                        <dx:ASPxDateEdit ID="cboDia" runat="server" Width="140px" HorizontalAlign="Center" Font-Size="Medium" Theme="Mulberry" ForeColor="Red" AutoPostBack="True" UseMaskBehavior="True" TabIndex="3" onfocus="this.select();">
                                                            <CalendarProperties TodayButtonText="Hoje">
                                                            </CalendarProperties>
                                                            <DateRangeSettings RangeErrorText="Você deve selecionar uma data entre {0} to {1} {2}" />
                                                        </dx:ASPxDateEdit>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="Filial" ColSpan="1">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false" Css_Filial="cssFilial" />
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="Horário Chegada" ColSpan="1">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                                        <dx:ASPxTextBox ID="txtHorariaChegada" runat="server" Width="150px" MaxLength="99" TabIndex="1" Theme="Mulberry" HorizontalAlign="Center">
                                                            <MaskSettings Mask="HH:mm" />
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>


                                            <dx:LayoutItem Caption="Horário Saída" ColSpan="1">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                        <dx:ASPxTextBox ID="txtHorariaSaiada" runat="server" MaxLength="99" Width="150px" AutoPostBack="True" Theme="Mulberry" TabIndex="2" onfocus="this.select();" HorizontalAlign="Center">
                                                            <MaskSettings Mask="HH:mm" />
                                                        </dx:ASPxTextBox>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                            <dx:LayoutItem Caption="Observação" ColSpan="1">
                                                <LayoutItemNestedControlCollection>
                                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                                        <textarea class="form-control" runat="server" name="txtObs" id="txtObs" row="7" Height="350" Width="250" MaxLength="500"></textarea>
    
                                                         <%--  <asp:textbox ID="txtObs" runat="server" Height="150px" Width="250px" MaxLength="500"  AutoPostBack="true" EnableTheming="true" Rows="4" Wrap="false" onfcus="this.select();"></asp:textbox>
                                                     <dx:ASPxTextBox ID="txtObs" runat="server" Height="150px" MaxLength="500" Width="250px" AutoPostBack="True" Theme="Mulberry" TabIndex="3" onfocus="this.select();" HorizontalAlign="Justify">
                                                        </dx:ASPxTextBox>--%>
                                                    </dx:LayoutItemNestedControlContainer>
                                                </LayoutItemNestedControlCollection>
                                            </dx:LayoutItem>

                                        </Items>
                                    </dx:LayoutGroup>

                                </Items>

                            </dx:ASPxFormLayout>

                            <div id="divSalvar_">
                                <dx:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" Width="150px" Height="35px" Font-Size="Large" Theme="MetropolisBlue" UseSubmitBehavior="false" CausesValidation="false"></dx:ASPxButton>


                            </div>

                        </td>
                        <td>
                            <div id="divGrid">

                                <dx:ASPxGridView ID="grid_Dados" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Dia" Width="700px">

                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
                                    <Toolbars>
                                        <dx:GridViewToolbar EnableAdaptivity="true">
                                            <Items>
                                                <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                                <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                                <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                            </Items>
                                        </dx:GridViewToolbar>
                                    </Toolbars>

                                    <Columns>
                                        <dx:GridViewDataDateColumn FieldName="Dia" ReadOnly="True" VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" ReadOnly="True" VisibleIndex="1" Width="50px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Descrição da Filial" FieldName="FilialDesc" VisibleIndex="2" Width="250px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Entrada" ReadOnly="True" VisibleIndex="3" Width="70px">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Saida" ReadOnly="True" VisibleIndex="4" Width="70px">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Tempo&lt;br&gt;Descarga" FieldName="tempoDescarga" ReadOnly="True" VisibleIndex="5" Width="75px">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Obs" FieldName="Observacao" ReadOnly="True" VisibleIndex="5" Width="175px">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                </dx:ASPxGridView>

                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="usp_CaminhaoHoraCeasa_Buscar" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Dia" SessionField="sDIA" Type="DateTime" />

                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>

                        </td>
                    </tr>
                </table>









            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

