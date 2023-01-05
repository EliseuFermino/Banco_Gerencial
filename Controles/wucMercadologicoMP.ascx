<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucMercadologicoMP.ascx.vb" Inherits="Controles_wucMercadologicoMP" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

    <style type ="text/css" >
 

        #divOpcoes {            
            float: left;
            width:200px;
            margin-left:3px;
            background-color: lightgray;
        }

        #divOpcaoTotal {
            float: left;
            padding-left: 8px;
        }

        #divOpcaoDepto {
            float:left;
            padding-left:8px;
        }

        #divOpcaoSecao {
            float:left;
            padding-left:8px;
        }

        #divOpcaoGrupo {
            float:left;
            padding-left:8px;
        }

        #divOpcaoSubgrupo {
            float:left;
            padding-left:8px;
        }

        #divLabelDepto {
            clear:both;
            padding-left: 2px;  
            width:50px;          
        }

        #divDepto {    
            float: left;                  
            width:50px;
            padding-left: 50px; 
            margin-top: -20px;          
        }

        #divLabelSecao {
            clear:both;
            padding-left: 2px;  
            width:50px;   
        }

        #divSecao {    
            float: left;        
            width:150px;
            padding-left: 50px;
            margin-top: -20px;             
        }

        #divLabelGrupo {
            clear:both;
            padding-left: 2px;  
            width:50px;   
        }

        #divGrupo {      
            float: left;       
            width:150px;
            padding-left: 50px;
            margin-top: -20px;            
        }

        #divLabelSubgrupo {
            clear:both;
            padding-left: 2px;  
            width:50px;   
        }

        #divSubgrupo {            
            width:150px;
            padding-left: 50px;
            margin-top: -20px;             
        }

    </style>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <%--<div id="moldura">--%>
            <div id="divOpcoes">
                <div id="divOpcaoTotal">
                    <asp:RadioButton ID="rndTotal" runat="server" Text="T" ToolTip="Total" GroupName="grpOpcao" Checked="True" AutoPostBack="true" />
                </div>

                <div id="divOpcaoDepto">
                    <asp:RadioButton ID="rndDepto" runat="server" Text="D" ToolTip="Departamento" GroupName="grpOpcao" AutoPostBack="true" />
                </div>

                <div id="divOpcaoSecao">
                    <asp:RadioButton ID="rndSecao" runat="server" Text="S" ToolTip="Setor ou Seção" GroupName="grpOpcao" AutoPostBack="true" />
                </div>

                <div id="divOpcaoGrupo">
                    <asp:RadioButton ID="rndGrupo" runat="server" Text="G" ToolTip="Grupo de familia" GroupName="grpOpcao" AutoPostBack="true" />
                </div>

                <div id="divOpcaoSubgrupo">
                    <asp:RadioButton ID="rndSubgrupo" runat="server" Text="F" ToolTip="Familia" GroupName="grpOpcao" AutoPostBack="true" />
                </div>

            </div>

            <div id="divLabelDepto">
                <asp:Label ID="lblDepto" runat="server" Text="Depto:"  Visible="false"></asp:Label>
            </div>
            <div id="divDepto">
                <asp:DropDownList ID="cboDepto" runat="server" DataSourceID="sqlDepto" DataTextField="ListaReduzida" DataValueField="idDepto" AutoPostBack="True" Visible="False" Width="153px"></asp:DropDownList>

                <asp:SqlDataSource ID="sqlDepto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            </div>

            <div id="divLabelSecao">
                <asp:Label ID="lblSecao" runat="server" Text="Seção:" Visible="false"></asp:Label>
            </div>
            <div id="divSecao">
                <asp:DropDownList ID="cboSecao" runat="server" DataSourceID="sqlSecao" DataTextField="ListaReduzida" DataValueField="idSecao" AutoPostBack="True" Visible="False" Width="153px"></asp:DropDownList>
                     
                <asp:SqlDataSource ID="sqlSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboSecaoFiltro" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="SelectedValue" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
                     
            </div>

            <div id="divLabelGrupo">
                <asp:Label ID="lblGrupo" runat="server" Text="Grupo:" Visible="false"></asp:Label>
            </div>
            <div id="divGrupo">
                <asp:DropDownList ID="cboGrupo" runat="server" DataSourceID="sqlGrupo" DataTextField="ListaReduzida" DataValueField="idGrupo" AutoPostBack="True" Visible="False" Width="153px"></asp:DropDownList>

                <asp:SqlDataSource ID="sqlGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboGrupo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboSecao" Name="idSecao" PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <div id="divLabelSubgrupo">
                 <asp:Label ID="lblSubgrupo" runat="server" Text="Familia:" Visible="false"></asp:Label>
            </div>
            <div id="divSubgrupo">
                <asp:DropDownList ID="cboSubgrupo" runat="server" DataSourceID="sqlSubgrupo" DataTextField="ListaReduzida" DataValueField="idSubgrupo" AutoPostBack="True" Visible="False" Width="153px"></asp:DropDownList> 
                   
                <asp:SqlDataSource ID="sqlSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Cadastros.uspCboSubgrupo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="SelectedValue" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   
            </div>
       <%-- </div>--%>

    </ContentTemplate>
</asp:UpdatePanel>





    



