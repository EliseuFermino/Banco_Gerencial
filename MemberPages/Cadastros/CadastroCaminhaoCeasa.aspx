<%@ Page Title="Cadastro Chegada Caminhão Ceasa" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroCaminhaoCeasa.aspx.vb" Inherits="MemberPages_Quebras_Validade_CadastroValidade" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSalvar" EventName="Click" />
        </Triggers>
        <ContentTemplate>

            <div class="row col-auto" runat="server" style="padding: 30px 30px 30px 30px; margin: 25px 25px 25px 25px; font-size: x-small" id="div1">
                <div class="container-fluid bg-white">
                    <div class="row flex-nowrap justify-content-center">
                        <p></p>

                        <%--lateral--%>
                        <div class="flex-shrink-0 p-4 bg-white">
                            <p>
                                <br />
                                <br />
                                <br />
                            </p>
                            <div class="row justify-content-between">
                                <br />
                                <span class="justify-content-center sm h5 cssTitle">Informações Gerais</span>
                                <br />
                            </div>
                            <br />
                            <div class="row justify-content-between">
                                <div class="col-auto">
                                    <div class="input-group input-group xs" style="max-height: 30px">
                                        <div class="input-group-prepend xs">
                                            <span class="col-auto input-group-text justify-content-center" style="width: 100px">Vencimento</span>
                                        </div>
                                        <dx:ASPxDateEdit ID="txtData" runat="server" Width="330px" OnDateChanged="txtData_DateChanged" HorizontalAlign="Center" Font-Size="Medium" Theme="Mulberry" ForeColor="Red" AutoPostBack="True" UseMaskBehavior="True" TabIndex="3" onfocus="this.select();">
                                            <CalendarProperties TodayButtonText="Hoje">
                                            </CalendarProperties>
                                            <DateRangeSettings RangeErrorText="Você deve selecionar uma data entre {0} to {1} {2}" />
                                        </dx:ASPxDateEdit>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row justify-content-between">
                                <div class="col-auto">
                                    <div class="input-group input-group xs" style="max-height: 30px">
                                        <div class="input-group-prepend xs">
                                            <span class="col-auto input-group-text justify-content-center" style="width: 100px">Filial</span>
                                        </div>
                                        <asp:DropDownList class="form-control justify-content-center text-center" ID="selFilial" runat="server" DataTextField="Desc" Width="330px"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row justify-content-between">
                                <div class="col-auto">
                                    <div class="input-group input-group xs" style="max-height: 30px">
                                        <div class="input-group-prepend xs">
                                            <span class="col-auto input-group-text justify-content-center" style="width: 100px">Entrada</span>
                                        </div>
                                        <input type="time" class="form-control justify-content-center text-center" id="txtEntrada" runat="server">
                                    </div>
                                </div>
                                <div class="col-auto" style="padding-left: 15px">
                                    <div class="input-group input-group xs" style="max-height: 30px">
                                        <div class="input-group-prepend xs">
                                            <span class="col-auto input-group-text justify-content-center" style="width: 100px">Saída</span>
                                        </div>
                                        <input type="time" class="form-control justify-content-center text-center" id="txtSaida" runat="server">
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row justify-content-between">
                                <div class="col-auto">
                                    <div class="input-group input-group xs" style="max-height: 30px">
                                        <div class="input-group-prepend xs">
                                            <span class="col-auto input-group-text justify-content-center" style="width: 100px">Observação</span>
                                        </div>
                                        <textarea class="form-control justify-content-center text-center" aria-orientation="horizontal"  maxlength="500"  rows="4" id="txtObs" style="width: 330px" runat="server"></textarea>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row justify-content-center" style="padding-top: 110px">
                                <p></p>
                                <asp:Button ID="btnSalvar" runat="server" Width="110px" Height="50px" Font-Bold="true" CssClass="btn btn-success" Text="Salvar" />
                            </div>
                        </div>
                        <br />
                        <br />
                        <%--                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" CssClass="cssForm" AlignItemCaptionsInAllGroups="True" UseDefaultPaddings="False" Width="350px" Theme="Mulberry" EnableTheming="True" Visible="false">
                        <Items>
                            <dx:LayoutGroup Caption="Informações Gerais" ColumnCount="1" CssClass="cssTitle" HorizontalAlign="Center" GroupBoxDecoration="Box" GroupBoxStyle-Caption-Font-Size="X-Large" GroupBoxStyle-Caption-BackColor="#efeeef">
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
                                                <textarea class="form-control" runat="server" name="txtObs" id="txtObs" row="7" height="350" width="250" maxlength="500"></textarea>
                                            </dx:LayoutItemNestedControlContainer>
                                        </LayoutItemNestedControlCollection>
                                    </dx:LayoutItem>
                                </Items>

                            </dx:LayoutGroup>
                        </Items>
                    </dx:ASPxFormLayout>--%>
                        <div class="col-md-9 text-center bg-white border-left justify-content-center">
                            <br />

                            <dx:ASPxGridView ID="grid_Dados" runat="server" AutoGenerateColumns="False" Font-Bold="true" DataSourceID="SqlDataSource1" KeyFieldName="Dia" Width="100%" EnableTheming="True" Theme="SoftOrange">
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
                                    <dx:GridViewDataDateColumn FieldName="Dia" ReadOnly="True" VisibleIndex="0" Width="100px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição da Filial" CellStyle-HorizontalAlign="Center" FieldName="FilialDesc" VisibleIndex="2" Width="230px">
                                        <CellStyle HorizontalAlign="Left">
                                        </CellStyle>
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
                                <SettingsBehavior ColumnResizeMode="Control" />
                                <SettingsPager PageSize="70" Mode="ShowAllRecords"></SettingsPager>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="usp_CaminhaoHoraCeasa_Buscar" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Dia" SessionField="sDIA" Type="DateTime" />

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

        function alertaCampos(msg) {

            swal({
                title: "Atenção!",
                text: msg,
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            return false;
        };

        function alertSucess() {

            swal({
                title: "Sucesso!",
                text: "As informações foram gravadas com sucesso!",
                icon: "success",
                button: "Voltar!"
            });

        };
    </script>
</asp:Content>

