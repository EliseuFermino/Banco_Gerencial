<%@ Page Title="Análise Detalhada - Margem" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="analiseMargemDetalhada.aspx.vb" Inherits="MemberPages_analiseMargemDetalhada" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaDeptoSecao.ascx" TagPrefix="uc1" TagName="wucListaDeptoSecao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style type="text/css">
        html {
            overflow-x: hidden;
            font-size: 9pt !important;
        }

        .dxgvControl_SoftOrange {
            font-size: 9pt !important;
        }

        #Grid {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-right: 5px;
            padding-right: 3px;
            font-size: 9pt !important;
        }
    </style>

    <script type="text/javascript"> 
        $(function () {

            $('input[name="ctl00$MainContent$daterange"]').daterangepicker({
                opens: 'left',
                maxDate: moment(),
                autoUpdateInput: false,
                locale: {
                    format: 'DD/MM/YYYY',
                    cancelLabel: 'Limpar',
                    applyLabel: 'Aplicar',
                    language: 'pt-br',
                    daysOfWeek: [
                        "Dom",
                        "Seg",
                        "Ter",
                        "Qua",
                        "Qui",
                        "Sex",
                        "Sab"
                    ],
                    monthNames: [
                        "Janeiro",
                        "Fevereiro",
                        "Março",
                        "Abril",
                        "Maio",
                        "Junho",
                        "Julho",
                        "Agosto",
                        "Setembro",
                        "Outubro",
                        "Novembro",
                        "Dezembro"
                    ]
                }
            });

            $('input[name="ctl00$MainContent$daterange"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('DD/MM/YYYY') + ' à ' + picker.endDate.format('DD/MM/YYYY'));
            });

            $('input[name="ctl00$MainContent$daterange"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });
        });

        function atualizaGrid(s, e) {

            cbPanel.PerformCallback();
        };

        function alertCampos() {

            swal({
                title: "Atenção!",
                text: "Selecione uma data antes de prosseguir!",
                icon: "warning",
                button: "Ok!",
                return: false
            });

            return false;
        };

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server" style="font-size: 9pt !important">

    <div class="container justify-content-center" style="max-width: 99%">


        <br />
        <div class="row col-12 justify-content-center" runat="server" id="divFiltros">
            <div class="col-md-12 justify-content-sm-center">
                <span class="input-group-text justify-content-sm-center" style="height: 35px">Análise de Margem<br />
                </span>
                <br />

                <div class="row">
                    <div class="col-12">
                        <div class="row col-auto justify-content-between sm">
                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center sm">Data</span>
                                    </div>
                                    <input type="text" class="form-control" name="daterange" autopostback="false" runat="server" id="daterange" />
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">Tipo</span>
                                    </div>
                                    <asp:DropDownList class="form-control" ID="selTipo" runat="server" DataTextField="Desc">
                                        <asp:ListItem Selected="True" Text="Condor (Empresa)" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="    Super" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="    Hiper" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Gigante (Empresa)" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text justify-content-center">Filial</span>
                                    </div>
                                    <asp:DropDownList class="form-control" ID="selFilial" runat="server" DataTextField="Desc"></asp:DropDownList>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="form-check-inline small" style="padding-right: 4px">
                                            <dx:ASPxCheckBox ID="chkParticip" runat="server" Text="Ver apenas Participação" OnCheckedChanged="chkParticip_CheckedChanged" AutoPostBack="true" Font-Size="7pt" Theme="DevEx"
                                                Checked="false" ForeColor="Green" Font-Bold="true">
                                            </dx:ASPxCheckBox>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-auto">
                                <div class="col-auto justify-content-center sm">
                                    <div class="col col-auto xs">
                                        <div class="input-group input-group-sm">
                                            <div class="input-group-prepend">
                                                <%--Botão Atualizar--%>
                                                <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" Font-Bold="true" Height="25px" Width="90px" type="button" class="btn btn-secondary" autoPostBack="false" OnClientClick="atualizaGrid(); return false;" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="row col-auto justify-content-between sm" style="padding-top: 5px">

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Depto</div>
                                    </div>
                                    <asp:DropDownList ID="cboDepto" runat="server" DataSourceID="sqlDepto" class="form-control" DataTextField="ListaReduzida" DataValueField="idDepto" OnDataBound="cboDepto_DataBound" OnSelectedIndexChanged="cboDepto_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlDepto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Seção</div>
                                    </div>
                                    <asp:DropDownList ID="cboSecao" runat="server" class="form-control" DataSourceID="sqlSecao" DataTextField="ListaReduzida" DataValueField="idSecao" Enabled="false" OnSelectedIndexChanged="cboSecao_SelectedIndexChanged" OnDataBound="cboSecao_DataBound" AutoPostBack="true">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sqlSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboSecaoFiltro" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="SelectedValue" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Grupo</div>
                                    </div>
                                    <asp:DropDownList ID="cboGrupo" runat="server" class="form-control" DataSourceID="sqlGrupo" DataTextField="ListaReduzida" DataValueField="idGrupo" Enabled="false" OnSelectedIndexChanged="cboGrupo_SelectedIndexChanged" OnDataBound="cboGrupo_DataBound" AutoPostBack="true">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="sqlGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboGrupo" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboSecao" Name="idSecao" PropertyName="SelectedValue" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Sub-Grupo</div>
                                    </div>
                                    <asp:DropDownList ID="cboSubgrupo" runat="server" class="form-control" DataSourceID="sqlSubgrupo" DataTextField="ListaReduzida" Enabled="false" DataValueField="idSubgrupo" OnDataBound="cboSubgrupo_DataBound" OnSelectedIndexChanged="cboSubgrupo_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="sqlSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboSubgrupo" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="SelectedValue" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                            <div class="col col-auto xs" style="padding-right: 2px">
                                <div class="input-group input-group-sm">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Produto</div>
                                    </div>
                                    <asp:DropDownList ID="cboProduto" runat="server" class="form-control" DataSourceID="sqlProduto" DataTextField="ListaReduzida" Enabled="false" DataValueField="idProduto" OnDataBound="cboProduto_DataBound" OnSelectedIndexChanged="cboProduto_SelectedIndexChanged" AutoPostBack="false">
                                    </asp:DropDownList>

                                    <asp:SqlDataSource ID="sqlProduto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboProduto" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboSubgrupo" Name="idSubgrupo" PropertyName="SelectedValue" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-auto justify-content-center sm">
                </div>
            </div>
        </div>
        <br />
        <br />

        <div id="Grid" class="justify-content-sm-center small" runat="server">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" Font-Size="10pt" ClientInstanceName="cbPanel" SettingsLoadingPanel-Text="Atualizando...">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                            Width="100%" Font-Size="8pt" KeyFieldName="Text" OnDataBound="ASPxGridView1_DataBound">

                            <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>

                            <TotalSummary>
                                <%-- <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_N" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_N" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_0_5" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_0_5" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_5_10" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_5_10" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_10_15" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_10_15" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_15_20" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_15_20" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_20_25" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_20_25" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_25_30" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_25_30" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_30_AC" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_30_AC" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Fat_Total" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Lucro_Total" SummaryType="Sum" />--%>
                            </TotalSummary>

                            <Columns>

                                <dx:GridViewDataTextColumn Caption=" " FieldName="Text"
                                    VisibleIndex="1" Width="150px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <%--Descricao  VisibleIndex="1"--%>

                                <dx:GridViewBandColumn Caption="Negativo" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_N" Width="60px" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_N" Width="60px" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_N" Width="60px" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_N" Width="60px" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--01 - Negativo --%>

                                <dx:GridViewBandColumn Caption="0.1% e 5%" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_0_5" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_0_5" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_0_5"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_0_5" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--02 - Entre 0 e 5 --%>

                                <dx:GridViewBandColumn Caption="5.01% e 10%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_5_10"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_5_10" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_5_10"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_5_10" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--03 - Entre 5.01 e 10--%>

                                <dx:GridViewBandColumn Caption="10.01% e 15%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_10_15"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_10_15" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_10_15"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_10_15" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--04 - Entre 10.01 e 15--%>

                                <dx:GridViewBandColumn Caption="15.01% e 20%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_15_20"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_15_20" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_15_20"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_15_20" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--05 - Entre 15.01 e 20--%>

                                <dx:GridViewBandColumn Caption="20.01% e 25%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_20_25"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_20_25" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_20_25"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_20_25" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--06 - Entre 20.01 e 25--%>

                                <dx:GridViewBandColumn Caption="25.01% e 30%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_25_30"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_25_30" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_25_30"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_25_30" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--07 - Entre 25.01 e 30--%>

                                <dx:GridViewBandColumn Caption="Acima de 30%" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_30_AC"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_30_AC" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_30_AC"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Part" FieldName="Part_30_AC" VisibleIndex="5"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--08 - Acima de 30--%>

                                <dx:GridViewBandColumn Caption="Total" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Fat" FieldName="Fat_Total"
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_Total" VisibleIndex="2"
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="Margem_Total"
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#1E90FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <%--09 - Total--%>
                            </Columns>

                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Visible="False" Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowFooter="True" ShowHorizontalScrollBar="True" />
                            <Styles>
                                <Header HorizontalAlign="Center" Font-Size="X-Small">
                                </Header>
                                <Row Font-Size="XX-Small">
                                </Row>
                                <FocusedRow BackColor="#FF99FF" ForeColor="Blue">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>
    <br />


</asp:Content>
