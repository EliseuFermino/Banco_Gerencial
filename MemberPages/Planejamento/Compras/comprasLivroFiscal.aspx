<%@ Page Title="Conferência - Livro Fiscal / Compras" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="comprasLivroFiscal.aspx.vb" Inherits="MemberPages_Planejamento_Compras_comprasLivroFiscal" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <aspxcallbackpanel id="cbPanel" runat="server" width="100%" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Atualizando">
        <panelcollection>
            <panelcontent>
                <div class="container justify-content-center" style="max-width: 98%">
                    <%-- <div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="350" height="90">
                        <p class="lead">Formulário de registro de ocorrências.</p>
                    </div>--%>
                    <br />
                    <div class="row col-12 justify-content-center" runat="server" id="divFiltros">
                        <div class="col-md-10 justify-content-sm-center">
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Conferência - Livro Fiscal
                        <br />
                            </span>
                            <br />
                            <div class="row col-auto justify-content-center sm">
                                <div class="col-auto xs">
                                    <span class="input-group-text justify-content-center sm">Data</span>
                                    <input type="date" class="form-control xs" name="daterange" autopostback="false" runat="server" id="txtData" />
                                </div>

                                <div class="col-auto">
                                    <span class="input-group-text justify-content-center">Unidade</span>
                                    <select id="selUnidade" runat="server" class="form-control justify-content-center"></select>
                                </div>

                                <div class="col-auto justify-content-center" style="padding: 13px 0px 13px 0px">
                                    <asp:Button type="button" class="btn btn-info" runat="server" ID="btnFiltro" Style="height: 50px; width: 110px" OnClick="btnFiltrar_Click" Text="Aplicar filtro" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row col-12 justify-content-center" runat="server" id="divOcorrencia">
                        <div class="col-10 justify-content-center">
                            <br />
                            <div id="divDados">
                                <dx:ASPxCallbackPanel ID="gridPanel" runat="server" Width="100%" ClientInstanceName="gridPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                                            <dx:ASPxGridView ID="grvDados" DataSourceID="SqlDataSource1" runat="server" AutoGenerateColumns="true" EnableTheming="True" Theme="SoftOrange" Width="100%">
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

                                                    <dx:GridViewBandColumn Caption="" ShowInCustomizationForm="True" ToolTip="">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Dia" FieldName="Dia" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="Filial" ShowInCustomizationForm="True" Width="220px">
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="Fornecedor" ShowInCustomizationForm="True" Width="300px" ToolTip="Nome do Fornecedor">
                                                                <Settings AutoFilterCondition="Contains" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Nota" FieldName="Nota" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="80px">
                                                                <Settings AutoFilterCondition="Equals" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Serie" FieldName="Serie" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="50px">
                                                                <Settings AutoFilterCondition="Equals" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Agenda" FieldName="Agenda" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <Settings AutoFilterCondition="Equals" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>


                                                    <dx:GridViewBandColumn Caption="Produto" ShowInCustomizationForm="True" ToolTip="">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Produto" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <Settings AutoFilterCondition="Equals" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Quant." FieldName="QtdeProduto" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Preço Nota" FieldName="vlrPrecoNF" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>

                                                    <dx:GridViewBandColumn Caption="Compra" ShowInCustomizationForm="True" ToolTip="">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Quant." FieldName="QtdeCompra" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrCompra"  HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    
                                                    <dx:GridViewBandColumn Caption="Custo" ShowInCustomizationForm="True" ToolTip="">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Custo Unitário" FieldName="vlrCustoUnitario"  HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Custo Transf." FieldName="vlrCustoTransferencia"  HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>

                                                            <dx:GridViewDataTextColumn Caption="Custo Condor" FieldName="vlrCustoCondor"  HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                                <Settings AllowAutoFilter="False" />
                                                                <CellStyle Wrap="False">
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>

                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                <SettingsPager PageSize="40">
                                                </SettingsPager>
                                                <Settings ShowFilterRow="True" ShowFilterBar="Hidden" ShowFilterRowMenuLikeItem="True" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                                                <SettingsText FilterBarClear="Limpar" FilterBarCreateFilter="Filtro" />
                                                <SettingsLoadingPanel Text="Aguarde&amp;hellip;" />
                                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                <Styles>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                    <AlternatingRow BackColor="#EEEEEE">
                                                    </AlternatingRow>
                                                    <FocusedRow BackColor="#FFFFCC" ForeColor="Blue">
                                                    </FocusedRow>
                                                </Styles>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>"
                                                SelectCommand="Select	 
                                                                Convert(varchar(20),DiaMovimento,103)	As Dia
	                                                        ,	FilialLista		As Filial	
	                                                        ,	d.nomeFornecedor As Fornecedor
	                                                        ,	numnota			As Nota
	                                                        ,	serieNota		As Serie
	                                                        ,	idAgenda		As Agenda
	                                                        ,	a.idProduto		As Produto
	                                                        ,	QtdeProduto
	                                                        ,	vlrPrecoNF
	                                                        ,	QtdeCompra
	                                                        ,	vlrCompra
	                                                        ,	vlrCustoUnitario
	                                                        ,	vlrCustoTransferencia
	                                                        ,	vlrCustoCondor
                                                        From	[gerTran_SLV].[dbo].[tblCompraItem]		A
                                                        Join	gerCadastros.Cadastros.tblCadFiliais	B On B.Filial		= A.idFilial
                                                        Join	[gerCadastros].[SLV].[tblProduto]		C On C.idProduto	= A.idProduto	
                                                        Join	gerCadastros.SLV.DimFornecedor			D On D.idFornecedor	= C.idFornecedor
                                                        Where	DiaMovimento = @txtData
                                                        And     A.idFilial  =   @idFilial
                                                        Order by a.Idfilial, d.nomeFornecedor ,numNota Asc "
                                                SelectCommandType="Text">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="txtData" SessionField="sData" />
                                                    <asp:SessionParameter DbType="Int16" Name="idFilial" SessionField="sFilial" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxCallbackPanel>
                            </div>
                            <%--<div class="row justify-content-center">
                                <asp:GridView ID="grvDados" CssClass="gwFormat" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange"
                                    RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" AllowPaging="true" runat="server" AutoGenerateColumns="true"
                                    BorderStyle="none" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center" RowStyle-HorizontalAlign="Center"
                                    EmptyDataText="<b>Não foram encontrador registros para os parâmetros informados!</b>" CellPadding="15" CellSpacing="10" OnPageIndexChanging="grvDados_PageIndexChanging" PageSize="20">
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager" Height="50px" VerticalAlign="Middle" />
                                    <PagerSettings Mode="Numeric"
                                        Position="Bottom"
                                        PageButtonCount="12" />
                                    <PagerStyle BackColor="LightBlue"
                                        Height="30px"
                                        VerticalAlign="Bottom"
                                        HorizontalAlign="Center" />
                                </asp:GridView>
                            </div>--%>
                        </div>
                    </div>
                </div>

            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>

    <style>
        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }

        .gwFormat td {
            padding: 8px 13px 8px 13px;
        }
    </style>

    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />

    <script type="text/javascript"> 
        function maxData() {

            try {

                const date = new Date();
                const theDayOfTheMonthOnNextWeek = date.getDate() - 1;
                date.setDate(theDayOfTheMonthOnNextWeek)

                MainContent_txtData.max = date.toISOString().split("T")[0];
                //document.getElementById('MainContent_txtData').valueAsDate = date;

            } catch (e) {
                console.log(e.message)
                // Unexpected token n in JSON at position 2
            }
        };


        function lastData() {

            const date = new Date();
            const theDayOfTheMonthOnNextWeek = date.getDate() - 1;
            date.setDate(theDayOfTheMonthOnNextWeek)

            document.getElementById('MainContent_txtData').valueAsDate = date;

            maxdata();
        };

        maxData();


    </script>


</asp:Content>

