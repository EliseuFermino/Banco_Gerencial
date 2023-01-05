<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteResultados.master" AutoEventWireup="false" CodeFile="PontaGondola.aspx.vb" Inherits="MemberPages_ContasReceber_PontaGondola" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../css/css_Filial_Objeto_Ano_Mes.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />

    <div id="div_Filial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"  />
    </div>


<div id="div_Objeto">

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab"><span class="font_size_14">por Mês</span> </a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"><span class="font_size_14">por Ano</span></a></li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab"><span class="font_size_14">Messages</span></a></li>
    <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab"><span class="font_size_14">Settings</span></a></li>
  </ul>

  <!-- Tab panes -->
  

      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          <ContentTemplate>

<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">

        <div class="div_Ano">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="div_Mes">
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>

        <div>
            <dx:ASPxGridView ID="gridPG_por_Mes_Selecionado" runat="server" AutoGenerateColumns="False" DataSourceID="dsPG_por_Mes_Selecionado" EnableTheming="True" Theme="SoftOrange" Font-Size="13px" KeyFieldName="numCondicao " Width="800px">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrOriginal" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                    <dx:GridViewDataTextColumn FieldName="numTitulo" VisibleIndex="9" Caption="Titulo" ToolTip="Número do Titulo no Contas à Receber" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="numParcela" VisibleIndex="4" Caption="Parcela" FixedStyle="Left" ToolTip="Número da Parcela Atual " Width="55px">
                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="numCondicao" VisibleIndex="3" Caption="Condição" FixedStyle="Left" ToolTip="Número da Condição Especial gerado pelo Trade-Marketing" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idCliente" VisibleIndex="1" Caption="Fornecedor" FixedStyle="Left" ToolTip="Código do Fornecedor" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nomeFornecedor" VisibleIndex="2" Caption="Descrição do Fornecedor" FixedStyle="Left" ToolTip="Nome do Fornecedor" Width="175px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaEntrada" VisibleIndex="5" Caption="Efetivação" ToolTip="Data de Efetivação pelo Contas à Receber. OBS: Data que foi digitado no Contas à Receber. (Data de Entrada)" Width="90px">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaVencimento" VisibleIndex="6" Caption="Vencimento" ToolTip="Data de Vencimento da Parcela. Essa data é definida pelo Trade-Marketing junto com o Fornecedor no momento do fechamento do Acordo Comercial de Ponta de Gondola." Width="95px" SortIndex="0" SortOrder="Ascending">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="vlrOriginal" VisibleIndex="7" Caption="vlr. Parcela" ToolTip="Valor da Parcela">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="situacaoTitulo" VisibleIndex="8" Caption="Situação" ToolTip="Situação do Titulo - ABERTO ou PAGO." Width="70px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaPagamento" VisibleIndex="10" Caption="Pagamento" ToolTip="Dia em que o Fornecedor efetuou o pagamento." Width="90px">
                    </dx:GridViewDataDateColumn>
                </Columns>

                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" ShowFilterBar="Auto" ShowFilterRow="True" />
                <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período e loja" FilterBarClear="Limpar" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#E1E1E1">
                    </AlternatingRow>
                    <FocusedRow BackColor="Yellow" ForeColor="Blue">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                </Styles>

            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsPG_por_Mes_Selecionado" runat="server" ConnectionString="<%$ ConnectionStrings:ger14_ContasReceberConnectionString2 %>" SelectCommand="usp_PontaDeGondola_Todas_por_Mes_Selecionado" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


    </div>

 

    <div role="tabpanel" class="tab-pane" id="profile">
       
        <div class="div_Ano">
            <uc1:wucAno runat="server" ID="cboAno1" />
        </div>

        <div>
            <dx:ASPxGridView ID="gridPG_por_Ano_Selecionado" runat="server" AutoGenerateColumns="False" DataSourceID="dsPG_por_Ano_Selecionado" EnableTheming="True" Theme="SoftOrange" Font-Size="13px" KeyFieldName="numCondicao " Width="800px">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrOriginal" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                    <dx:GridViewDataTextColumn FieldName="numTitulo" VisibleIndex="9" Caption="Titulo" ToolTip="Número do Titulo no Contas à Receber" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="numParcela" VisibleIndex="4" Caption="Parcela" FixedStyle="Left" ToolTip="Número da Parcela Atual " Width="55px">
                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="numCondicao" VisibleIndex="3" Caption="Condição" FixedStyle="Left" ToolTip="Número da Condição Especial gerado pelo Trade-Marketing" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idCliente" VisibleIndex="1" Caption="Fornecedor" FixedStyle="Left" ToolTip="Código do Fornecedor" Width="80px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nomeFornecedor" VisibleIndex="2" Caption="Descrição do Fornecedor" FixedStyle="Left" ToolTip="Nome do Fornecedor" Width="175px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaEntrada" VisibleIndex="5" Caption="Efetivação" ToolTip="Data de Efetivação pelo Contas à Receber. OBS: Data que foi digitado no Contas à Receber. (Data de Entrada)" Width="90px">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaVencimento" VisibleIndex="6" Caption="Vencimento" ToolTip="Data de Vencimento da Parcela. Essa data é definida pelo Trade-Marketing junto com o Fornecedor no momento do fechamento do Acordo Comercial de Ponta de Gondola." Width="95px" SortIndex="0" SortOrder="Ascending">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="vlrOriginal" VisibleIndex="7" Caption="vlr. Parcela" ToolTip="Valor da Parcela">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="situacaoTitulo" VisibleIndex="8" Caption="Situação" ToolTip="Situação do Titulo - ABERTO ou PAGO." Width="70px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DiaPagamento" VisibleIndex="10" Caption="Pagamento" ToolTip="Dia em que o Fornecedor efetuou o pagamento." Width="90px">
                    </dx:GridViewDataDateColumn>
                </Columns>

                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" ShowFilterBar="Auto" ShowFilterRow="True" />
                <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período e loja" FilterBarClear="Limpar" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#E1E1E1">
                    </AlternatingRow>
                    <FocusedRow BackColor="Yellow" ForeColor="Blue">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                </Styles>

            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsPG_por_Ano_Selecionado" runat="server" ConnectionString="<%$ ConnectionStrings:ger14_ContasReceberConnectionString2 %>" SelectCommand="usp_PontaDeGondola_Todas_por_Ano_Selecionado" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                  
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>


    </div>
    <div role="tabpanel" class="tab-pane" id="messages">...dos</div>
    <div role="tabpanel" class="tab-pane" id="settings">...Santos</div>
  </div>
         </ContentTemplate>
      </asp:UpdatePanel>

</div>


    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>



</asp:Content>


