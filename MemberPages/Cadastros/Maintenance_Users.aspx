<%@ Page Title="Manutenção de Usuários" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Maintenance_Users.aspx.vb" Inherits="MemberPages_Cadastros_Maintenance_Users" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
       
    <div style="padding-top: 30px">
        <dx:ASPxFormLayout ID="FormLayout" runat="server" AlignItemCaptionsInAllGroups="true" UseDefaultPaddings="false" Width="100%" Theme="Material" >
            <Items>
                <dx:LayoutGroup Caption="Cadastro de Usuários" GroupBoxDecoration="Box" UseDefaultPaddings="false"   >
                    <Items>

                        <dx:LayoutItem Caption="Opção" FieldName="LI_Opcao" CaptionStyle-Font-Bold="true">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxRadioButtonList ID="rbl_Incluir_Excluir" runat="server" RepeatDirection="Horizontal" Theme="MaterialCompact" >
                                        <Items>
                                            <dx:ListEditItem Text="Incluir" Value="1" Selected="true" />
                                            <dx:ListEditItem Text="Excluir" Value="2" />
                                            <dx:ListEditItem Text="Mudar Departamento" Value="3"  />
                                        </Items>
                                        <Border BorderStyle="None" />
                                    </dx:ASPxRadioButtonList>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="Usuário" FieldName="UserName" CaptionStyle-Font-Bold="true">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" Font-Size="20px" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxTextBox ID="txtUserName" runat="server" Width="300px" Font-Size="20px">
                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom"></ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>

                       <dx:LayoutItem Caption="Departamento" FieldName="idDepto" CaptionStyle-Font-Bold="true">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxComboBox ID="cboDepartamento" runat="server" Width="200px"
                                        TextField="CountryName" ValueField="CountryName" Font-Size="14pt" DropDownRow="20" SelectedIndex="4" DropDownRows="15" >
                                        <Items>
                                            <dx:ListEditItem Text="Seguranca" Value="Seguranca" />
                                            <dx:ListEditItem Text="Perdas" Value="Perdas" />
                                            <dx:ListEditItem Text="Controladoria" Value="Controladoria" />
                                            <dx:ListEditItem Text="Diretor" Value="Diretor" />
                                            <dx:ListEditItem Selected="True" Text="Loja" Value="Loja" />
                                            <dx:ListEditItem Text="Comercial" Value="Comercial" />
                                            <dx:ListEditItem Text="Trade Marketing" Value="Trade Marketing" />
                                            <dx:ListEditItem Text="Seguranca_Prevencao" Value="Seguranca_Prevencao" />
                                            <dx:ListEditItem Text="Administração" Value="Administração" />
                                            <dx:ListEditItem Text="Assistente_Complience" Value="Assistente_Complience" />
                                            <dx:ListEditItem Text="Gerente_CD" Value="Gerente_CD" />
                                            <dx:ListEditItem Text="Entreposto" Value="Entreposto" />
                                            <dx:ListEditItem Text="Contabilidade" Value="Contabilidade" />
                                            <dx:ListEditItem Text="Postos" Value="Postos" />
                                            <dx:ListEditItem Text="Consultor" Value="Consultor" />                                            
                                            <dx:ListEditItem Text="Gestor_Comercial" Value="Gestor_Comercial" />
                                            <dx:ListEditItem Text="Perdas_Supervisor" Value="Perdas_Supervisor" />
                                            <dx:ListEditItem Text="Gerente_Financeiro" Value="Gerente_Financeiro" />
                                            <dx:ListEditItem Text="HSA" Value="HSA" />
                                            <dx:ListEditItem Text="Delivery" Value="Delivery" />
                                            <dx:ListEditItem Text="Gerente_RH" Value="Gerente_RH" />      
                                            <dx:ListEditItem Text="Supervisor" Value="Supervisor" />       
                                            <dx:ListEditItem Text="Supervisor_Trainee" Value="Supervisor_Trainee" />                                  
                                            <dx:ListEditItem Text="Suprimentos" Value="Suprimentos" />   
                                            <dx:ListEditItem Text="Projetos Perdas" Value="Projetos_Perdas" /> 
                                            <dx:ListEditItem Text="RH_Folha" Value="RH_Folha" /> 
                                            <dx:ListEditItem Text="Marketing" Value="Marketing" />    
                                            <dx:ListEditItem Text="Marketing BI" Value="Marketing BI" />                                        
                                            <dx:ListEditItem Text="Presidência" Value="Presidência" />
                                            <dx:ListEditItem Text="Gerente Posto" Value="Gerente Posto" />
                                            <dx:ListEditItem Text="Gerente_Comercial" Value="Gerente_Comercial" />
                                            <dx:ListEditItem Text="Gerente_Contabilidade" Value="Gerente_Contabilidade" />
                                            <dx:ListEditItem Text="Diretor_Informatica" Value="Diretor_Informatica" />
                                            <dx:ListEditItem Text="Diretor_Marketing" Value="Diretor_Marketing" />
                                            <dx:ListEditItem Text="Gerente_Patrimonio" Value="Gerente_Patrimonio" />
                                            <dx:ListEditItem Text="Supervisor_Postos" Value="Supervisor_Postos" /> 
                                            <dx:ListEditItem Text="Gestor_Assistente" Value="Gestor_Assistente" /> 
                                            <dx:ListEditItem Text="GC" Value="GC" /> 
                                        </Items>
                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom"></ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                     </dx:LayoutItem>

                  <dx:LayoutItem Caption="Tipo" FieldName="idTipo" CaptionStyle-Font-Bold="true">
                          <LayoutItemNestedControlCollection>
                               <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer6" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxRadioButtonList ID="rbl_Loja_Adm" runat="server" RepeatDirection="Horizontal" Theme="MaterialCompactOrange" >
                                            <Items>
                                                <dx:ListEditItem Text="Loja" Value="Loja" Selected="true" />
                                                <dx:ListEditItem Text="Adm" Value="Adm" />
                                            </Items>
                                            <Border BorderStyle="None" />
                                        </dx:ASPxRadioButtonList>
                               </dx:LayoutItemNestedControlContainer>
                          </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                    </dx:LayoutItem>

                  <dx:LayoutItem Caption="Filial" FieldName="idFilial" CaptionStyle-Font-Bold="true">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" Font-Size="20px" runat="server" SupportsDisabledAttribute="True">
                                    <uc1:wucListaLojasComCorporacao runat="server" id="cboFilial" />
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                 </dx:LayoutItem>

                  <dx:LayoutItem Caption="É Loja" FieldName="idELoja" CaptionStyle-Font-Bold="true">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer5" Font-Size="20px" runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxCheckBox ID="isLoja" runat="server" Checked="True" Theme="Moderno" ></dx:ASPxCheckBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>

<CaptionStyle Font-Bold="True"></CaptionStyle>
                        </dx:LayoutItem>

                    </Items>
                 </dx:LayoutGroup>

                 <dx:LayoutItem ShowCaption="False" HorizontalAlign="Left">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer7" runat="server" SupportsDisabledAttribute="True">
                            <dx:ASPxButton ID="btnSalvar" runat="server" 
                                Text="Atualizar" Width="100" Theme="Office365" />
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>

            </Items>

        </dx:ASPxFormLayout>
    </div>

</asp:Content>

