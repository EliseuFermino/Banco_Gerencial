<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV005_Perdas.aspx.vb" Inherits="MemberPages_SLV_SLV005_Perdas" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <script type="text/javascript">

        function Update_gvMaster_Grid(s, e) {
            masterGridView.PerformCallback();
        }

        function Update_gvFamilia_Grid(s, e) {
            detailGridView_Familia.PerformCallback();
        }

        function UpdateDetailGrid(s, e) {
            detailGridView.PerformCallback();
        } 

        function UpdateLojaGrid(s, e) {
            detailGridLojas.PerformCallback();
        }

        function UpdateDetailGraph(s, e) {           
            Detail_Graph.PerformCallback();
        }


         // PEGAR O NOME DO PRODUTO ---------------------------------------------------------------------------------------

        function OnGridFocusedRowChanged_Item() {
            detailGridView.GetRowValues(detailGridView.GetFocusedRowIndex(), 'idProduto;descId', OnGetRowValues2);
        }

        function OnGetRowValues2(values) {
            lblTituloGrafico.SetText('Gráfico de Percentual de Quebra do Item:' + values[1] + ' - Loja a Loja - Area Azul é a Faixa Aceitável');

        }

    </script>
    
    <style type ="text/css" >

        html {            
            overflow-x:hidden;  
            overflow-y:auto;          
        }       

        #divFilial { 
           clear: both;
           float: left;         
           padding-left: 2px;
           margin-left: 2px;
           margin-top: 3px;             
        }

        #divTituloGrafico{
            clear:both ;
            float:left ;
            padding-top:20px;           
            padding-left: 5px;
            font-size: 20px;
        }

        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar { 
           
            float:left ;           
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                            
        }
        
        #divParametros {
            clear:both ;
            float:left ;
            margin-left: 5px;
          
        }

         #divParametros1 {            
            float:left ;
            margin-left: 10px;    
            background-color:lightyellow;     
        }

        

        #divOpcaoExibir {    
            clear: both;
            float:left ;        
            margin-left: 2px;
            width: 600px;  
            padding-top: 2px; 
                                           
        }

        #divExibir_AnoAnterior { 
            clear:both; 
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;                                          
        }

        #divExibir_AnoAtual {  
            float: left;          
            margin-left: 10px;            
            padding-top: 2px;                                          
        }

        #divSize {            
            float: left;   
            padding: 9px;  
            margin-top: 3px;
            margin-left: 5px;      
        }

        #divExibir_SellOut {
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;          
        }

       #divExibir_CAI {  
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                                        
        }

        #divFixarCabecalho {
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                
        }

        #divExibirMesmosDias {
            float: left;
            margin-left: 10px;
            margin-top: 2px; 
        }

        #divVisao { 
            
            float: left; 
            margin-left: 20px;           
            padding-Top: 2px;  
        }

        #divManual {            
            float: left;
            margin-left: 5px;
             margin-top: 2px;
        }
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px;            
            padding-right: 2px;  
        }    

        #divMaster {
            clear: both;
            float: left;
            padding-left: 5px;
            width: 100%;
            padding-bottom: 10px;
        }
          
        #divDetail {
            clear: both;
            float: left;
            padding-left: 5px;
            width: 100%;
            padding-top: 5px;
        }

        #divBotaoGrafico {
            clear: both;
            float: left;
            padding-left: 5px;            
        }

        #div_Grafico {
            clear:both ;
            float: left;
            padding-top: 20px;
             padding-left: 5px;
        }

        .chkDefault {
            float:left ;
            margin-left: 5px;

        }

        .chkGrupo {            
            border: 1px solid #bdbbbb;
            padding-bottom: 4px;
            margin-bottom: 4px;

            
            margin-top: 4px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        
        <div id="divFilial" class="BGC_myBorder">
                    <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" Visible_Empresa ="false" Caption="Filial" AutoPostBack="false"    />
                </div>

        <div id="divPeriodo" class="BGC_Periodo BGC_myBorder" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div> 
    
        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" UseSubmitBehavior="False" >
                <ClientSideEvents Click="function(s, e) {	
    cbPanelSecao.PerformCallback();
    cbPanel.PerformCallback();   
}" />
            </dx:ASPxButton>
        </div>      

        <div id="divParametros" class="chkGrupo">

            <div class="chkDefault">
                 <dx:ASPxCheckBox ID="chkVendas" runat="server" Text="Vendas" Theme="MaterialCompactOrange" CheckState="Unchecked"  >
                     <ClientSideEvents CheckedChanged="function(s, e) {
Update_gvMaster_Grid();
Update_gvFamilia_Grid();	
UpdateDetailGrid();
}
" />
                 </dx:ASPxCheckBox>
            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkVolume" runat="server" Text="Volume" Theme="MaterialCompactOrange" CheckState="Unchecked"  >
                    <ClientSideEvents CheckedChanged="function(s, e) {
Update_gvMaster_Grid();
Update_gvFamilia_Grid();	
}
" />
                </dx:ASPxCheckBox>
                    
            </div>

             <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkMargem" runat="server" Text="Lucro Final" Theme="MaterialCompactOrange" CheckState="Unchecked"    >
                    <ClientSideEvents CheckedChanged="function(s, e) {
Update_gvMaster_Grid();
Update_gvFamilia_Grid();	
}
" />
                </dx:ASPxCheckBox>

            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkPrecoMedio" runat="server" Text="Preço Médio " Theme="MaterialCompactOrange" CheckState="Unchecked"  >
                    <ClientSideEvents CheckedChanged="function(s, e) {
Update_gvMaster_Grid();
Update_gvFamilia_Grid();	
}
" />
                </dx:ASPxCheckBox>
            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkNumClientes" runat="server" Text="Clientes" Theme="MaterialCompactOrange" CheckState="Unchecked"  >
                    <ClientSideEvents CheckedChanged="function(s, e) {
Update_gvMaster_Grid();
Update_gvFamilia_Grid();	
}
" />
                </dx:ASPxCheckBox>
            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkEstoqueQtde" runat="server" Text="Qtde. Estoque " Checked="false" Theme="MaterialCompactOrange"  >
                    <ClientSideEvents CheckedChanged="Update_gvMaster_Grid" />
                </dx:ASPxCheckBox>
            </div>           

        </div>

        <div id="divParametros1"  class="chkGrupo">

            <div class="chkDefault" >
                <dx:ASPxCheckBox ID="chkCompra_Volume" runat="server" Text="Compra - Volume" Checked="false" Theme="MaterialCompactOrange"  ></dx:ASPxCheckBox>
            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkCompra_Qtde" runat="server" Text="Compra - R$" Checked="false" Theme="MaterialCompactOrange"  ></dx:ASPxCheckBox>
            </div>

            <div class="chkDefault">
                <dx:ASPxCheckBox ID="chkResultado" runat="server" Text="Resultado " ToolTip="LF - PT = LL" Checked="false" Theme="MaterialCompactOrange"  ></dx:ASPxCheckBox>
            </div>

        </div>

         <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent >

                    <div id="divMaster">
                   
                        <dx:ASPxGridView ID="gvMaster" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idProdutoSecao"  DataSourceID="SqlDataSource1" Width="100%" ClientInstanceName="masterGridView">
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <Items>
                                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para EXCEL - XLS" />
                                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para EXCEL - XLSX" />
                                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <TotalSummary>

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AA" SummaryType="Custom" />
                                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaAg23" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}%" FieldName="percAtingMetaVlrG" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />
                                            
                                        </TotalSummary>

                                        <Columns>                                           

                                            <dx:GridViewBandColumn Caption="Meta de Venda" Name="bandMeta" 
                                                ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade em relação ao ano anterior." 
                                                VisibleIndex="19" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda_meta" 
                                                        ToolTip="Valor de meta de venda do período selecionado" 
                                                        VisibleIndex="0" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" 
                                                        VisibleIndex="2" Width="75px" ToolTip="Atingimento entre Realizado versus Meta">
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMeta" 
                                                        ToolTip="Diferença entre o valor da Meta e o valor do Realizado" 
                                                        VisibleIndex="1" Width="100px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Concluido" FieldName="percAtingMetaVlrG" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                             
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="15" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Venda" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" 
                                                        Width="75px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCresc_Qtde" 
                                                        ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" 
                                                        Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" 
                                                        VisibleIndex="2" Width="75px" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                                                                         
                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="23" Visible="False" Name="bandCAI_AnoAnterior">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="24" Visible="False" Name="bandCAI_AnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Lucro" Name="bandMetaLucro" ShowInCustomizationForm="True" VisibleIndex="20" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_meta" ShowInCustomizationForm="True" ToolTip="Meta de lucro" VisibleIndex="0" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMetaLucro" ShowInCustomizationForm="True" ToolTip="Diferença entre o valor da Meta de Lucro e o valor do Realizado do Lucro" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Margem" Name="bandMetaMargem" ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_meta" ShowInCustomizationForm="True" ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta." VisibleIndex="0" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Agenda 23" ShowInCustomizationForm="True" VisibleIndex="22" Name="bandMetaAg23" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_meta" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difValorMetaAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaAg23" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idProdutoSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="True">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Inflação &lt;br&gt; Interna" FieldName="precoMedioCresc" ShowInCustomizationForm="True" VisibleIndex="17" Width="70px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Real" FieldName="percCrescReal" ShowInCustomizationForm="True" VisibleIndex="18" Width="75px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <HeaderStyle BackColor="Red" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AT" ShowInCustomizationForm="True" ToolTip="Volume vendida do período selecionado" Visible="False" VisibleIndex="3" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" Visible="False" VisibleIndex="4" Width="110px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_AT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" Visible="False" VisibleIndex="5" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellout_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinal_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" Visible="False" VisibleIndex="8" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellout_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" Visible="False" VisibleIndex="10" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" Visible="False" VisibleIndex="11" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" Visible="False" VisibleIndex="12" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nº Clientes" FieldName="numClienteAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Preço &lt;br&gt; Médio" FieldName="precoMedio_AT" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" Visible="False" VisibleIndex="13" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>

                                       <ClientSideEvents FocusedRowChanged="Update_gvFamilia_Grid " />                                        
                                        <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" ColumnResizeMode="Control" />
                                        
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVlr" Format="PositiveNegativeTriangles" ShowInColumn="percAtingMetaVlr" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescReal" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Lucro" Format="PositiveNegativeArrowsColored" />
                                        </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small"></Cell>
                                            <Footer Font-Bold="True"></Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                        


                        <dx:ASPxGridView ID="gvFamilia" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idProdutoSubgrupo"  DataSourceID="dsFamilia" Width="100%" ClientInstanceName="detailGridView_Familia">
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <Items>
                                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para EXCEL - XLS" />
                                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para EXCEL - XLSX" />
                                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <TotalSummary>

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Custom" />                                     
                                           
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                           
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />                                           
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                           
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />
                             
                                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaAg23" SummaryType="Custom" />
                             
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}%" FieldName="percAtingMetaVlrG" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />
                                            
                                        </TotalSummary>

                                        <Columns>                                   
                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="23" Visible="False" Name="bandCAI_AnoAnterior">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="24" Visible="False" Name="bandCAI_AnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>                              
                                            

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idProdutoSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="True">
                                            </dx:GridViewDataTextColumn>
                                                                                               
                                            <dx:GridViewDataTextColumn Caption="Preço &lt;br&gt; Médio" FieldName="precoMedio" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="8" Width="70px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                             
                                            <dx:GridViewDataTextColumn Caption="Inflação &lt;br&gt; Interna" FieldName="precoMedioCresc" ShowInCustomizationForm="True" VisibleIndex="17" Width="70px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Real" FieldName="percCrescReal" ShowInCustomizationForm="True" VisibleIndex="18" Width="75px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <HeaderStyle BackColor="Red" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume vendida do período selecionado" Visible="False" VisibleIndex="3" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" Visible="False" VisibleIndex="4" Width="110px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_AT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" Visible="False" VisibleIndex="5" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellout_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" Visible="False" VisibleIndex="9" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellout_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" Visible="False" VisibleIndex="11" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" Visible="False" VisibleIndex="12" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" Visible="False" VisibleIndex="13" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nº Clientes" FieldName="numClienteAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>

                                       <ClientSideEvents FocusedRowChanged="UpdateDetailGrid " />                                        
                                        <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" ColumnResizeMode="Control" />
                                        
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVlr" Format="PositiveNegativeTriangles" ShowInColumn="percAtingMetaVlr" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescReal" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Lucro" Format="PositiveNegativeArrowsColored" />
                                        </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small"></Cell>
                                            <Footer Font-Bold="True"></Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                       



                        <dx:ASPxGridView ID="gvMasterLojas" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Visible="false" 
                                        KeyFieldName="idProdutoSecao"  DataSourceID="SqlDataSource1" Width="100%" ClientInstanceName="masterGridView">
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <Items>
                                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para EXCEL - XLS" />
                                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para EXCEL - XLSX" />
                                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <TotalSummary>

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AA" SummaryType="Custom" />
                                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaAg23" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}%" FieldName="percAtingMetaVlrG" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />
                                            
                                        </TotalSummary>

                                        <Columns>                                           

                                            <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" 
                                                ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" 
                                                VisibleIndex="7">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellout_AT" 
                                                        VisibleIndex="7" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AT" 
                                                        ToolTip="Percentual da Margem Final" 
                                                        VisibleIndex="8" Width="70px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="9" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellout_AT" 
                                                        VisibleIndex="4" Width="90px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="6" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="10" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />                                            
                                            </dx:GridViewBandColumn>
                                             
                                            <dx:GridViewBandColumn Caption="Meta de Venda" Name="bandMeta" 
                                                ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade em relação ao ano anterior." VisibleIndex="12" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda_meta" 
                                                        ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="0" 
                                                        Width="110px">
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" 
                                                        VisibleIndex="2" Width="75px" ToolTip="Atingimento entre Realizado versus Meta">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMeta" 
                                                        ToolTip="Diferença entre o valor da Meta e o valor do Realizado" VisibleIndex="1" 
                                                        Width="100px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Concluido" FieldName="percAtingMetaVlrG" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                                                                         
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento"
                                                VisibleIndex="8" ToolTip="Exibe as informações do ano atual" Visible="False">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Venda" VisibleIndex="0" 
                                                        Width="75px" ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCresc_Qtde" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="75px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False" Name="bandCAI_AnoAnterior">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False" Name="bandCAI_AnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Lucro" Name="bandMetaLucro" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_meta" ShowInCustomizationForm="True" ToolTip="Meta de lucro" VisibleIndex="0" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMetaLucro" ShowInCustomizationForm="True" ToolTip="Diferença entre o valor da Meta de Lucro e o valor do Realizado do Lucro" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Margem" Name="bandMetaMargem" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_meta" ShowInCustomizationForm="True" ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta." VisibleIndex="0" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Agenda 23" ShowInCustomizationForm="True" VisibleIndex="15" Name="bandMetaAg23" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_meta" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difValorMetaAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaAg23" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idProdutoSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="True">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Preço Médio" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedio_AA" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2019" FieldName="precoMedio_AT" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Inflação &lt;br&gt; Interna" FieldName="precoMedioCresc" ShowInCustomizationForm="True" VisibleIndex="10" Width="70px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Real" FieldName="percCrescReal" ShowInCustomizationForm="True" VisibleIndex="11" Width="75px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <HeaderStyle BackColor="Red" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AT" ShowInCustomizationForm="True" ToolTip="Volume vendida do período selecionado" Visible="False" VisibleIndex="3" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="5" Width="110px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_AT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" Visible="False" VisibleIndex="4" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinal_AT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#84C1FF" />
                                                <CellStyle ForeColor="#0984FF">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#0984FF">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>

                                       <ClientSideEvents FocusedRowChanged="UpdateLojaGrid" />                                        
                                        <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" ColumnResizeMode="Control" />
                                        
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVlr" Format="PositiveNegativeTriangles" ShowInColumn="percAtingMetaVlr" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescReal" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Lucro" Format="PositiveNegativeArrowsColored" />
                                        </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small"></Cell>
                                            <Footer Font-Bold="True"></Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                     


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004_Perdas" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />                           
                                <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
                                <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" DefaultValue="1" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsFamilia" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004_Perdas_Familia" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idProdutoSecao" SessionField="sPRODUTO_SECAO" Type="Int16" />                           
                            </SelectParameters>
                        </asp:SqlDataSource>

                     
                     </div>

                    <div id="divBotaoGrafico">
                        <dx:ASPxButton ID="btnBotaoGrafico" runat="server" Text="Gerar Gráfico" Theme="MaterialCompactOrange" AutoPostBack="False" Visible="False">
                            <ClientSideEvents Click="UpdateDetailGraph" />
                        </dx:ASPxButton>
                    </div>

                    <div id="divDetail">
                    
                       <dx:ASPxGridView ID="gvDetail" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="adsProducts" EnableTheming="False" 
                           Theme="SoftOrange" ClientInstanceName="detailGridView" OnCustomCallback="gvDetail_CustomCallback"  >
                            
                            <Styles>
	                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                            <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Cell Font-Size="Small"></Cell>
                                <Footer Font-Bold="True"></Footer>
                            </Styles>

                            <SettingsPager PageSize="20">
                            </SettingsPager>

                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="425" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                           
                           <ClientSideEvents FocusedRowChanged="function(s, e) {
                                }
                                " RowDblClick="function(s, e) {
	                                OnGridFocusedRowChanged_Item();	
	                                UpdateDetailGraph();
                                }" />                                       
                           <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" ColumnResizeMode="Control" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="descId" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" FixedStyle="Left" Width="200px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False" Caption="Volume">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrVenda_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Vendas" Visible="False">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="precoMedio" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False" Caption="Preço Médio">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroCondor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="numCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False" Caption="Nº Clientes">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrCAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrMAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeDivergencia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeTotalPerda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <HeaderStyle BackColor="Red" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="22">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />

                            </TotalSummary>
                        </dx:ASPxGridView>

                       <dx:ASPxGridView ID="gvLojas" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="DSGrid2" EnableTheming="True" 
                           Theme="SoftOrange" ClientInstanceName="detailGridLojas" OnCustomCallback="gvLojas_CustomCallback" Visible="false"   >
                            
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>

                            <Styles>
	                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                            <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Cell Font-Size="Small"></Cell>
                                <Footer Font-Bold="True"></Footer>
                            </Styles>

                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                           
                                                                
                           <SettingsBehavior AllowFocusedRow="True" AllowClientEventsOnLoad="False" ColumnResizeMode="Control" />

                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="descId" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" FixedStyle="Left" Width="200px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrVenda_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Vendas">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroReal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroCondor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="numCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrCAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrMAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeDivergencia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeTotalPerda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle BackColor="Red" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                               
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />

                            </TotalSummary>
                        </dx:ASPxGridView>


                       <asp:SqlDataSource ID="adsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Buscar_Quebra_Venda_por_Loja_Item" SelectCommandType="StoredProcedure"  CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idProdutoSubgrupo" SessionField="sPRODUTO_SUBGRUPO" Type="Int16" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <%--<asp:ControlParameter ControlID="lblSecao" DbType="int16" Name="idProdutoSecao" PropertyName="Text"  />--%>
                                
                            </SelectParameters>
                        </asp:SqlDataSource>                     
                                           
                       <asp:SqlDataSource ID="DSGrid2" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="vw_Venda_por_Secao_Loja_a_Loja" SelectCommandType="StoredProcedure"  CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idProdutoSecao" SessionField="sPRODUTO_SECAO" Type="Int16" />
                                <%--<asp:ControlParameter ControlID="lblSecao" DbType="int16" Name="idProdutoSecao" PropertyName="Text"  />--%>
                                
                            </SelectParameters>
                        </asp:SqlDataSource>              
                     
                    </div>   
                        
                    <div id=divTituloGrafico>
                        <dx:ASPxLabel ID="lblTituloGrafico" runat="server"  ClientInstanceName="lblTituloGrafico" Font-Size="Larger" ></dx:ASPxLabel>
                    </div>
                    <div id="div_Grafico">

                        <dx:WebChartControl ID="graph_item" runat="server" DataSourceID="dsGrafico" Width="1700px" Height="600px" SideBySideBarDistanceFixed="0" ClientInstanceName="Detail_Graph">

                            <DiagramSerializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" visibility="True" title-font="Tahoma, 9.75pt">
                                        <qualitativescaleoptions autogrid="False" />
                                        <autoscalebreaks maxcount="1" />
                                        <tickmarks minorvisible="False" />
                                        <label angle="90">
                                        <resolveoverlappingoptions allowhide="False" minindent="10" />
                                        </label>
                                        <gridlines visible="True"></gridlines><numericscaleoptions autogrid="False" />
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1" visibility="False">
                                    <gridlines visible="False"></gridlines></axisy>
                                </cc1:XYDiagram>
                            </DiagramSerializable>
<Legend Name="Default Legend" Visibility="False"></Legend>
                            <SeriesSerializable>
                                <cc1:Series ArgumentDataMember="FilialDesc" ArgumentScaleType="Qualitative" Name="Média de Quebras" ValueDataMembersSerializable="percPerdaMedia">
                                <viewserializable>
                                    <cc1:AreaSeriesView Color="105, 79, 129, 189" MarkerVisibility="False" Transparency="150">
                                    </cc1:AreaSeriesView>
                                </viewserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="FilialDesc" LabelsVisibility="True" Name="Realizado" SeriesPointsSorting="Ascending" SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="vlrTotalPerda" ArgumentScaleType="Qualitative" LegendName="Default Legend">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Color="151, 244, 2, 0">
                                        </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:n2 }" LineLength="5" ResolveOverlappingMode="Default" BackColor="238, 236, 225" Font="Arial, 8pt" Indent="6">
                                        <border visibility="True" /><fillstyle fillmode="Empty"></fillstyle></cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                </cc1:Series>
                            </SeriesSerializable>

                        </dx:WebChartControl>

                        <asp:SqlDataSource ID="dsGrafico" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Buscar_Quebra_Item_Todas_Lojas" SelectCommandType="StoredProcedure"  CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

      

        <dx:ASPxCallbackPanel ID="cbPanelSecao" runat="server" Width="100%" ClientInstanceName="cbPanelSecao" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                            
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttributes="both">

                        <asp:Label ID="lblInfo" runat="server" Text="" Visible="false" ></asp:Label>
                        <dx:ASPxLabel ID="lblTipoFilial" runat="server" Text="" ClientInstanceName="lblTipoFilial"  Visible="false"></dx:ASPxLabel>

                         <dx:ASPxTextBox ID="lblSecao" runat="server" Width="100px" ClientInstanceName="label" ReadOnly="True"  Visible="false"> <Border BorderStyle="None" />
                        </dx:ASPxTextBox>

                        <dx:ASPxTextBox ID="lblProduto" runat="server" Width="100px" ClientInstanceName="lblProduto" ReadOnly="True"  Visible="false"> <Border BorderStyle="None" />
                        </dx:ASPxTextBox>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: DW_Condor_One" Anotacao2="Stored Procedure: Vendas_Dia.SLV004" />

    </div>
   
</asp:Content>

