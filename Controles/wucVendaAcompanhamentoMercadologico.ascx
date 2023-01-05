<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucVendaAcompanhamentoMercadologico.ascx.vb" Inherits="Controles_wucVendaAcompanhamentoMercadologico" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>




<style type ="text/css" >       

        .divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 7px;
            margin-bottom: 2px;
        }

      
        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divDadosOntem {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    .divContainer {        
        float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;        
        margin-left: 4px; 
        width:auto;
        padding-bottom: 10px;  
        background-color :cornsilk;      
    }

    </style>

<div class ="divContainer">

     <div class="divFilial" >
         <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialOntem" />
    </div>

    <div id="divDadosOntem">
        <dx:ASPxCallbackPanel ID="cbPanelOntem" runat="server" Width="100%" ClientInstanceName="cbPanelOntem" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                  <dx:ASPxGridView ID="gridOntem" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dsVendaPorHoraOntem" EnableTheming="True" KeyFieldName="descHI" 
        Theme="DevEx" Width="390px">
                    <Columns>

                          <dx:GridViewDataTextColumn Caption="Horário <br> das" FieldName="descHI" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                              <CellStyle HorizontalAlign="Center">
                                  <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                              </CellStyle>


                          </dx:GridViewDataTextColumn>
                          
                          <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" VisibleIndex="1">
                            <Columns>                           
                                  <dx:GridViewDataTextColumn Caption="Venda" FieldName="Real" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn Caption="Venda Hora" FieldName="vlrVendaHora" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                      <CellStyle ForeColor="Blue">
                                      </CellStyle>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                      <CellStyle ForeColor="Blue">
                                          <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                      </CellStyle>
                                  </dx:GridViewDataTextColumn>
                              </Columns>
                          </dx:GridViewBandColumn>


                            <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargem" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsBehavior AllowFocusedRow="True" /><SettingsPager Mode="ShowAllRecords"></SettingsPager>
        <Settings ShowTitlePanel="True" /><SettingsText Title="Venda de Ovos de Pascoa por Hora - Hoje" 
            EmptyDataRow="Disponível à partir das 09:30" /><Styles><Header HorizontalAlign="Center"></Header>
            <TitlePanel Font-Size="Medium"></TitlePanel>
                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>

        </Styles>
    </dx:ASPxGridView>
                        
                  <asp:SqlDataSource ID="dsVendaPorHoraOntem" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="web_VendaPorHora_Mercadologico" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIAONTEM" />
            <asp:SessionParameter DbType="Byte" Name="idFilial" SessionField="sFILIAL" />
        </SelectParameters>
        </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
     
        </div>  

</div>



<div class ="divContainer">

    <div class="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
cbPanel.PerformCallback();
cbPanelOntem.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                  <dx:ASPxGridView ID="gridHoras" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dsVendaPorHora" EnableTheming="True" KeyFieldName="descHI" 
        Theme="DevEx" Width="390px">
                    <Columns>

                          <dx:GridViewDataTextColumn Caption="Horário <br> das" FieldName="descHI" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                              <CellStyle HorizontalAlign="Center">
                                  <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                              </CellStyle>


                          </dx:GridViewDataTextColumn>
                          
                          <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" VisibleIndex="1">
                            <Columns>                           
                                  <dx:GridViewDataTextColumn Caption="Venda" FieldName="Real" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn Caption="Venda Hora" FieldName="vlrVendaHora" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                      <CellStyle ForeColor="Blue">
                                      </CellStyle>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px">
                                      <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                      </PropertiesTextEdit>
                                      <CellStyle ForeColor="Blue">
                                          <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                      </CellStyle>
                                  </dx:GridViewDataTextColumn>
                              </Columns>
                          </dx:GridViewBandColumn>


                            <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargem" ShowInCustomizationForm="True" VisibleIndex="6" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                          </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsBehavior AllowFocusedRow="True" /><SettingsPager Mode="ShowAllRecords"></SettingsPager>
        <Settings ShowTitlePanel="True" /><SettingsText Title="Venda de Ovos de Pascoa por Hora - Hoje" 
            EmptyDataRow="Disponível à partir das 09:30" /><Styles><Header HorizontalAlign="Center"></Header>
            <TitlePanel Font-Size="Medium"></TitlePanel>
                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>

        </Styles>
    </dx:ASPxGridView>
                        
    <asp:SqlDataSource ID="dsVendaPorHora" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="web_VendaPorHora_Mercadologico" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
            <asp:SessionParameter DbType="Byte" Name="idFilial" SessionField="sFILIAL" />
        </SelectParameters>
        </asp:SqlDataSource>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
     
        </div>  

</div>

