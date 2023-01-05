<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/mPatrimonio.master" AutoEventWireup="false" CodeFile="AlterarExcluirPatrimonio.aspx.vb" Inherits="MemberPages_Patrimonio_CadPatrimonio" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 5px;
        }


        #divDiaLegenda {   
            clear: both;         
            float : left;
            padding-top: 5px;
            margin-left: 2px;
            color : red ;
            font-size: 24px;
        }

        #divDia {            
            float : left;
            padding-top: 10px;
            margin-left: 5px;
            
        }

        #divBorda {
            clear: both ;
            float : left;
            margin-top: 8px;           
            border : 2px solid gray;
            height: 350px;
            width:650px;
            margin-left: 5px;
            background-color: rgba(128, 128, 128, 0.90)
        }

        #divSecao {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 2px;
        }

        #divRuaLegenda {
            clear: both ;
            float : left;
                padding-top: 9px;
                margin-left: 2px;
        }

        #divRua {           
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
               

        #divSalvar {
            clear: both ;
            float : left;
            padding-top : 7px;
             padding-left : 70px;

        }

        .Formatar {  
            clear: both;          
            float : left;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;
            
        }

        .h-divider {
            margin-bottom: -5px;
            margin-top: 10px;
            height: 1px;
            width: 100%;
            border-top: 1px solid gray;
        }
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">

            
        <div id="divCabecalho" class="container bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-8 "><h2 class="Negrito">Alteração / Exclusão do Patrimônio</h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>  
<%--                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Área</div>  
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Conta</div> 
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Data</div>    --%>                     
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                </div>

                <div class="col-md-3  ">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar"></dx:ASPxButton>
                </div>
                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container divBordas fundo1">
            <div class="row">
                <div class="col-md-12 ">
                    
                    <dx:ASPxGridView ID="gridPatrimonio" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Caption="Manutenção" Width="150px" ShowEditButton="True" ShowDeleteButton="True" ShowUpdateButton="True">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EAN" VisibleIndex="2" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" VisibleIndex="3" Width="65px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Preco" VisibleIndex="4" Width="65px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NomeFiscalAbordagem" VisibleIndex="6" Caption="Nome Fiscal &lt;br&gt; da Abordagem" Width="80px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Observacao" VisibleIndex="7" Caption="Observação" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Dia" VisibleIndex="8" Width="80px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="NomeFiscalConstatou" VisibleIndex="9" Caption="Nome Fiscal &lt;br&gt; que Constatou" Width="70px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="10" Width="45px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NumCamera" VisibleIndex="11" Caption="Número &lt;br&gt; Camera" Width="55px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DVR" VisibleIndex="12" Width="40px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="13" Caption="Filial" Width="40px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idReativaPreventiva" VisibleIndex="14" Caption="Reativa &lt;br&gt; Preventiva" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DiaCadastro" VisibleIndex="15" Caption="Dia &lt;br&gt; Cadastro" Width="80px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <SettingsEditing Mode="Inline" />
                        <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" />
                        <SettingsText CommandCancel="Cancelar" CommandEdit="Salvar" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F2F2F2">
                            </AlternatingRow>
                        </Styles>
                        <SettingsCommandButton>
                            <EditButton Text="Alterar">
                                <Image AlternateText="Alterar" Height="16px" Url="~/image/edit-icon-16.png" Width="16px">
                                </Image>
                            </EditButton>
                            <DeleteButton>
                                <Image Height="16px" ToolTip="Excluir entrada" Url="~/image/check_no.png" Width="16px">
                                    <SpriteProperties Left="10px"/>
                                </Image>
                            </DeleteButton>
                            <UpdateButton Text="Salvar">
                                <Image AlternateText="Salvar" Url="~/image/check_16.png" Height="16px" Width="16px">
                                </Image>
                            </UpdateButton>
                        </SettingsCommandButton>
                    </dx:ASPxGridView> 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" DeleteCommand="DELETE FROM [Patrimonio].[tblDados] WHERE [ID] = @original_ID" 
                                                                                                                                                               InsertCommand="INSERT INTO [Patrimonio].[tblDados] ([EAN], [Qtde], [Preco], [Total], [NomeFiscalAbordagem], [Observacao], [Dia], [NomeFiscalConstatou], [Hora], [NumCamera], [DVR], [idFilial], [idReativaPreventiva], [DiaCadastro]) VALUES (@EAN, @Qtde, @Preco, @Total, @NomeFiscalAbordagem, @Observacao, @Dia, @NomeFiscalConstatou, @Hora, @NumCamera, @DVR, @idFilial, @idReativaPreventiva, @DiaCadastro)" OldValuesParameterFormatString="original_{0}" 
                                                                                                                                                                                       SelectCommand="SELECT [ID], [EAN], [Qtde], [Preco], [Total], [NomeFiscalAbordagem], [Observacao], [Dia], [NomeFiscalConstatou], [Hora], [NumCamera], [DVR], [idFilial], [idReativaPreventiva], [DiaCadastro] FROM [Patrimonio].[tblDados] WHERE ([idFilial] = @idFilial)" 
                                                                                                                                                                                       UpdateCommand="UPDATE [Patrimonio].[tblDados] SET [EAN] = @EAN, [Qtde] = @Qtde, [Preco] = @Preco, [Total] = @Total, [NomeFiscalAbordagem] = @NomeFiscalAbordagem, [Observacao] = @Observacao, [Dia] = @Dia, [NomeFiscalConstatou] = @NomeFiscalConstatou, [Hora] = @Hora, [NumCamera] = @NumCamera, [DVR] = @DVR, [idFilial] = @idFilial, [idReativaPreventiva] = @idReativaPreventiva, [DiaCadastro] = @DiaCadastro WHERE [ID] = @original_ID">
                        <DeleteParameters>
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_EAN" Type="Int64" />
                            <asp:Parameter Name="original_Qtde" Type="Decimal" />
                            <asp:Parameter Name="original_Preco" Type="Decimal" />
                            <asp:Parameter Name="original_Total" Type="Decimal" />
                            <asp:Parameter Name="original_NomeFiscalAbordagem" Type="String" />
                            <asp:Parameter Name="original_Observacao" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_Dia" />
                            <asp:Parameter Name="original_NomeFiscalConstatou" Type="String" />
                            <asp:Parameter Name="original_Hora" Type="String" />
                            <asp:Parameter Name="original_NumCamera" Type="String" />
                            <asp:Parameter Name="original_DVR" Type="String" />
                            <asp:Parameter Name="original_idFilial" Type="Int16" />
                            <asp:Parameter Name="original_idReativaPreventiva" Type="Byte" />
                            <asp:Parameter DbType="Date" Name="original_DiaCadastro" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="EAN" Type="Int64" />
                            <asp:Parameter Name="Qtde" Type="Decimal" />
                            <asp:Parameter Name="Preco" Type="Decimal" />
                            <asp:Parameter Name="Total" Type="Decimal" />
                            <asp:Parameter Name="NomeFiscalAbordagem" Type="String" />
                            <asp:Parameter Name="Observacao" Type="String" />
                            <asp:Parameter DbType="Date" Name="Dia" />
                            <asp:Parameter Name="NomeFiscalConstatou" Type="String" />
                            <asp:Parameter Name="Hora" Type="String" />
                            <asp:Parameter Name="NumCamera" Type="String" />
                            <asp:Parameter Name="DVR" Type="String" />
                            <asp:Parameter Name="idFilial" Type="Int16" />
                            <asp:Parameter Name="idReativaPreventiva" Type="Byte" />
                            <asp:Parameter DbType="Date" Name="DiaCadastro" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="3" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EAN" Type="Int64" />
                            <asp:Parameter Name="Qtde" Type="Decimal" />
                            <asp:Parameter Name="Preco" Type="Decimal" />
                            <asp:Parameter Name="Total" Type="Decimal" />
                            <asp:Parameter Name="NomeFiscalAbordagem" Type="String" />
                            <asp:Parameter Name="Observacao" Type="String" />
                            <asp:Parameter DbType="Date" Name="Dia" />
                            <asp:Parameter Name="NomeFiscalConstatou" Type="String" />
                            <asp:Parameter Name="Hora" Type="String" />
                            <asp:Parameter Name="NumCamera" Type="String" />
                            <asp:Parameter Name="DVR" Type="String" />
                            <asp:Parameter Name="idFilial" Type="Int16" />
                            <asp:Parameter Name="idReativaPreventiva" Type="Byte" />
                            <asp:Parameter DbType="Date" Name="DiaCadastro" />
                            <asp:Parameter Name="original_ID" Type="Int32" />
                            <asp:Parameter Name="original_EAN" Type="Int64" />
                            <asp:Parameter Name="original_Qtde" Type="Decimal" />
                            <asp:Parameter Name="original_Preco" Type="Decimal" />
                            <asp:Parameter Name="original_Total" Type="Decimal" />
                            <asp:Parameter Name="original_NomeFiscalAbordagem" Type="String" />
                            <asp:Parameter Name="original_Observacao" Type="String" />
                            <asp:Parameter DbType="Date" Name="original_Dia" />
                            <asp:Parameter Name="original_NomeFiscalConstatou" Type="String" />
                            <asp:Parameter Name="original_Hora" Type="String" />
                            <asp:Parameter Name="original_NumCamera" Type="String" />
                            <asp:Parameter Name="original_DVR" Type="String" />
                            <asp:Parameter Name="original_idFilial" Type="Int16" />
                            <asp:Parameter Name="original_idReativaPreventiva" Type="Byte" />
                            <asp:Parameter DbType="Date" Name="original_DiaCadastro" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div> <%--Botoes--%>

  

                <asp:Label ID="lblError" runat="server" Text="" Font-Size="30px" TabIndex="98"></asp:Label>
 

</div>

</asp:Content>

