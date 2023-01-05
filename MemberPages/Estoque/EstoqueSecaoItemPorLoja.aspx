<%@ Page Title="Estoque por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EstoqueSecaoItemPorLoja.aspx.vb" Inherits="MemberPages_Estoque_PorLoja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


    <style type ="text/css" >

        #divSecao {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }


        #divCaptionTipo {
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divTipo {            
            float: left;
            margin-left: 5px;
            margin-top: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }



        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


   <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divCaptionTipo">
        Opção: 
    </div>

    <div id="divTipo">
        <dx:ASPxComboBox ID="cboTipo" runat="server" Native="True" SelectedIndex="4">
            <Items>
                <dx:ListEditItem Selected="True" Text="Volume em Estoque" Value="1" /> 
                <dx:ListEditItem Text="Valor em Estoque" Value="2" />
                <dx:ListEditItem Text="Custo Condor" Value="3" />               
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

  <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
    </div>


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="100%" KeyFieldName="idProduto">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_9" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_13" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_14" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_15" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_16" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_17" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_18" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_19" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_20" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_21" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_22" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_23" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_24" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_25" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_26" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_27" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_28" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_29" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_30" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_31" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_32" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_33" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_34" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_36" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_37" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_38" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_39" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_40" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_41" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_42" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_43" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_44" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_45" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_46" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_47" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_48" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_49" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_50" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_51" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_52" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_53" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_54" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_55" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_56" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_57" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_58" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_59" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_603" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_604" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_TotalAtacarejo" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="L_99" SummaryType="Sum" />
                        </TotalSummary>

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_1" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_3" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_4" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_5" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_6" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_7" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_8" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_9" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_12" ShowInCustomizationForm="True" VisibleIndex="17">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_13" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_14" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="19">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_15" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="20">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_16" ShowInCustomizationForm="True" VisibleIndex="21">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_17" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="22">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_18" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="23">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_19" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="24">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_20" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="25">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_21" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="26">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_22" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="27">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="28">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_24" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="29">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_25" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="30">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_26" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="31">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_27" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="32">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_28" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="33">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_29" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="34">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_30" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="35">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_31" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="36">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_32" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="37">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_33" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="38">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_34" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="39">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_36" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="40">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_37" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="41">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_38" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="42">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_39" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="43">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_40" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="44">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_41" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="45">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_42" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="46">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_43" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="47">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_44" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="48">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_99" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" SortIndex="0" SortOrder="Descending" FixedStyle="Left">
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                </CellStyle>
                                <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="L_45" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="49">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_46" FieldName="L_46" ShowInCustomizationForm="True" VisibleIndex="50">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_47" FieldName="L_47" ShowInCustomizationForm="True" VisibleIndex="51">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_48" FieldName="L_48" ShowInCustomizationForm="True" VisibleIndex="52">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_49" FieldName="L_49" ShowInCustomizationForm="True" VisibleIndex="53">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_50" FieldName="L_50" ShowInCustomizationForm="True" VisibleIndex="54">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_51" FieldName="L_51" ShowInCustomizationForm="True" VisibleIndex="55">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_52" FieldName="L_52" ShowInCustomizationForm="True" VisibleIndex="56">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_53" FieldName="L_53" ShowInCustomizationForm="True" VisibleIndex="57">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_54" FieldName="L_54" ShowInCustomizationForm="True" VisibleIndex="58">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_55" FieldName="L_55" ShowInCustomizationForm="True" VisibleIndex="59">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_56" FieldName="L_56" ShowInCustomizationForm="True" VisibleIndex="60">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_57" FieldName="L_57" ShowInCustomizationForm="True" VisibleIndex="61">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_58" FieldName="L_58" ShowInCustomizationForm="True" VisibleIndex="63">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="L_59" FieldName="L_59" ShowInCustomizationForm="True" VisibleIndex="64">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="descProdutoSubgrupoLista" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="4" >
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descProdutoGrupoLista" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" >
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Nome Fornecedor Principal" FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" VisibleIndex="68">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fornecedor Principal" FieldName="cgcPrincipal" ShowInCustomizationForm="True" VisibleIndex="67">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Total Atacarejo" FieldName="L_TotalAtacarejo" ShowInCustomizationForm="True" VisibleIndex="6" FixedStyle="Left">
                                 <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                </CellStyle>
                                <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_604" ShowInCustomizationForm="True" VisibleIndex="66">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="L_603" ShowInCustomizationForm="True" VisibleIndex="65">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
<SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit">
<AdaptiveDetailLayoutProperties ColCount="1">
    <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit">
    </SettingsAdaptivity>
    </AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

                        <SettingsPager PageSize="17" EnableAdaptivity="True">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="385" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsSearchPanel Visible="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" SearchPanelEditorNullText="Digite o que procura..." />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="WhiteSmoke">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>  
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerEstoqueConnectionString %>" SelectCommand="Resumo.uspEstoqueSecaoItem_ReferenciaCruzadaFilial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                            <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>
