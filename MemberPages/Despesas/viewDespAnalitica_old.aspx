<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewDespAnalitica_old.aspx.vb" Inherits="MemberPages_Despesas_viewDespAnalitica_old" EnableViewStateMac="false" MasterPageFile="~/MemberPages/SiteDespesas.master" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucListaGrupo_Subgrupo.ascx" tagname="wucListaGrupo_Subgrupo" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

         html {            
                overflow-x:hidden;            
            }

        #moldura {
                width:100%; 
                margin-left: 1px ;                      
            }

       #divAno {
            float: left;            
        }

        #divMes {
            float: left;
        }

        #divDados {
            clear:both;
            float: left;
        }

        #divFilial {
            float: left;
            width: 330px;
            padding-left: 2px;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divBotaoExcel {
            float: left;
            padding-left: 10px;
            padding-top: 2px;
        }

        #divOpcaoGrupo {
            clear:both;
            float: left; 
            margin-top: 3px;       
        }

        #divOpcaoSubgrupo {
            float: left; 
            margin-left: 15px;   
            margin-top: 3px;            
        }

        #divGrupoSub {
            float: left ;
            margin-left: 10px;           
        }

        #divSize {
            float: left; 
            
        }



    </style>

 </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">

        <div id="divAno">
            <uc1:wucAno ID="cboAno" runat="server" />
        </div>

        <div id="divMes">
             <uc2:wuciListaMes ID="cboMes" runat="server" />
        </div>

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />  
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack ="False" Theme ="Metropolis" >
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc5:wucBotaoExcel ID="btnExcel" runat="server" />
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
        </div>        

        <div id="divBoxGrupoSub">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                        <div id="divOpcaoGrupo">
                            <asp:RadioButton ID="rnd_Grupo" runat="server" AutoPostBack="True" Checked="True" GroupName="Grupos" Text="Grupo" Font-Bold="true" />
                        </div>

                        <div id="divOpcaoSubgrupo">
                            <asp:RadioButton ID="rnd_Subgrupo" runat="server" AutoPostBack="True"  GroupName="Grupos" Text="Sub-grupo" Font-Bold="true"  />
                        </div>

                        <div id="divGrupoSub">
                            <uc4:wucListaGrupo_Subgrupo ID="cboGrupoSub" runat="server" />
                        </div>

                </ContentTemplate>
            </asp:UpdatePanel>

        </div>   
       
 
        
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
        

                   <div id="divDados">
                       <dx:ASPxGridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" PreviewFieldName="idFilial" Theme="Default" 
                    Width="1000px" KeyFieldName="CodDespDet">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" SummaryType="Sum" />
                    </TotalSummary>
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="Total deste centro de custo: {0:n2}" 
                            FieldName="vlr" SummaryType="Sum" />
                    </GroupSummary>
                    <Columns>
                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                        <dx:GridViewDataTextColumn Caption="Cod" FieldName="CodDespDet" 
                            VisibleIndex="1" Width="50px" FixedStyle="Left">
                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                            ReadOnly="True" VisibleIndex="2" Width="200px" FixedStyle="Left">
                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Agenda" FieldName="idAgenda" 
                            VisibleIndex="5" Width="80px">
                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Nota" VisibleIndex="7" Width="80px">
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Observação" FieldName="Observacao" 
                            ReadOnly="True" VisibleIndex="8" Width="250px">
                            <Settings AllowAutoFilter="False" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="idGrupo" VisibleIndex="9" Width="80px">
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Data" ReadOnly="True" VisibleIndex="10" Width="80px">
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlr" VisibleIndex="11" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Centro de Custo" FieldName="CCusto" 
                            ReadOnly="True" VisibleIndex="12" Width="150px">
                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles>
	                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                    <Header HorizontalAlign="Center">
                        </Header>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>

                           <SettingsPager PageSize="15">
                           </SettingsPager>

                    <Settings ShowFooter="True" ShowGroupPanel="True" ShowTitlePanel="True" ShowFilterRow="True" HorizontalScrollBarMode="Visible" />
                    <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e loja" 
                        GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" 
                        Title="Consulta Despesas Analiticas" />
                </dx:ASPxGridView>

                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="uspReaDespAnaliticasView_Grupo" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Int16" />
                        <asp:SessionParameter DefaultValue="" Name="idGrupoSub" 
                            SessionField="sSUBGRUPO" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
                     </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    
  
</asp:Content>
