<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AvariasAnalise.aspx.vb" Inherits="MemberPages_Checklist_AvariasAnalise" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

   
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/AdminLTE.min.css" rel="stylesheet" />
    
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    


      <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

 <script lang="javascript" type ="text/javascript">

     

     function OnGridFocusedRowChanged() {
         grid.GetRowValues(grid.GetFocusedRowIndex(), 'CODPRODUTO;nomeProduto;NROSERIE;VLRCSTCOML;VLRPRECOVENDA;PRECOVENDA;MRGVENDA;DataInclusao;DataDesativacao;Ativo;Fornecedor;NIVELAVARIA;Observacao;Observacao1', OnGetRowValues);
     }


     function OnGetRowValues(values) {

         lblHost.SetText(values[0]);
         lblNomeProduto.SetText(values[1]);
         lblSerie.SetText(values[2]);
         lblCustoComercial.SetText(values[3]);
         lblPrecoPraticado.SetText(values[4]);
         lblPrecoCampanha.SetText(values[5]);
         lblPercMargem.SetText(values[6]);
         lblDiaAtivacao.SetText(values[7]);
         lblDiaDesativacao.SetText(values[8]);
         btnForaLinha.SetText(values[9]);
         lblFornecedor.SetText(values[10]);
         lblNivelAvaria.SetText(values[11]);         
         lblObservacao.SetText(values[12]);
         txtObservacao.SetText(values[13]);
                 
         //alert(values[1]);
         // Parte 3
         //txtCadIE.SetText(values[1]);
         //DetailNotes.SetText("~/image/Concorrentes/" + values[3]);
         //DetailImage.SetVisible(true);
         //DetailImage.SetImageUrl("~//image//Concorrentes//" + values[3]);
         
         //txtOnde.SetText(values[3]);
         //txtComo.SetText(values[4]);
         //txtQuanto.SetText(values[5]);
         //txtOque.SetText(values[6]);
         //txtStatusTarefa.SetText(values[7]);
     }

     
    function ASPxComboBoxPOs_SelectedIndexChanged(s, e) {
        var item = s.GetSelectedItem();
        var idCampanha = item.GetColumnText("idCampanha");
        var diaInicio = item.GetColumnText("DTAINICIO");
        var diaFim = item.GetColumnText("DTAFIM");
        var situacao = item.GetColumnText("SITUACAO");
      
        lblDiaInicial.SetText(" " + diaInicio + " à " + diaFim);
        btnSituacao.SetText(situacao);

    }

    function OnInit(s, e) {
        grid.SetFocusedRowIndex(0);
    }
         
    </script>
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">        
        
        <div class="row">

            <div class="col-md-2">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false" AutoPostBack ="true" />
            </div>

            <div class="col-md-1" style="text-align:right">
                Campanha:
            </div>
            <div class="col-md-5"  style="text-align:left">
                  <dx:ASPxComboBox ID="cboCampanha" runat="server" ClientInstanceName="cboCampanha" DataSourceID="dsListaCampanha" EnableIncrementalFiltering="True" EnableTheming="True" HorizontalAlign="Left" IncrementalFilteringMode="StartsWith" TextField="idCampanha" Theme="Metropolis" ValueField="idCampanha" Width="400px" DropDownRows="15">
              <ClientSideEvents SelectedIndexChanged="function(s, e) {
                  ASPxComboBoxPOs_SelectedIndexChanged(s, e);
	              lblNumeroCampanha.SetText(s.GetSelectedItem().value);  
                                 
				cbPanelMaster.PerformCallback();
                  
                }" />
              <Columns>
                  <dx:ListBoxColumn Caption="Campanha" FieldName="idCampanha" Name="Campanha" />
                  <dx:ListBoxColumn Caption="Filial" FieldName="nomeFilialLista" Name="Filial" />
                  <dx:ListBoxColumn Caption="Inicio" FieldName="DTAINICIO" Name="Inicio" />
                  <dx:ListBoxColumn Caption="Fim" FieldName="DTAFIM" Name="Final" />
                  <dx:ListBoxColumn Caption="Situação" FieldName="SITUACAO" Name="Situacao" />
              </Columns>
            </dx:ASPxComboBox>
                  <asp:SqlDataSource ID="dsListaCampanha" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="usp_ListaCampanhaAvaria" SelectCommandType="StoredProcedure">
                        <SelectParameters>                                
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                             
                        </SelectParameters>
                  </asp:SqlDataSource>
            </div>
        </div>            
        
     
      <h1>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Vendas</a></li>
        <li class="active">Avarias</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Campanha</h3>
            </div>
            <div class="box-body box-profile">
              
              <h3 class="profile-username text-center">Número: <span><b><dx:ASPxLabel ID="lblNumeroCampanha" runat="server" ClientInstanceName="lblNumeroCampanha" CssClass="profile-username" ></dx:ASPxLabel></b></span></h3>

              <p class="text-center"><span><b>Período:</b></span><dx:ASPxLabel ID="lblDiaInicial" runat="server" ClientInstanceName="lblDiaInicial"  Font-Bold="true"></dx:ASPxLabel></p>
                            
              <a><b><dx:ASPxButton ID="btnSituacao" runat="server" ClientInstanceName="btnSituacao" CssClass="btn btn-primary btn-block" Native="true" AutoPostBack="False" ></dx:ASPxButton></b></a>
     
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Produto</h3>
            </div>
            <div class="box-body box-profile">
              
              <h3 class="text-center"><dx:ASPxLabel ID="lblNomeProduto" runat="server" ClientInstanceName="lblNomeProduto" CssClass="profile-username"></dx:ASPxLabel></h3>

              <p class="text-center"><span><b>Número de Série:&nbsp</b></span><dx:ASPxLabel ID="lblSerie" runat="server" ClientInstanceName="lblSerie" CssClass="text-muted"></dx:ASPxLabel></p>

              <p class="text-center"><span><b>Código do Produto:&nbsp</b></span><dx:ASPxLabel ID="lblHost" runat="server" ClientInstanceName="lblHost" CssClass="text-muted"></dx:ASPxLabel></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Nivel Avaria</b> <a class="pull-right"><dx:ASPxLabel ID="lblNivelAvaria" runat="server" ClientInstanceName="lblNivelAvaria" Font-Bold="true" ViewStateMode="Enabled"></dx:ASPxLabel></a>
                </li>
                <li class="list-group-item">
                  <b>Custo Comercial</b> <a class="pull-right"><dx:ASPxLabel ID="lblCustoComercial" runat="server" ClientInstanceName="lblCustoComercial" Font-Bold="true" ViewStateMode="Enabled"></dx:ASPxLabel></a>
                </li>
                <li class="list-group-item">
                  <b>Preço Praticado</b> <a class="pull-right"><dx:ASPxLabel ID="lblPrecoPraticado" runat="server" ClientInstanceName="lblPrecoPraticado" Font-Bold="true"></dx:ASPxLabel></a>
                </li>
                <li class="list-group-item">
                  <b>Preço Campanha</b> <a class="pull-right"><dx:ASPxLabel ID="lblPrecoCampanha" runat="server" ClientInstanceName="lblPrecoCampanha" Font-Bold="true"></dx:ASPxLabel></a>
                </li>
                <li class="list-group-item">
                  <b>Margem</b> <a class="pull-right"><dx:ASPxLabel ID="lblPercMargem" runat="server" ClientInstanceName="lblPercMargem" Font-Bold="true"></dx:ASPxLabel> %</a>
                </li>
                <li class="list-group-item">
                  <strong><i class="fa fa-calendar-check-o"></i> Dia Ativação</strong> <a class="pull-right"><dx:ASPxLabel ID="lblDiaAtivacao" runat="server" ClientInstanceName="lblDiaAtivacao" Font-Bold="true"></dx:ASPxLabel></a>
                </li>
                <li class="list-group-item">
                  <strong><i class="fa fa-calendar-times-o"></i> Dia Desativação</strong> <a class="pull-right"><dx:ASPxLabel ID="lblDiaDesativacao" runat="server" ClientInstanceName="lblDiaDesativacao" Font-Bold="true"></dx:ASPxLabel></a>
                </li>
              </ul>

              
              <a><b><dx:ASPxButton ID="btnForaLinha" runat="server" ClientInstanceName="btnForaLinha" CssClass="btn btn-danger btn-block" Native="true" AutoPostBack="False" ></dx:ASPxButton></b></a>
              
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Dados do Produto</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

              <strong><i class="fa fa-truck"></i> Fornecedor</strong>
              <p><dx:ASPxLabel ID="lblFornecedor" runat="server" ClientInstanceName="lblFornecedor" CssClass="text-muted"></dx:ASPxLabel></p>
              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Observação</strong>

              <p>...</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Produtos da Campanha</a></li>
              <li><a href="#timeline" data-toggle="tab">Produto por Loja</a></li>
              <li><a href="#settings" data-toggle="tab">Venda Avarias</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <!-- Post -->
                <div class="post">
                 <%--cpPanelImagem.PerformCallback();--%>
                  
                      <dx:ASPxCallbackPanel ID="cbPanelMaster" ClientInstanceName="cbPanelMaster" runat="server" Width="99%">
                          <PanelCollection>
                              <dx:PanelContent>

                                  <asp:Label ID="lblError"  runat="server" ></asp:Label>   

                                  <dx:ASPxGridView ID="gvMaster" runat="server" width="99%" DataSourceID="dsDados" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" ClientInstanceName="grid" KeyFieldName="CODPRODUTO">
                                      <ClientSideEvents FocusedRowChanged="function(s, e) {
                                               OnGridFocusedRowChanged();
   			
                                            }" DetailRowExpanding="function(s, e) {
		
                                            }" EndCallback="function(s, e) {
	                                            cpPanelImagem.PerformCallback();
                                            }" />
                                      <Columns>
                                          <dx:GridViewDataTextColumn FieldName="CODPRODUTO" VisibleIndex="0" Caption="Host" FixedStyle="Left" Width="70px">
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="1" Caption="Descrição do Produto" FixedStyle="Left" Width="200px">
                                              <CellStyle Wrap="False">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="NROSERIE" VisibleIndex="2" Caption="Série">
                                              <CellStyle Wrap="False">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="NIVELAVARIA" VisibleIndex="3" Caption="Nivel" Width="60px">
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="VLRCSTCOML" VisibleIndex="4" Caption="Custo &lt;br/&gt;Comercial" ToolTip="Valor do Custo Comercial" Width="90px">
                                              <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                              </PropertiesTextEdit>
                                              <CellStyle HorizontalAlign="Right">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="PRECOVENDA" VisibleIndex="5" Caption="Preço &lt;br/&gt; Venda" Width="90px">
                                              <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                              </PropertiesTextEdit>
                                              <CellStyle HorizontalAlign="Right">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="MRGVENDA" VisibleIndex="6" Caption="% da &lt;br/&gt;Margem" Width="70px">
                                              <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                              </PropertiesTextEdit>
                                              <CellStyle HorizontalAlign="Right">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="Fornecedor" ReadOnly="True" VisibleIndex="7" Width="150px">
                                              <CellStyle Wrap="False">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="8" Caption="Data da &lt;br/&gt; Inclusão" Width="85px">
                                          </dx:GridViewDataDateColumn>
                                          <dx:GridViewDataDateColumn FieldName="DataDesativacao" VisibleIndex="9" Caption="Data da &lt;br/&gt; Desativação" Width="85px">
                                          </dx:GridViewDataDateColumn>
                                          <dx:GridViewDataTextColumn FieldName="Ativo" VisibleIndex="10">
                                              <CellStyle Wrap="False">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="VLRPRECOVENDA" VisibleIndex="11" Caption="Preço &lt;br/&gt; Praticado" Width="90px">
                                              <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                              </PropertiesTextEdit>
                                              <CellStyle HorizontalAlign="Right">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="QtdeEstoque" VisibleIndex="12" Caption="Qtde &lt;br/&gt; Estoque" Width="60px">
                                              <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                              </PropertiesTextEdit>
                                              <CellStyle HorizontalAlign="Center">
                                              </CellStyle>
                                          </dx:GridViewDataTextColumn>
                                          <dx:GridViewDataTextColumn FieldName="SITUACAO" VisibleIndex="16" Visible="False">
                                          </dx:GridViewDataTextColumn>
                       
                                          <dx:GridViewDataTextColumn FieldName="idCampanha" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Campanha" Width="50px">
                                          </dx:GridViewDataTextColumn>
                       
                                          <dx:GridViewDataTextColumn FieldName="Observacao" ShowInCustomizationForm="True" VisibleIndex="14" Width="20px" Visible="False">
                                          </dx:GridViewDataTextColumn>
                       
                                          <dx:GridViewDataTextColumn FieldName="Observacao1" ShowInCustomizationForm="True" VisibleIndex="13" Width="50px" Visible="False">
                                          </dx:GridViewDataTextColumn>
                       
                                      </Columns>
                                      <ClientSideEvents Init="OnInit" />
                                      <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                      <SettingsPager Mode="ShowAllRecords">
                                      </SettingsPager>
                                      <Settings HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
                                      <SettingsText EmptyDataRow="Não há nenhum produto para esta Campanha." />
                                      <Styles>
                                          <Header HorizontalAlign="Center">
                                          </Header>
                                          <AlternatingRow BackColor="#E8E8E8">
                                          </AlternatingRow>
                                          <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                          </FocusedRow>
                                      </Styles>
                                  </dx:ASPxGridView>
                                  <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.uspBuscarAvarias" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                
                                            <asp:ControlParameter Name="idCampanha" ControlID="cboCampanha"   DbType="Int32" />                              
                                        </SelectParameters>
                                  </asp:SqlDataSource>

                                  <div id="opcaoSalvar" runat="server">

                                      <br />
                            
                                    <div class="row" style="padding-bottom:5px; ">
                                        <div class="col-sm-3">
                                            <dx:ASPxCheckBox ID="chkIncluirImagens" runat="server" Text="Incluir Imagens" Theme="DevEx" Checked="True" CheckState="Checked"></dx:ASPxCheckBox>
                                        </div>
                                        <div class="col-sm-3">
                                            <dx:ASPxCheckBox ID="chkObservacao" runat="server" Text="Incluir Observação" Theme="DevEx" Checked="True" CheckState="Checked"></dx:ASPxCheckBox>
                                        </div>
                                    </div>                    
                                            
                                      <div class="row margin-bottom">
                                                <div class="col-sm-4">
                                                     
                                                    <asp:FileUpload ID="upFile1_1" runat="server" CssClass="btn btn-primary" />
                                                    <div id=Div1 style="clear:both; padding-left: 325px; margin-top: -35px ">
                                                            <dx:ASPxButton ID="btnSalvarImagem1" runat="server" Text="Salvar Imagem 1" CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarImagem1" ></dx:ASPxButton>    
                                                    </div>
                                           
                                                    <div style="padding-top:3px"></div>

                                                    <asp:FileUpload ID="upFile1_2" runat="server" CssClass="btn btn-primary" />
                                                    <div id=Div2 style="clear:both; padding-left: 325px; margin-top: -35px ">
                                                            <dx:ASPxButton ID="btnSalvarImagem2" runat="server" Text="Salvar Imagem 2" CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarImagem2" ></dx:ASPxButton>    
                                                    </div>
                                                    <div style="padding-top:3px"></div>

                                                    <asp:FileUpload ID="upFile1_3" runat="server" CssClass="btn btn-primary" />
                                                    <div id=Div3 style="clear:both; padding-left: 325px; margin-top: -35px ">
                                                            <dx:ASPxButton ID="btnSalvarImagem3" runat="server" Text="Salvar Imagem 3" CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarImagem3" ></dx:ASPxButton>    
                                                    </div>
                                                    <div style="padding-top:3px"></div>

                                                    <asp:FileUpload ID="upFile1_4" runat="server" CssClass="btn btn-primary" />                                              
                                                    <div id=Div4 style="clear:both; padding-left: 325px; margin-top: -35px ">
                                                            <dx:ASPxButton ID="btnSalvarImagem4" runat="server" Text="Salvar Imagem 4" CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarImagem4" ></dx:ASPxButton>    
                                                    </div>
                                                    <div style="padding-top:3px"></div>
                   
                                                <!-- /.col -->
                                              </div>

                                          <!-- /.row -->

                                            <br />

                                            <div id=idObservacao style="clear:both; padding-left: 15px; padding-top: 10px ">
                                                <%--<asp:TextBox ID="txtObservacao" runat="server" TextMode="MultiLine" Width="500px" Height="100px" placeholder="Digite aqui uma observação sobre a Avaria..."></asp:TextBox>                     --%>
                                                <dx:ASPxMemo ID="txtObservacao" ClientInstanceName="txtObservacao" runat="server" Height="100px" Width="500px" placeholder="Digite aqui uma observação sobre a Avaria..." AutoResizeWithContainer="True" Native="True"></dx:ASPxMemo>

                                                <br />
                                                <dx:ASPxLabel ID="lblStatus" runat="server" CssClass="label label-warning" ClientInstanceName="lblStatus"></dx:ASPxLabel>            
                   
                                                    <div id=idSalvar style="clear:both; padding-left: 1px; padding-top: 5px ">
                                                            <dx:ASPxButton ID="btnSalvarImagem" runat="server" Text="Salvar Imagem" CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarImagem" Enabled="False"  >
                                                            </dx:ASPxButton>
                                                    </div>
                                            </div>

                                        </div>
                
                                  </div>

                                  <div style="padding-top: 10px">                                 
                                    <dx:ASPxButton ID="btnSalvarRicardo" runat="server" Text="Aprovar"  CssClass="btn btn-success" Native="True" ClientInstanceName="btnSalvarRicardo" ></dx:ASPxButton>
                                  </div>
                <br />
                <div id="divObservacao" runat="server" class="post">
                  <div class="user-block">              
                          <a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp Observações do Produto Avariado</a>
                      <div class="margin-bottom">
                          <div class="col-sm-12">
                              <dx:ASPxLabel ID="lblObservacao" ClientInstanceName="lblObservacao" runat="server" Font-Italic="true"  Font-Size="Large" ForeColor="Blue"  ></dx:ASPxLabel>  
                          </div>
                      </div>
                                               
                  </div>
                 </div>

                
                <div class="post">
                  <div class="user-block">              
                          <a href="#"><span class="glyphicon glyphicon-camera"></span>&nbsp Fotos do Produto Avariado</a>                         
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-12">   
                           
                                  
                        <dx:ASPxCallbackPanel ID="cpPanelImagem" runat="server" ClientInstanceName="cpPanelImagem" Width="99%">
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server">
                                
                                    
                                <dx:ASPxGridView ID="gvDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsImage" Width="99%" ClientInstanceName="gvDetail">
                                    <Columns>
                                        <dx:GridViewDataBinaryImageColumn FieldName="Pic1" VisibleIndex="0" Caption="Imagem do produto selecionado.">
                                            <PropertiesBinaryImage StoreContentBytesInViewState="True">
                                                <Style Wrap="True">
                                                </Style>
                                            </PropertiesBinaryImage>
                                            <CellStyle Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataBinaryImageColumn>

                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
                                    <SettingsText EmptyDataRow="Não nenhuma imagem para o produto selecionado." />
                                </dx:ASPxGridView>
                        
                                <asp:SqlDataSource ID="dsImage" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscarFoto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                        <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                        <asp:SessionParameter Name="numSerie" SessionField="sNUM_SERIE" Type="String" />                                    
                                        
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        
                                  <br />
<%--                          <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                        <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                        <asp:SessionParameter Name="numSerie" SessionField="sNUM_SERIE" Type="String" />--%>

                                                                      

                                 </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel> 

                    </div>
                   
                    <!-- /.col -->
                  </div>
          
                </div>


                              </dx:PanelContent>
                          </PanelCollection>
                      </dx:ASPxCallbackPanel>
                  
                    <%--<asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Int32" /> --%>
                </div>
                <!-- /.post -->
            
<%--                  <div id="opcaoSalvar" runat="server">

                  
            <div class="row" style="padding-bottom:5px; ">
                <div class="col-sm-2">
                    <dx:ASPxCheckBox ID="chkIncluirImagens" runat="server" Text="Incluir Imagens" Theme="DevEx" Checked="True" CheckState="Checked"></dx:ASPxCheckBox>
                </div>
                <div class="col-sm-2">
                    <dx:ASPxCheckBox ID="chkObservacao" runat="server" Text="Incluir Observação" Theme="DevEx" Checked="True" CheckState="Checked"></dx:ASPxCheckBox>
                </div>
            </div>
            <div class="row margin-bottom">
                    <div class="col-sm-4">   
                        <asp:FileUpload ID="upFile1_1" runat="server" CssClass="btn btn-primary" />
                        <asp:FileUpload ID="upFile1_2" runat="server" CssClass="btn btn-primary" />
                        <asp:FileUpload ID="upFile1_3" runat="server" CssClass="btn btn-primary" />
                        <asp:FileUpload ID="upFile1_4" runat="server" CssClass="btn btn-primary" />
                                                
                    
                   
                    <!-- /.col -->
                  </div>
                  <!-- /.row -->

                    <br />

                    <div id=idObservacao style="clear:both; padding-left: 15px; padding-top: 10px ">
                        <asp:TextBox ID="txtObservacao" runat="server" TextMode="MultiLine" Width="500px" Height="100px" placeholder="Digite aqui uma observação sobre a Avaria..."></asp:TextBox>                     
                                        
                        <br />
                        <dx:ASPxLabel ID="lblStatus" runat="server" CssClass="label label-warning" ClientInstanceName="lblStatus"></dx:ASPxLabel>
                        
                                                
                    
                   
                    <div id=idSalvar style="clear:both; padding-left: 1px; padding-top: 5px ">
                            <dx:ASPxButton ID="btnSalvarImagem" runat="server" Text="Salvar Imagem" CssClass="btn btn-success" Native="False" ClientInstanceName="btnSalvarImagem" Visible="False"  >
                            </dx:ASPxButton>
                    </div>
                </div>
        

                </div>
                
                  </div>--%>

                <!-- Post -->
<%--                <div class="post">
                  <div class="user-block">              
                          <a href="#"><span class="glyphicon glyphicon-camera"></span>&nbsp Fotos do Produto Avariado</a>                         
                  </div>
                  <!-- /.user-block -->
                  <div class="row margin-bottom">
                    <div class="col-sm-12">   
                                       
                        <dx:ASPxCallbackPanel ID="cpPanelImagem" runat="server" ClientInstanceName="cpPanelImagem" Width="99%">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
   
                                <dx:ASPxGridView ID="gvDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsImage" Width="99%" ClientInstanceName="gvDetail">
                                    <Columns>
                                        <dx:GridViewDataBinaryImageColumn FieldName="Pic1" VisibleIndex="0" Caption="Imagem do produto selecionado.">
                                            <PropertiesBinaryImage StoreContentBytesInViewState="True">
                                                <Style Wrap="True">
                                                </Style>
                                            </PropertiesBinaryImage>
                                            <CellStyle Wrap="True">
                                            </CellStyle>
                                        </dx:GridViewDataBinaryImageColumn>

                                    </Columns>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
                                    <SettingsText EmptyDataRow="Não nenhuma imagem para o produto selecionado." />
                                </dx:ASPxGridView>
                        
                                <asp:SqlDataSource ID="dsImage" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscarFoto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                        <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                        <asp:SessionParameter Name="numSerie" SessionField="sNUM_SERIE" Type="String" />
                                    </SelectParameters>
                                            </asp:SqlDataSource>
                        
                                  <br />

                                  <asp:Label ID="lblError"  runat="server" Font-Size="Large"></asp:Label>                                       

                                 </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel> 

                    </div>
                   
                    <!-- /.col -->
                  </div>
          
                </div>--%>
                <!-- /.post -->
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">

                </ul>
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="settings">
                <form class="form-horizontal">
                  <div class="form-group">
                    
                    
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>   
    <script src="../../plugins/fastclick/fastclick.min.js"></script>   
    <script src="../../dist/js/app.min.js"></script>
    <script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    
    <script src="../../dist/js/pages/dashboard2.js"></script>
    <script src="../../dist/js/demo.js"></script>

</asp:Content>

