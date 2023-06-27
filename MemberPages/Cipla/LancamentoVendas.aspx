<%@ Page Title="Lançamento de Vendas - Cipla" Language="VB" MasterPageFile="~/MemberPages/SiteCipla.master" AutoEventWireup="false" CodeFile="LancamentoVendas.aspx.vb" Inherits="MemberPages_Cipla_LancamentoVendas" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
                                        504 - Cipla
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

                            <dx:LayoutItem Caption="Dia" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                        <dx:ASPxDateEdit ID="cboDia" runat="server" Width="140px" HorizontalAlign="Center" Font-Size="Medium" Theme="Mulberry" ForeColor="Red" AutoPostBack="True" UseMaskBehavior="True" TabIndex="3" onfocus="this.select();">
                                            <CalendarProperties TodayButtonText="Hoje">
                                            </CalendarProperties>
                                            
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

                            <dx:LayoutItem Caption="Vendas" ColSpan="1">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server">
                                        <dx:ASPxTextBox ID="txtPreco" runat="server" Width="120px" AutoPostBack="True" Text="0" HorizontalAlign="Right" TabIndex="5" Theme="Mulberry" DisplayFormatString="{0:c}"></dx:ASPxTextBox>
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

