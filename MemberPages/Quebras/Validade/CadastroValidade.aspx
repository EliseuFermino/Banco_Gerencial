<%@ Page Title="Cadastro de Produtos à Vencer" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroValidade.aspx.vb" Inherits="MemberPages_Quebras_Validade_CadastroValidade" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        .cssFilial {
            margin-top: -8px;
            margin-left: -5px;
        }

        .cssSecao {
            margin-left: -4px;
        }

        .cssTitle {
            font-size:larger;
        }

        .cssForm {           
            padding-top: 30px;
        }

        #divFilial {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 5px;
        }

        #divDia {  
            clear: both;           
            float : left;
            padding-top: 10px;
            margin-left: 5px;
            
        }

        #divBorda {
            clear: both ;
            float : left;
            margin-top: 8px;           
            border : 2px solid gray;
            height: 300px;
            width:450px;
            margin-left: 5px;
        }

        #divSecao {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 2px;
        }
     
        #divRua {   
             clear: both ;        
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divEAN {   
             clear: both ;        
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divDescProduto {
                       float : left;
            margin-left : 5px;
            padding-top: 5px;
            color : blue ;
        }

        #divQtde {  
             clear: both ;         
            float : left;
            margin-left : 5px;
            padding-top: 10px;
        }

        #divPreco {  
            clear: both ;         
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divTotalLegenda {
            clear: both ;
            float : left;
            padding-top : 11px;
            margin-left: 2px;

        }

        #divTotal {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }


        #divSalvar {
            clear: both ;
            float : left;
            padding-top : 7px;
             padding-left : 70px;

        }

        #divSalvar_ {
            clear: both ;
            float : left;
            padding-top : 7px;
             padding-left : 2%;

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers >
            <asp:PostBackTrigger ControlID ="btnSalvar" />      
        </Triggers>
        <ContentTemplate>


            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" CssClass="cssForm"  AlignItemCaptionsInAllGroups="True" UseDefaultPaddings="False" Width="100%" Theme="Mulberry" EnableTheming="True">
                
                <Items>
                    <dx:LayoutGroup Caption="Informações Gerais" ColumnCount="1" CssClass="cssTitle " GroupBoxDecoration="Box" GroupBoxStyle-Caption-Font-Size="X-Large" GroupBoxStyle-Caption-BackColor="#efeeef"  >
                        
                        <GroupBoxStyle>
                            <Caption BackColor="#EFEEEF" Font-Size="X-Large">
                            </Caption>
                        </GroupBoxStyle>
                        
                        <Items>
                            <dx:LayoutItem Caption="Filial" ColSpan="1" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" >
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false" Css_Filial="cssFilial"  />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Seção" ColSpan="1" >
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" >
                                        <uc1:wucListaSecao runat="server" ID="cboSecao" Caption="" CssClass="cssSecao" cboSecao_Enabled="false" />
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Corredor" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server">
                                        <dx:ASPxTextBox ID="txtRua" runat="server" Width="50px" MaxLength="99" TabIndex="1" Theme="Mulberry" HorizontalAlign="Center"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            
                            <dx:LayoutItem Caption="EAN" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                        <dx:ASPxTextBox ID="txtEAN" runat="server" MaxLength="99" Width="150px" AutoPostBack="True" Theme="Mulberry"  TabIndex="2" onfocus="this.select();" HorizontalAlign="Center"  ></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem  Caption=""  ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                        <dx:ASPxLabel ID="lblDescProduto" runat="server" Font-Size="Medium" Theme="Mulberry" ForeColor="Blue" ></dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Vencimento" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                        <dx:ASPxDateEdit ID="cboDia" runat="server" Width="140px" HorizontalAlign="Center" Font-Size="Medium" Theme="Mulberry" ForeColor="Red" AutoPostBack="True" UseMaskBehavior="True" TabIndex="3" onfocus="this.select();">
                                            <CalendarProperties TodayButtonText="Hoje">
                                            </CalendarProperties>
                                            <DateRangeSettings RangeErrorText="Você deve selecionar uma data entre {0} to {1} {2}" />
                                        </dx:ASPxDateEdit>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>                            

                        </Items>
                    </dx:LayoutGroup>

                    <dx:LayoutGroup Caption="Quantidade e Valores" ColumnCount="1" GroupBoxDecoration="Box" GroupBoxStyle-Caption-Font-Size="X-Large" GroupBoxStyle-Caption-BackColor="#efeeef" >
                        <GroupBoxStyle>
                            <Caption BackColor="#EFEEEF" Font-Size="X-Large">
                            </Caption>
                        </GroupBoxStyle>
                        <Items>
                            <dx:LayoutItem Caption="Quantidade" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server">
                                        <dx:ASPxTextBox ID="txtQtde" runat="server" Width="70px" AutoPostBack="True" Text="0" HorizontalAlign="Right" TabIndex="4" Theme="Mulberry" DisplayFormatString="{0:n0}"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Preço" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                        <dx:ASPxTextBox ID="txtPreco" runat="server" Width="120px" AutoPostBack="True" Text="0" HorizontalAlign="Right" TabIndex="5" Theme="Mulberry" DisplayFormatString="{0:c}"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>

                            <dx:LayoutItem Caption="Total" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" runat="server">
                                        <dx:ASPxTextBox ID="lblTotal" runat="server" Width="120px" Text="0" HorizontalAlign="Right" TabIndex="5" Enabled="false"  Theme="Mulberry" DisplayFormatString="{0:c}"></dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                           
                        </Items>


                    </dx:LayoutGroup>


                </Items>
                
            </dx:ASPxFormLayout>

            <div id="divSalvar_">            
                <dx:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" Width="150px" Height="35px" Font-Size="Large" Theme="MetropolisBlue" UseSubmitBehavior="false" CausesValidation="false"></dx:ASPxButton>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

