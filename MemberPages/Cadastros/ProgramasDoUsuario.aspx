<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProgramasDoUsuario.aspx.vb" Inherits="MemberPages_Cadastros_ProgramasDoUsuario" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%">
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Width="30px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sort" VisibleIndex="2" Width="30px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Question" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Item" FieldName="Answer" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ParentID" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="link" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Grupo Imagem" FieldName="QuestionImage" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Item Imagem" FieldName="AnswerImage" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Item ToolTip" FieldName="AnswerToolTip" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="QuestionToolTip" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idMaster" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager PageSize="20" Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="Inline" />
            <Settings ShowFilterRow="True" VerticalScrollableHeight="700" VerticalScrollBarMode="Auto" />
        </dx:ASPxGridView>    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" DeleteCommand="DELETE FROM Menu.[tblProgramas] WHERE [ID] = @ID" InsertCommand="INSERT INTO Menu.[tblProgramas] ([Sort], [Question], [Answer], [ParentID], [link], [QuestionImage], [AnswerImage], [AnswerToolTip], [QuestionToolTip], [idMaster]) VALUES ( @Sort, @Question, @Answer, @ParentID, @link, @QuestionImage, @AnswerImage, @AnswerToolTip, @QuestionToolTip, @idMaster)" SelectCommand="SELECT [ID], [Sort], [Question], [Answer], [ParentID], [link], [QuestionImage], [AnswerImage], [AnswerToolTip], [QuestionToolTip],[idMaster] FROM Menu.[tblProgramas]" UpdateCommand="UPDATE Menu.[tblProgramas] SET [Sort] = @Sort, [Question] = @Question, [Answer] = @Answer, [ParentID] = @ParentID, [link] = @link, [QuestionImage] = @QuestionImage, [AnswerImage] = @AnswerImage, [AnswerToolTip] = @AnswerToolTip, [QuestionToolTip] = @QuestionToolTip, [idMaster] = @idMaster WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>                
                <asp:Parameter Name="Sort" Type="String" />
                <asp:Parameter Name="Question" Type="String" />
                <asp:Parameter Name="Answer" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int16" />
                <asp:Parameter Name="link" Type="String" />
                <asp:Parameter Name="QuestionImage" Type="String" />
                <asp:Parameter Name="AnswerImage" Type="String" />
                <asp:Parameter Name="AnswerToolTip" Type="String" />              
                <asp:Parameter Name="QuestionToolTip" Type="String" />
                <asp:Parameter Name="idMaster" Type="Byte" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Sort" Type="String" />
                <asp:Parameter Name="Question" Type="String" />
                <asp:Parameter Name="Answer" Type="String" />
                <asp:Parameter Name="ParentID" Type="Int16" />
                <asp:Parameter Name="link" Type="String" />
                <asp:Parameter Name="QuestionImage" Type="String" />
                <asp:Parameter Name="AnswerImage" Type="String" />
                <asp:Parameter Name="AnswerToolTip" Type="String" />               
                <asp:Parameter Name="QuestionToolTip" Type="String" />
                <asp:Parameter Name="ID" Type="Int16" />
                <asp:Parameter Name="idMaster" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
