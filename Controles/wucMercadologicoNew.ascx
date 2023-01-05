<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucMercadologicoNew.ascx.vb" Inherits="Controles_wucMercadologicoNew" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




    <style type ="text/css" >

        #ShowButton {
            float: left;
            margin-left: 2px;
            width: 115px;  
            padding-top: 2px;                      
        }

 
        #divMercadologico_Total {
            float: left;           
        }

        #divMercadologico_Departamento {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Secao {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Grupo {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Subgrupo {
            float: left;
            margin-left: 15px;
        }

        #divLista_Departamento {
            clear: both;
            float: left;
        }

        #divLista_Secao {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Grupo {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Subgrupo {            
            float: left;
            padding-left: 5px;
        }

    </style>


    <div id="ShowButton" >
        <dx:ASPxButton ID="btnShowButton" runat="server" Text="Mercadologico" AutoPostBack="false" Width="50px"
            Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
        </dx:ASPxButton>
    </div>


  <%-- AQUI COMEÇA A CAIXA DE DIALOGO.--%>

    <dx:ASPxPopupControl ID="popMercadologico" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="50px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">
        <HeaderTemplate>      
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">

                    <dx:ASPxCallbackPanel ID="cbPanelMercadologico" runat="server" Width="900px" Theme="Metropolis" ClientInstanceName="cbPanelMercadologico"   SettingsLoadingPanel-Text ="Atualizando..." >
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">

                                <div id="divMercadologico_Total">
                                    <dx:ASPxRadioButton ID="rdTotal" runat="server" Text="Total" GroupName="rdMercadologico" Checked="True" ClientInstanceName="rdTotal" Theme="Metropolis" ToolTip="Exibe a venda de todos os departamentos" TextSpacing="2">
                                         <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Departamento">
                                    <dx:ASPxRadioButton ID="rdDepartamento" runat="server" Text="Departamento" GroupName="rdMercadologico" ClientInstanceName="rdDepartamento" Theme="Metropolis" ToolTip="Exibe a venda de todas as seções do departamento selecionado" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Secao">
                                    <dx:ASPxRadioButton ID="rdSecao" runat="server" Text="Seção" GroupName="rdMercadologico" ClientInstanceName="rdSecao" Theme="Metropolis" ToolTip="Exibe a venda de todos os grupos de familia da seção selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>

                                </div>

                                <div id="divMercadologico_Grupo">
                                    <dx:ASPxRadioButton ID="rdGrupo" runat="server" Text="Grupo" GroupName="rdMercadologico" ClientInstanceName="rdGrupo" Theme="Metropolis" ToolTip="Exibe a venda de todas os familias do grupo selecionado" AutoPostBack="False" Width="59px">
                                        <ClientSideEvents CheckedChanged="function(s, e) {

	cbPanelMercadologico.PerformCallback();

	
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Subgrupo">
                                    <dx:ASPxRadioButton ID="rdSubgrupo" runat="server" Text="Familia" GroupName="rdMercadologico" ClientInstanceName="rdSubgrupo" Theme="Metropolis" ToolTip="Exibe a venda de todos os itens da familia selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>
                                                               

                                <div id="divLista_Departamento" >

                                    <dx:ASPxListBox ID="cblDepartamento" runat="server" ValueType="System.Int32" ClientInstanceName="cblDepartamento" DataSourceID="dsListaDepartamento" TextField="ListaReduzida" ValueField="idDepto" ViewStateMode="Disabled" EnableTheming="True" Height="445px" Visible="False" Width="120px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Departamento" FieldName="ListaReduzida" />
                                        </Columns>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback();}" />
                                    </dx:ASPxListBox>               

                                    <asp:SqlDataSource ID="dsListaDepartamento" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure">
                                        <SelectParameters>                                            
                                            <asp:SessionParameter Name="Departamento" SessionField="sDEPTO" Type="String" />
                                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" />                                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Secao" >
                                    <dx:ASPxListBox ID="cblSecao" runat="server" ValueType="System.Int32" ClientInstanceName="cblSecao" DataSourceID="dsListaSecao" EnableTheming="True" Height="445px" TextField="ListaReduzida"  ValueField="idSecao" ViewStateMode="Disabled" Visible="False" Width="200px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	
	cbPanelMercadologico.PerformCallback()
}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Seção" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSecao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSecaoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblDepartamento" Name="idDepto" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Grupo" >
                                    <dx:ASPxListBox ID="cblGrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblGrupo" DataSourceID="dsListaGrupo" EnableTheming="True" Height="445px" TextField="ListaReduzida" ValueField="idGrupo" ViewStateMode="Disabled" Visible="False" Width="240px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Grupo" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaGrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboGrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblSecao" Name="idSecao" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Subgrupo">
                                    <dx:ASPxListBox ID="cblsubgrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblSubgrupo" DataSourceID="dsListaSubgrupo" EnableTheming="True" Height="445px" TextField="ListaReduzida" ValueField="idSubgrupo" ViewStateMode="Disabled" Visible="False" Width="240px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Familia" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSubgrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSubgrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblGrupo" Name="idGrupo" PropertyName="Value" Type="Int16" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>


                                
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>


    
 



<asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>



    
 



