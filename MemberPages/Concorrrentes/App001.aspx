<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="App001.aspx.vb" Inherits="MemberPages_Concorrrentes_App001" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divBotaoCidade { 
            float:left;
            margin-left: 5px;
            margin-top: 2px;
            padding: 6px;
        }

        #divBotaoFormato {            
            float:left;
            margin-left: 5px;
            margin-top: 2px;
            padding: 6px;
        }

        #divAno {
            clear:both;
            float:left;
            margin-left: 5px;
            margin-top: 2px;
            padding: 2px;
        }

        #divMes {
            float:left;
            margin-left: 5px;            
        }

        #divMesFinal {
            float:left;
            margin-left: 5px;  
            margin-top: -4px;          
        }

        #divBotaoAtualizar {            
            float:left;
            margin-left: 5px;
            margin-top: 2px;
            padding: 6px;
        }

        #divQuadFormato1 {
            clear: both;
            float:left;
            margin-left: 2px;
            padding-right: 30px;
        }

        #divQuadFormato2 {           
            float:left;
            margin-left: 15px;
            padding-right: 30px;
        }

        #divQuadFormato3 {           
            float:left;
            margin-left: 15px;
            padding-right: 30px;
        }

        #divDados {
            clear: both ;
            float: left;
            margin-top: 5px;
            width: 100%;
        }

        .Supermercadista {
            margin-top: 4px;
            float:left;
            margin-left: 15px;
        }

        #divSupermercadista {
            margin-top: 2px;
            float:left;
            margin-left: 5px;
            padding-top: -5px;
            padding-right: 15px;
            padding-left: -10px;
        }

        .divSize {            
            float: left;   
            padding: 4px;        
            margin-left: 5px;
       
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" class="BGC_myBorder">
        <uc1:wucAno runat="server" ID="cboAno" AutoPostBack ="false"  />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack ="false"  />
    </div>

    <div id="divMesFinal">
        <uc1:wuciListaMes runat="server" ID="cboMesFinal" AutoPostBack ="false"  />
    </div>

    <div id="divBotaoCidade" class="BGC_myBorder">
        <dx:ASPxButton ID="btnRegião" runat="server" Text="Região" Theme="Metropolis" AutoPostBack="false" Width="75px" Height="30px" Font-Size="Small" Font-Bold="true" ></dx:ASPxButton>
    </div>
       

    <div id="divBotaoFormato" class="BGC_myBorder">
        <dx:ASPxButton ID="btnFormato" runat="server" Text="Formato" Theme="Metropolis" AutoPostBack="false" Width="75px" Height="30px" Font-Size="Small" Font-Bold="true" 
            ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
        </dx:ASPxButton>   
    </div>



    <div id="divSupermercadista" class="BGC_myBorder">

        <div class="Supermercadista ">
            <dx:ASPxRadioButton ID="optSupermercadista" runat="server" GroupName="optLojaSupermercadista" Layout="Flow" Text="Supermercadista" Theme="Material" Checked="True"  >
                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="Supermercadista  ">
            <dx:ASPxRadioButton ID="optLoja" runat="server" GroupName="optLojaSupermercadista" Layout="Flow" Text="Loja" Theme="Material" >
                 <ClientSideEvents CheckedChanged="function(s, e) {
	                cbPanel.PerformCallback();	               
                 }" />
            </dx:ASPxRadioButton>
        </div>

        

    </div>

    <div id="divBotaoAtualizar" class="BGC_myBorder">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack="False" Width="75px" Height="30px" Font-Size="Small"  
            ClientSideEvents-Click="function(s, e) { cbPanelFormato.PerformCallback(); }">
<ClientSideEvents Click="function(s, e) { 
cbPanel.PerformCallback(); 
}"></ClientSideEvents>
        </dx:ASPxButton>   
    </div>



    <div class="divSize BGC_myBorder">
        <uc1:wucSize runat="server" ID="cboSizeLoja" Visible="true" AutoPostBack="false"  CallSize="100" />
    </div>

    <dx:ASPxPopupControl ID="popFormato" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis" PopupElementID="divBotaoFormato" 
            PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
            ShowHeader="true" ShowCloseButton="true" Width="600px" Height="200px" 
            HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" 
            SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">

        <HeaderTemplate></HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="pccc_Formato" runat="server">
                <dx:ASPxCallbackPanel ID="cbPanelFormato" runat="server" Width="600px" Theme="Metropolis" ClientInstanceName="cbPanelFormato"   SettingsLoadingPanel-Text ="Atualizando..." >

                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">
                            
                            <div id="divQuadFormato1" class="BGC_myBorder">
                                <dx:ASPxCheckBox ID="chkSupermercados" runat="server" AutoPostBack="False" ForeColor="Gray" Text="01 - Supermercados" TextSpacing="2px" Theme="Material" Checked="true"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkHipermercados" runat="server" AutoPostBack="False" ForeColor="Gray" Text="02 - Hipermercados" TextSpacing="2px" Theme="Material" Checked="true"  ></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkAtacarejo" runat="server" AutoPostBack="False" ForeColor="Gray" Text="06 - Atacarejo" TextSpacing="2px" Theme="Material"  ></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkGourmet" runat="server" AutoPostBack="False" ForeColor="Gray" Text="09 - Gourmet" TextSpacing="2px" Theme="Material"  ></dx:ASPxCheckBox>
                            </div>
                            <div id="divQuadFormato2" class="BGC_myBorder">
                                <dx:ASPxCheckBox ID="chkAtacado" runat="server" AutoPostBack="False" ForeColor="Gray" Text="03 - Atacado" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkDepositos" runat="server" AutoPostBack="False" ForeColor="Gray" Text="04 - Depósitos" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkFarmacia" runat="server" AutoPostBack="False" ForeColor="Gray" Text="05 - Farmácia" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkPosto" runat="server" AutoPostBack="False" ForeColor="Gray" Text="07 - Posto" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                            </div>
                            <div id="divQuadFormato3" class="BGC_myBorder">
                                <dx:ASPxCheckBox ID="chkLojaDepto" runat="server" AutoPostBack="False" ForeColor="Gray" Text="08 - Loja Depto." TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkMatriz" runat="server" AutoPostBack="False" ForeColor="Gray" Text="10 - Matriz" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkCooperativa" runat="server" AutoPostBack="False" ForeColor="Gray" Text="11 - Cooperativa" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                <dx:ASPxCheckBox ID="chkOutros" runat="server" AutoPostBack="False" ForeColor="Gray" Text="99 - Outros" TextSpacing="2px" Theme="Material"></dx:ASPxCheckBox>
                                
                            </div>
                            
                        </dx:PanelContent>
                    </PanelCollection>

                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>


        </ContentCollection>

    </dx:ASPxPopupControl>

    <dx:ASPxPopupControl ID="popCidade" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis" PopupElementID="divBotaoCidade" 
            PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
            ShowHeader="true" ShowCloseButton="true" Width="350px" Height="300px" 
            HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" 
            SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">

<SettingsLoadingPanel Text="Aguarde. Atualizando&amp;hellip;"></SettingsLoadingPanel>

        <HeaderTemplate></HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <dx:ASPxCallbackPanel ID="cbPanelCidade" runat="server" Width="350px" Theme="Metropolis" ClientInstanceName="cbPanelCidade"   SettingsLoadingPanel-Text ="Atualizando..." >

<SettingsLoadingPanel Text="Atualizando..."></SettingsLoadingPanel>

                    <PanelCollection>
                        <dx:PanelContent ID="PanelContent2"  runat="server" SupportsDisabledAttributes="both">
                            
                            <div id="div1" class="BGC_myBorder">
                                <dx:ASPxRadioButton ID="optConcDiretos" runat="server" AutoPostBack="False" GroupName="grpOpcao" Layout="Flow" Text="Concorrentes Diretos" TextSpacing="2px" Theme="Material" >
                                     <ClientSideEvents CheckedChanged="function(s, e) {cbPanelCidade.PerformCallback();}" />
                                </dx:ASPxRadioButton>
                            </div>
                            <div id="div2" class="BGC_myBorder">
                               <dx:ASPxRadioButton ID="optTodasCidades" runat="server" GroupName="grpOpcao" Layout="Flow" Text="Todas Cidades" TextSpacing="2px" Theme="Material" AutoPostBack="False" >
                                   <ClientSideEvents CheckedChanged="function(s, e) {cbPanelCidade.PerformCallback();}" />
                                </dx:ASPxRadioButton>
                            </div>
                            <div id="div3" class="BGC_myBorder">
                                <dx:ASPxRadioButton ID="optCidadesComCondor" runat="server" ForeColor="#3366FF" GroupName="grpOpcao" Layout="Flow" Text="Cidades com Condor" TextSpacing="2px"  Theme="Material"  AutoPostBack="False">
                                    <ClientSideEvents CheckedChanged="function(s, e) {cbPanelCidade.PerformCallback();}" />
                                </dx:ASPxRadioButton>                                
                            </div>
                            <div id="div4" class="BGC_myBorder">
                                <dx:ASPxRadioButton ID="optParana" runat="server" GroupName="grpOpcao" Layout="Flow" Text="Paraná" TextSpacing="2px" Theme="Material" AutoPostBack="False" >
                                    <ClientSideEvents CheckedChanged="function(s, e) {cbPanelCidade.PerformCallback();}" />
                                </dx:ASPxRadioButton>                              
                            </div>
                            <div style="padding-top:3px">
                                <dx:ASPxComboBox ID="cboCidade" runat="server" AutoPostBack="False"                                                  
                                    Enabled="False" SettingsLoadingPanel-Text="" ShowShadow="False" ValueType="System.Int32" Width="300px" Theme="Material" 
                                    DropDownRows="10">
                                </dx:ASPxComboBox>
                            </div>

                            <asp:Label ID="lblCidade" runat="server" Text="Cidade" Visible="true" ></asp:Label>
                        </dx:PanelContent>
                    </PanelCollection>

                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>


        </ContentCollection>

    </dx:ASPxPopupControl>


<asp:Label ID="lblError" runat="server" Text="" Visible="true" ></asp:Label>
<div id="divDados">

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando" >
        <Images>
        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
        </Images>

        <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
        <PanelCollection>
            <dx:PanelContent>
                
                <%--GRID 1 - POR ~SUPERMECADISTA--%>

                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="dsMaster" 
                    KeyFieldName="CNPJ_Principal"         CssPostfix="Aqua" Width="100%" Theme="SoftOrange" EnableTheming="True">
                    <Templates>
                        <DetailRow>
                            <dx:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" 
                                ClientInstanceName="detailGrid"  
                                CssPostfix="Aqua" DataSourceID="dsDetail" KeyFieldName="IE" 
                                OnBeforePerformDataSelect="detailGrid_DataSelect" 
                                onhtmldatacellprepared="detailGrid_HtmlDataCellPrepared" Theme="SoftOrange" 
                                Width="100%" EnableTheming="True" OnHtmlFooterCellPrepared="detailGrid_HtmlFooterCellPrepared" OnLoad="detailGrid_Load" OnCustomSummaryCalculate="detailGrid_CustomSummaryCalculate">
                                <Styles>	                               	
	                                <Header HorizontalAlign="Center">
                                    </Header>
	                                <AlternatingRow BackColor="#E8E8E8"></AlternatingRow>
                                    <FocusedRow BackColor="#FFFF66" Font-Bold="False" ForeColor="Blue">
                                    </FocusedRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>
                                <SettingsLoadingPanel Text="" />
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords">
                                    <AllButton>
                                        <Image Height="19px" Width="27px" />
                                    </AllButton>
                                    <FirstPageButton>
                                        <Image Height="19px" Width="23px" />
                                    </FirstPageButton>
                                    <LastPageButton>
                                        <Image Height="19px" Width="23px" />
                                    </LastPageButton>
                                    <NextPageButton>
                                        <Image Height="19px" Width="19px" />
                                    </NextPageButton>
                                    <PrevPageButton>
                                        <Image Height="19px" Width="19px" />
                                    </PrevPageButton>
                                </SettingsPager>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" SummaryType="Sum" />
                                </TotalSummary>
                               
                           
                                <SettingsText GroupPanel="Arraste uma coluna aqui para agrupar" />
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="Nome" 
                                        SummaryType="Count" />
                                </GroupSummary>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Nome" 
                                        ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                                        VisibleIndex="0" FixedStyle="Left" Width="150px">
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Tipo" 
                                        ToolTip="Formato do estabelecimento, H - Hipermercados,  S - Supermercados, A - Atacado,  D - Depósitos e O - Outros" 
                                        VisibleIndex="1" FixedStyle="Left" Width="50px">
                                        <CellStyle HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Localização" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Cidade" FixedStyle="Left" ToolTip="Cidade em que os estabelecimentos do supermercadista esta situado." VisibleIndex="0" Width="100px">
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Bairro" FixedStyle="Left" ToolTip="Bairro em que os estabelecimentos do supermercadista esta situado." VisibleIndex="1" Width="100px">
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Endereço" FieldName="Endereco" FixedStyle="Left" VisibleIndex="2" Width="200px">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Rank" ReadOnly="True" 
                                        ToolTip="Ranking sobre vendas. A base é o próprio supermercadista." 
                                        VisibleIndex="3" Width="40px">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2021" FieldName="vlrAT" 
                                        ToolTip="Valor da venda do mês selecionado." VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="I.E." FieldName="IE" 
                                        ToolTip="Inscrição Estadual do Concorrentes" VisibleIndex="14" Width="90px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="12" Width="50px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="13" Width="50px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CNPJ_Principal" Visible="False" 
                                        VisibleIndex="16" Width="80px">
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="Details" VisibleIndex="17" Width="60px">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">
                                                 Mais...</a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="Inicio das &lt;br /&gt; Atividades" FieldName="InicioDasAtividades" ToolTip="Inicio das Atividades" VisibleIndex="15" Width="90px">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="CNAE" FieldName="AEP" VisibleIndex="18" Width="750px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2020" FieldName="vlrAA1" ShowInCustomizationForm="True" ToolTip="Valor da venda do mês, só que Ano Anterior." VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2019" FieldName="vlrAA2" VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrAA3" VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAT" VisibleIndex="5" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA1" VisibleIndex="7" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cres" FieldName="percCrescAA2" VisibleIndex="9" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA3" VisibleIndex="11" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>

                                </Columns>
                                <Settings ShowFooter="True" ShowGroupPanel="True" HorizontalScrollBarMode="Visible" VerticalScrollableHeight="150" VerticalScrollBarMode="Auto" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <ImagesEditors>
                                    <CalendarFastNavPrevYear Height="19px" 
                                        Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                                    <CalendarFastNavNextYear Height="19px" 
                                        Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                                    <DropDownEditDropDown Height="7px" 
                                        Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                        Width="9px" />
                                    <SpinEditIncrement Height="6px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditDecrement Height="7px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditLargeIncrement Height="9px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditLargeDecrement Height="9px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                        Width="7px" />
                                </ImagesEditors>
                            </dx:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles >
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#EAEAEA">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#0066FF">
                        </FocusedRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>
                    <SettingsLoadingPanel Text="" />
                    <SettingsPager PageSize="14">
                        <AllButton Text="All">
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton Text="Primeira">
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton Text="Última">
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton Text="Próxima &gt;">
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Anterior">
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                            ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                            ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" 
                            ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                    </GroupSummary>
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                            ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" SummaryType="Sum" />
                        <dx:ASPxSummaryItem FieldName="vlrAA4" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA1" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA2" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA3" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAT" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA1" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA2" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA3" SummaryType="Custom" />
                    </TotalSummary>
                    
                    <SettingsText EmptyDataRow="Não foi encontrado nenhuma informação para esta seleção." 
                        FilterBarCreateFilter="Filtrar informações" />
                    <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged_Principal()
}" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Nome" VisibleIndex="0" 
                            Caption="Supermercadista" 
                            ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                            Width="200px">
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="12" 
                            Visible="False" Width="90px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="13" Visible="False" Width="60px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="14" Visible="False" Width="60px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="2020" VisibleIndex="2" Name="bandAT">
                            <HeaderStyle BackColor="#003399" ForeColor="White" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Lojas" FieldName="Lojas" ShowInCustomizationForm="True" ToolTip="Quantidade de lojas que o supermercadista tem atualmente." VisibleIndex="3" Width="60px">
                                    <HeaderStyle BackColor="#003399" ForeColor="White" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" Name="partAT" ShowInCustomizationForm="True" ToolTip="% de participação sobre o total da venda no mês selecionado." VisibleIndex="4" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="Rank" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição em que o supermercadista esta com base na venda." VisibleIndex="0" Width="60px">
                                    <HeaderStyle BackColor="#003399" ForeColor="White" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAT" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#003399" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2019" Name="bandAA1" ShowInCustomizationForm="True" VisibleIndex="3">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Lojas" FieldName="NumeroDeLojasAA1" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAA1" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA1" Name="partAA" ShowInCustomizationForm="True" ToolTip="% de participação sobre o total da venda. Mesmo mês, só que Ano Anterior." VisibleIndex="4" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA1" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA1" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2018" Name="bandAA2" ShowInCustomizationForm="True" VisibleIndex="4">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAA2" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Lojas" FieldName="NumeroDeLojasAA2" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA2" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA2" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA2" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2017" Name="bandAA3" ShowInCustomizationForm="True" VisibleIndex="5">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAA3" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Lojas" FieldName="NumeroDeLojasAA3" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA3" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA3" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA3" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrAA4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                     <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Settings ShowFooter="True" VerticalScrollableHeight="310" 
                        ShowVerticalScrollBar="True" HorizontalScrollBarMode="Visible" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsDetail ShowDetailRow="True" />
                  
                </dx:ASPxGridView>

                <%--GRID 2 - POR LOJA--%>

                <dx:ASPxGridView ID="gridLojas" runat="server" AutoGenerateColumns="False" 
                                ClientInstanceName="detailGrid"  
                                CssPostfix="Aqua" DataSourceID="dsLojas" KeyFieldName="IE" 
                                OnBeforePerformDataSelect="detailGrid_DataSelect" 
                                onhtmldatacellprepared="detailGrid_HtmlDataCellPrepared" Theme="SoftOrange" 
                                 Width="100%" EnableTheming="True" Visible="False">
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#E8E8E8">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="False" ForeColor="Blue">
                        </FocusedRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>
                    <SettingsLoadingPanel Text="" />
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager PageSize="11">
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
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
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                                        ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                                        ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                                        ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                                        ShowInGroupFooterColumn="vlr Dif MA" SummaryType="Sum" />
                        <dx:ASPxSummaryItem FieldName="vlrAA4" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="Total de lojas: {0:n0}" FieldName="Nome" 
                                        ShowInColumn="Nome" SummaryType="Count" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAT" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA1" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA2" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA3" SummaryType="Custom" />
                    </TotalSummary>
                    <SettingsText GroupPanel="Arraste uma coluna aqui para agrupar" />
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="Nome" 
                                        SummaryType="Count" />
                    </GroupSummary>
                    <Columns>
                        <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                        <dx:GridViewDataTextColumn FieldName="Nome" 
                                        ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                                        VisibleIndex="1" FixedStyle="Left" Width="150px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Tipo" 
                                        ToolTip="Formato do estabelecimento, H - Hipermercados,  S - Supermercados, A - Atacado,  D - Depósitos e O - Outros" 
                                        VisibleIndex="2" FixedStyle="Left" Width="55px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle HorizontalAlign="Center">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="Localização" VisibleIndex="3">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Cidade" FixedStyle="Left" ToolTip="Cidade em que os estabelecimentos do supermercadista esta situado." VisibleIndex="0" Width="100px">
                                    <Settings AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Bairro" FixedStyle="Left" ToolTip="Bairro em que os estabelecimentos do supermercadista esta situado." VisibleIndex="1" Width="100px">
                                    <Settings AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Endereço" FieldName="Endereco" FixedStyle="Left" VisibleIndex="2" Width="200px">
                                    <Settings AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewDataTextColumn Caption="I.E." FieldName="IE" 
                                        ToolTip="Inscrição Estadual do Concorrentes" VisibleIndex="12" Width="100px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="10" Width="50px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="11" Width="50px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CNPJ_Principal" 
                                        VisibleIndex="13" Caption="CNPJ Princ." Width="90px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="CNAE" VisibleIndex="17" Width="750px" FieldName="AEP">
                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="60px" Caption="Details" VisibleIndex="16">
    <DataItemTemplate>
        <a href="javascript:void(0);" onclick="OnMoreInfoClick(this, '<%# Container.KeyValue %>')">Mais...</a>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Inicio das &lt;br/&gt; Atividades" FieldName="InicioDasAtividades" ToolTip="Inicio das atividades" VisibleIndex="14" Width="80px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Concorrente &lt;br/&gt; Direto" FieldName="idLojaConcorrente" ToolTip="Loja e seus concorrentes diretos" VisibleIndex="15" Width="85px">
                            <Settings AutoFilterCondition="Contains" />
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="2020" VisibleIndex="5" Name="bandAT">
                            <HeaderStyle BackColor="#003399" ForeColor="White" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="vlr. Venda" FieldName="vlrAT" ToolTip="Valor da venda do mês selecionado." VisibleIndex="1" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" AutoFilterCondition="Equals" />
                                    <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Rank" ReadOnly="True" ShowInCustomizationForm="True" Width="50px" ToolTip="Ranking sobre vendas. A base é o próprio supermercadista." VisibleIndex="0">

<Settings AllowAutoFilter="False"></Settings>
    <HeaderStyle BackColor="#003399" ForeColor="White" />
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
</dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAT" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="#003399" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2019" Name="bandAA1" ShowInCustomizationForm="True" VisibleIndex="6">
                            <HeaderStyle BackColor="Gray" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="vlr. Venda" FieldName="vlrAA1" ShowInCustomizationForm="True" ToolTip="Valor da venda do mês, só que Ano Anterior." VisibleIndex="1" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA1" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA1" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2018" Name="bandAA2" ShowInCustomizationForm="True" VisibleIndex="7">
                            <HeaderStyle BackColor="Gray" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="vlr. Venda" FieldName="vlrAA2" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Diferença entre Mês Selecionado e Ano Anterior." VisibleIndex="1" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA2" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA2" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="2017" Name="bandAA3" ShowInCustomizationForm="True" VisibleIndex="8">
                            <HeaderStyle BackColor="Gray" />
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="vlr. Venda" FieldName="vlrAA3" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Diferença entre Mês Selecionado e Ano Anterior." VisibleIndex="1" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RankAA3" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA3" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <HeaderStyle BackColor="Gray" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrAA4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                     <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Settings ShowFooter="True" ShowGroupPanel="True" HorizontalScrollBarMode="Visible" VerticalScrollableHeight="230" ShowFilterRow="True" VerticalScrollBarMode="Auto" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                   
                </dx:ASPxGridView>
                
                <asp:SqlDataSource ID="dsMaster" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" 
                    SelectCommand="usp_BuscarConcorrentesPrincipal" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                        <asp:SessionParameter Name="IPUser" SessionField="sUSER" Type="String" />
                        <asp:SessionParameter Name="porCidade" SessionField="sCIDADE" Type="Byte" />
                        <asp:SessionParameter Name="Periodo" SessionField="sPERIODO" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="dsDetail" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" 
                    SelectCommand="usp_BuscarConcorrentesFiliais" 
                SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                         <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                        <asp:SessionParameter Name="CNPJ_Principal" SessionField="CNPJ" Type="Int64" />  
                        <asp:SessionParameter Name="IPUser" SessionField="sUSER" Type="String" />
                        <asp:SessionParameter Name="porCidade" SessionField="sCIDADE" Type="Byte" /> 
                        <asp:SessionParameter Name="Periodo" SessionField="sPERIODO" Type="Byte" />                     
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="dsLojas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" 
                    SelectCommand="usp_BuscarConcorrentesPorLoja" 
                SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                        <asp:SessionParameter Name="IPUser" SessionField="sUSER" Type="String" />
                        <asp:SessionParameter Name="porCidade" SessionField="sCIDADE" Type="Byte" />
                        <asp:SessionParameter Name="Periodo" SessionField="sPERIODO" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>

      
                

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
                
</div>

</asp:Content>

