Public Class XtraReport_Filial_22
    Inherits DevExpress.XtraReports.UI.XtraReport

#Region " Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private WithEvents sqlDataSource1 As DevExpress.DataAccess.Sql.SqlDataSource
    Private WithEvents Title As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents GroupCaption1 As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents GroupData1 As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents DetailCaption1 As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents DetailData1 As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents GroupFooterBackground3 As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents DetailData3_Odd As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents PageInfo As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents TopMargin As DevExpress.XtraReports.UI.TopMarginBand
    Private WithEvents BottomMargin As DevExpress.XtraReports.UI.BottomMarginBand
    Private WithEvents pageInfo1 As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents pageInfo2 As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents ReportHeader As DevExpress.XtraReports.UI.ReportHeaderBand
    Private WithEvents label1 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents GroupHeader1 As DevExpress.XtraReports.UI.GroupHeaderBand
    Private WithEvents table1 As DevExpress.XtraReports.UI.XRTable
    Private WithEvents tableRow1 As DevExpress.XtraReports.UI.XRTableRow
    Private WithEvents tableCell1 As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents tableCell3 As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents tableCell2 As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents tableCell4 As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Private WithEvents table3 As DevExpress.XtraReports.UI.XRTable
    Private WithEvents tableRow3 As DevExpress.XtraReports.UI.XRTableRow
    Private WithEvents tableCell14 As DevExpress.XtraReports.UI.XRTableCell
    Private WithEvents GroupFooter1 As DevExpress.XtraReports.UI.GroupFooterBand
    Private WithEvents label2 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel2 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel1 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel4 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel3 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrPictureBox1 As DevExpress.XtraReports.UI.XRPictureBox
    Private WithEvents lblResposta As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents lblPergunta As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel5 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel6 As DevExpress.XtraReports.UI.XRLabel

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resourceFileName As String = "XtraReport_Filial_22.resx"
        Dim resources As System.Resources.ResourceManager = Global.Resources.XtraReport_Filial_22.ResourceManager
        Me.components = New System.ComponentModel.Container()
        Dim selectQuery1 As DevExpress.DataAccess.Sql.SelectQuery = New DevExpress.DataAccess.Sql.SelectQuery()
        Dim column1 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression1 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim table2 As DevExpress.DataAccess.Sql.Table = New DevExpress.DataAccess.Sql.Table()
        Dim column2 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression2 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column3 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression3 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column4 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression4 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column5 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression5 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column6 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression6 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column7 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression7 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column8 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression8 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Dim column9 As DevExpress.DataAccess.Sql.Column = New DevExpress.DataAccess.Sql.Column()
        Dim columnExpression9 As DevExpress.DataAccess.Sql.ColumnExpression = New DevExpress.DataAccess.Sql.ColumnExpression()
        Me.sqlDataSource1 = New DevExpress.DataAccess.Sql.SqlDataSource(Me.components)
        Me.Title = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.GroupCaption1 = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.GroupData1 = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.DetailCaption1 = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.DetailData1 = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.GroupFooterBackground3 = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.DetailData3_Odd = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.PageInfo = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.TopMargin = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.BottomMargin = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.pageInfo1 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.pageInfo2 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.ReportHeader = New DevExpress.XtraReports.UI.ReportHeaderBand()
        Me.xrLabel2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.label1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.GroupHeader1 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.table1 = New DevExpress.XtraReports.UI.XRTable()
        Me.tableRow1 = New DevExpress.XtraReports.UI.XRTableRow()
        Me.tableCell1 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.tableCell3 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.tableCell2 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.tableCell4 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.lblResposta = New DevExpress.XtraReports.UI.XRLabel()
        Me.lblPergunta = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrPictureBox1 = New DevExpress.XtraReports.UI.XRPictureBox()
        Me.xrLabel4 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel3 = New DevExpress.XtraReports.UI.XRLabel()
        Me.table3 = New DevExpress.XtraReports.UI.XRTable()
        Me.tableRow3 = New DevExpress.XtraReports.UI.XRTableRow()
        Me.tableCell14 = New DevExpress.XtraReports.UI.XRTableCell()
        Me.GroupFooter1 = New DevExpress.XtraReports.UI.GroupFooterBand()
        Me.label2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel5 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel6 = New DevExpress.XtraReports.UI.XRLabel()
        CType(Me.table1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.table3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'sqlDataSource1
        '
        Me.sqlDataSource1.ConnectionName = "gerCheckListConnectionString"
        Me.sqlDataSource1.Name = "sqlDataSource1"
        columnExpression1.ColumnName = "Dia"
        table2.Name = "Checklist.vReport_Loja22"
        columnExpression1.Table = table2
        column1.Expression = columnExpression1
        columnExpression2.ColumnName = "FilialLista"
        columnExpression2.Table = table2
        column2.Expression = columnExpression2
        columnExpression3.ColumnName = "listaGrupo"
        columnExpression3.Table = table2
        column3.Expression = columnExpression3
        columnExpression4.ColumnName = "listaSubgrupo"
        columnExpression4.Table = table2
        column4.Expression = columnExpression4
        columnExpression5.ColumnName = "descPergunta"
        columnExpression5.Table = table2
        column5.Expression = columnExpression5
        columnExpression6.ColumnName = "Hora"
        columnExpression6.Table = table2
        column6.Expression = columnExpression6
        columnExpression7.ColumnName = "Descricao"
        columnExpression7.Table = table2
        column7.Expression = columnExpression7
        columnExpression8.ColumnName = "imgData"
        columnExpression8.Table = table2
        column8.Expression = columnExpression8
        columnExpression9.ColumnName = "imgTitle"
        columnExpression9.Table = table2
        column9.Expression = columnExpression9
        selectQuery1.Columns.Add(column1)
        selectQuery1.Columns.Add(column2)
        selectQuery1.Columns.Add(column3)
        selectQuery1.Columns.Add(column4)
        selectQuery1.Columns.Add(column5)
        selectQuery1.Columns.Add(column6)
        selectQuery1.Columns.Add(column7)
        selectQuery1.Columns.Add(column8)
        selectQuery1.Columns.Add(column9)
        selectQuery1.Name = "Checklist_vReport_Loja22"
        selectQuery1.Tables.Add(table2)
        Me.sqlDataSource1.Queries.AddRange(New DevExpress.DataAccess.Sql.SqlQuery() {selectQuery1})
        Me.sqlDataSource1.ResultSchemaSerializable = resources.GetString("sqlDataSource1.ResultSchemaSerializable")
        '
        'Title
        '
        Me.Title.BackColor = System.Drawing.Color.Transparent
        Me.Title.BorderColor = System.Drawing.Color.Black
        Me.Title.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.Title.BorderWidth = 1.0!
        Me.Title.Font = New System.Drawing.Font("Arial", 14.25!)
        Me.Title.ForeColor = System.Drawing.Color.FromArgb(CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer))
        Me.Title.Name = "Title"
        '
        'GroupCaption1
        '
        Me.GroupCaption1.BackColor = System.Drawing.Color.FromArgb(CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer))
        Me.GroupCaption1.BorderColor = System.Drawing.Color.White
        Me.GroupCaption1.Borders = DevExpress.XtraPrinting.BorderSide.Bottom
        Me.GroupCaption1.BorderWidth = 2.0!
        Me.GroupCaption1.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold)
        Me.GroupCaption1.ForeColor = System.Drawing.Color.FromArgb(CType(CType(228, Byte), Integer), CType(CType(228, Byte), Integer), CType(CType(228, Byte), Integer))
        Me.GroupCaption1.Name = "GroupCaption1"
        Me.GroupCaption1.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 5, 0, 0, 254.0!)
        Me.GroupCaption1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'GroupData1
        '
        Me.GroupData1.BackColor = System.Drawing.Color.FromArgb(CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer))
        Me.GroupData1.BorderColor = System.Drawing.Color.White
        Me.GroupData1.Borders = DevExpress.XtraPrinting.BorderSide.Bottom
        Me.GroupData1.BorderWidth = 2.0!
        Me.GroupData1.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold)
        Me.GroupData1.ForeColor = System.Drawing.Color.White
        Me.GroupData1.Name = "GroupData1"
        Me.GroupData1.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 5, 0, 0, 254.0!)
        Me.GroupData1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'DetailCaption1
        '
        Me.DetailCaption1.BackColor = System.Drawing.Color.FromArgb(CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer))
        Me.DetailCaption1.BorderColor = System.Drawing.Color.White
        Me.DetailCaption1.Borders = DevExpress.XtraPrinting.BorderSide.Left
        Me.DetailCaption1.BorderWidth = 2.0!
        Me.DetailCaption1.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold)
        Me.DetailCaption1.ForeColor = System.Drawing.Color.White
        Me.DetailCaption1.Name = "DetailCaption1"
        Me.DetailCaption1.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 15, 0, 0, 254.0!)
        Me.DetailCaption1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'DetailData1
        '
        Me.DetailData1.BorderColor = System.Drawing.Color.Transparent
        Me.DetailData1.Borders = DevExpress.XtraPrinting.BorderSide.Left
        Me.DetailData1.BorderWidth = 2.0!
        Me.DetailData1.Font = New System.Drawing.Font("Arial", 8.25!)
        Me.DetailData1.ForeColor = System.Drawing.Color.Black
        Me.DetailData1.Name = "DetailData1"
        Me.DetailData1.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 15, 0, 0, 254.0!)
        Me.DetailData1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'GroupFooterBackground3
        '
        Me.GroupFooterBackground3.BackColor = System.Drawing.Color.FromArgb(CType(CType(131, Byte), Integer), CType(CType(131, Byte), Integer), CType(CType(131, Byte), Integer))
        Me.GroupFooterBackground3.BorderColor = System.Drawing.Color.White
        Me.GroupFooterBackground3.Borders = DevExpress.XtraPrinting.BorderSide.Bottom
        Me.GroupFooterBackground3.BorderWidth = 2.0!
        Me.GroupFooterBackground3.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold)
        Me.GroupFooterBackground3.ForeColor = System.Drawing.Color.FromArgb(CType(CType(228, Byte), Integer), CType(CType(228, Byte), Integer), CType(CType(228, Byte), Integer))
        Me.GroupFooterBackground3.Name = "GroupFooterBackground3"
        Me.GroupFooterBackground3.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 5, 0, 0, 254.0!)
        Me.GroupFooterBackground3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'DetailData3_Odd
        '
        Me.DetailData3_Odd.BackColor = System.Drawing.Color.FromArgb(CType(CType(231, Byte), Integer), CType(CType(231, Byte), Integer), CType(CType(231, Byte), Integer))
        Me.DetailData3_Odd.BorderColor = System.Drawing.Color.Transparent
        Me.DetailData3_Odd.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.DetailData3_Odd.BorderWidth = 1.0!
        Me.DetailData3_Odd.Font = New System.Drawing.Font("Arial", 8.25!)
        Me.DetailData3_Odd.ForeColor = System.Drawing.Color.Black
        Me.DetailData3_Odd.Name = "DetailData3_Odd"
        Me.DetailData3_Odd.Padding = New DevExpress.XtraPrinting.PaddingInfo(15, 15, 0, 0, 254.0!)
        Me.DetailData3_Odd.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'PageInfo
        '
        Me.PageInfo.Font = New System.Drawing.Font("Arial", 8.25!, System.Drawing.FontStyle.Bold)
        Me.PageInfo.ForeColor = System.Drawing.Color.FromArgb(CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer), CType(CType(75, Byte), Integer))
        Me.PageInfo.Name = "PageInfo"
        Me.PageInfo.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        '
        'TopMargin
        '
        Me.TopMargin.Dpi = 254.0!
        Me.TopMargin.HeightF = 50.0!
        Me.TopMargin.Name = "TopMargin"
        '
        'BottomMargin
        '
        Me.BottomMargin.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.pageInfo1, Me.pageInfo2})
        Me.BottomMargin.Dpi = 254.0!
        Me.BottomMargin.HeightF = 74.4199982!
        Me.BottomMargin.Name = "BottomMargin"
        '
        'pageInfo1
        '
        Me.pageInfo1.Dpi = 254.0!
        Me.pageInfo1.LocationFloat = New DevExpress.Utils.PointFloat(16.0!, 16.0!)
        Me.pageInfo1.Name = "pageInfo1"
        Me.pageInfo1.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.pageInfo1.SizeF = New System.Drawing.SizeF(998.0!, 58.0!)
        Me.pageInfo1.StyleName = "PageInfo"
        '
        'pageInfo2
        '
        Me.pageInfo2.Dpi = 254.0!
        Me.pageInfo2.LocationFloat = New DevExpress.Utils.PointFloat(1046.0!, 16.0!)
        Me.pageInfo2.Name = "pageInfo2"
        Me.pageInfo2.SizeF = New System.Drawing.SizeF(998.0!, 58.0!)
        Me.pageInfo2.StyleName = "PageInfo"
        Me.pageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        Me.pageInfo2.TextFormatString = "Page {0} of {1}"
        '
        'ReportHeader
        '
        Me.ReportHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.xrLabel6, Me.xrLabel5, Me.xrLabel2, Me.xrLabel1, Me.label1})
        Me.ReportHeader.Dpi = 254.0!
        Me.ReportHeader.HeightF = 152.399994!
        Me.ReportHeader.Name = "ReportHeader"
        '
        'xrLabel2
        '
        Me.xrLabel2.Dpi = 254.0!
        Me.xrLabel2.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[FilialLista]")})
        Me.xrLabel2.Font = New System.Drawing.Font("Arial", 12.75!, System.Drawing.FontStyle.Bold)
        Me.xrLabel2.LocationFloat = New DevExpress.Utils.PointFloat(148.291702!, 88.97995!)
        Me.xrLabel2.Multiline = True
        Me.xrLabel2.Name = "xrLabel2"
        Me.xrLabel2.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel2.SizeF = New System.Drawing.SizeF(1172.104!, 63.4200287!)
        Me.xrLabel2.StylePriority.UseFont = False
        Me.xrLabel2.StylePriority.UseTextAlignment = False
        Me.xrLabel2.Text = "xrLabel2"
        Me.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrLabel1
        '
        Me.xrLabel1.Dpi = 254.0!
        Me.xrLabel1.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[Dia]")})
        Me.xrLabel1.Font = New System.Drawing.Font("Arial", 12.75!, System.Drawing.FontStyle.Bold)
        Me.xrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(1806.0!, 88.97995!)
        Me.xrLabel1.Multiline = True
        Me.xrLabel1.Name = "xrLabel1"
        Me.xrLabel1.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel1.SizeF = New System.Drawing.SizeF(237.999893!, 63.4200287!)
        Me.xrLabel1.StylePriority.UseFont = False
        Me.xrLabel1.StylePriority.UseTextAlignment = False
        Me.xrLabel1.Text = "xrLabel1"
        Me.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        Me.xrLabel1.TextFormatString = "{0:d}"
        '
        'label1
        '
        Me.label1.Dpi = 254.0!
        Me.label1.Font = New System.Drawing.Font("Arial", 16.25!, System.Drawing.FontStyle.Bold)
        Me.label1.LocationFloat = New DevExpress.Utils.PointFloat(16.0000095!, 0.0!)
        Me.label1.Name = "label1"
        Me.label1.SizeF = New System.Drawing.SizeF(2028.0!, 77.4536133!)
        Me.label1.StyleName = "Title"
        Me.label1.StylePriority.UseFont = False
        Me.label1.StylePriority.UseTextAlignment = False
        Me.label1.Text = "Relatório Diário Check-List"
        Me.label1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        '
        'GroupHeader1
        '
        Me.GroupHeader1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.table1})
        Me.GroupHeader1.Dpi = 254.0!
        Me.GroupHeader1.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("listaGrupo", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending), New DevExpress.XtraReports.UI.GroupField("listaSubgrupo", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.GroupHeader1.GroupUnion = DevExpress.XtraReports.UI.GroupUnion.WithFirstDetail
        Me.GroupHeader1.HeightF = 68.5800018!
        Me.GroupHeader1.Level = 1
        Me.GroupHeader1.Name = "GroupHeader1"
        '
        'table1
        '
        Me.table1.Dpi = 254.0!
        Me.table1.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 5.07999992!)
        Me.table1.Name = "table1"
        Me.table1.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.tableRow1})
        Me.table1.SizeF = New System.Drawing.SizeF(2060.0!, 63.5!)
        '
        'tableRow1
        '
        Me.tableRow1.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.tableCell1, Me.tableCell3, Me.tableCell2, Me.tableCell4})
        Me.tableRow1.Dpi = 254.0!
        Me.tableRow1.Name = "tableRow1"
        Me.tableRow1.Weight = 1.0R
        '
        'tableCell1
        '
        Me.tableCell1.Dpi = 254.0!
        Me.tableCell1.Name = "tableCell1"
        Me.tableCell1.StyleName = "GroupCaption1"
        Me.tableCell1.Text = "Grupo: "
        Me.tableCell1.Weight = 0.063869260254359295R
        '
        'tableCell3
        '
        Me.tableCell3.Dpi = 254.0!
        Me.tableCell3.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[listaGrupo]")})
        Me.tableCell3.Name = "tableCell3"
        Me.tableCell3.StyleName = "GroupData1"
        Me.tableCell3.Weight = 0.35670912660632531R
        '
        'tableCell2
        '
        Me.tableCell2.Dpi = 254.0!
        Me.tableCell2.Name = "tableCell2"
        Me.tableCell2.StyleName = "GroupCaption1"
        Me.tableCell2.Text = "Subgrupo:"
        Me.tableCell2.Weight = 0.087188637775468134R
        '
        'tableCell4
        '
        Me.tableCell4.Dpi = 254.0!
        Me.tableCell4.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[listaSubgrupo]")})
        Me.tableCell4.Name = "tableCell4"
        Me.tableCell4.StyleName = "GroupData1"
        Me.tableCell4.Weight = 0.49223300499256389R
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.lblResposta, Me.lblPergunta, Me.xrPictureBox1, Me.xrLabel4, Me.xrLabel3, Me.table3})
        Me.Detail.Dpi = 254.0!
        Me.Detail.HeightF = 215.705093!
        Me.Detail.Name = "Detail"
        '
        'lblResposta
        '
        Me.lblResposta.Dpi = 254.0!
        Me.lblResposta.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.lblResposta.ForeColor = System.Drawing.Color.Red
        Me.lblResposta.LocationFloat = New DevExpress.Utils.PointFloat(15.9999905!, 76.649147!)
        Me.lblResposta.Multiline = True
        Me.lblResposta.Name = "lblResposta"
        Me.lblResposta.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.lblResposta.SizeF = New System.Drawing.SizeF(171.979202!, 58.4199905!)
        Me.lblResposta.StylePriority.UseFont = False
        Me.lblResposta.StylePriority.UseForeColor = False
        Me.lblResposta.Text = "Resposta:"
        '
        'lblPergunta
        '
        Me.lblPergunta.Dpi = 254.0!
        Me.lblPergunta.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.lblPergunta.ForeColor = System.Drawing.Color.Blue
        Me.lblPergunta.LocationFloat = New DevExpress.Utils.PointFloat(15.9999905!, 0.0!)
        Me.lblPergunta.Multiline = True
        Me.lblPergunta.Name = "lblPergunta"
        Me.lblPergunta.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.lblPergunta.SizeF = New System.Drawing.SizeF(171.979202!, 63.4199791!)
        Me.lblPergunta.StylePriority.UseFont = False
        Me.lblPergunta.StylePriority.UseForeColor = False
        Me.lblPergunta.StylePriority.UseTextAlignment = False
        Me.lblPergunta.Text = "Pergunta:"
        Me.lblPergunta.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'xrPictureBox1
        '
        Me.xrPictureBox1.Dpi = 254.0!
        Me.xrPictureBox1.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "ImageSource", "[imgData]")})
        Me.xrPictureBox1.LocationFloat = New DevExpress.Utils.PointFloat(15.9999905!, 150.452499!)
        Me.xrPictureBox1.Name = "xrPictureBox1"
        Me.xrPictureBox1.SizeF = New System.Drawing.SizeF(254.0!, 58.4199982!)
        Me.xrPictureBox1.Sizing = DevExpress.XtraPrinting.ImageSizeMode.AutoSize
        '
        'xrLabel4
        '
        Me.xrLabel4.Dpi = 254.0!
        Me.xrLabel4.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[Hora]")})
        Me.xrLabel4.LocationFloat = New DevExpress.Utils.PointFloat(1806.0!, 5.00001812!)
        Me.xrLabel4.Multiline = True
        Me.xrLabel4.Name = "xrLabel4"
        Me.xrLabel4.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel4.SizeF = New System.Drawing.SizeF(254.0!, 58.4199982!)
        Me.xrLabel4.StylePriority.UseTextAlignment = False
        Me.xrLabel4.Text = "xrLabel4"
        Me.xrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'xrLabel3
        '
        Me.xrLabel3.Dpi = 254.0!
        Me.xrLabel3.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[Descricao]")})
        Me.xrLabel3.Font = New System.Drawing.Font("Tahoma", 9.75!)
        Me.xrLabel3.ForeColor = System.Drawing.Color.Red
        Me.xrLabel3.LocationFloat = New DevExpress.Utils.PointFloat(187.979202!, 76.649147!)
        Me.xrLabel3.Multiline = True
        Me.xrLabel3.Name = "xrLabel3"
        Me.xrLabel3.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel3.SizeF = New System.Drawing.SizeF(1872.021!, 58.4199905!)
        Me.xrLabel3.StylePriority.UseFont = False
        Me.xrLabel3.StylePriority.UseForeColor = False
        Me.xrLabel3.Text = "xrLabel3"
        '
        'table3
        '
        Me.table3.Dpi = 254.0!
        Me.table3.LocationFloat = New DevExpress.Utils.PointFloat(187.979202!, 0.0!)
        Me.table3.Name = "table3"
        Me.table3.OddStyleName = "DetailData3_Odd"
        Me.table3.Rows.AddRange(New DevExpress.XtraReports.UI.XRTableRow() {Me.tableRow3})
        Me.table3.SizeF = New System.Drawing.SizeF(1618.021!, 63.4199982!)
        '
        'tableRow3
        '
        Me.tableRow3.Cells.AddRange(New DevExpress.XtraReports.UI.XRTableCell() {Me.tableCell14})
        Me.tableRow3.Dpi = 254.0!
        Me.tableRow3.Name = "tableRow3"
        Me.tableRow3.Weight = 11.683999633789062R
        '
        'tableCell14
        '
        Me.tableCell14.Dpi = 254.0!
        Me.tableCell14.ExpressionBindings.AddRange(New DevExpress.XtraReports.UI.ExpressionBinding() {New DevExpress.XtraReports.UI.ExpressionBinding("BeforePrint", "Text", "[descPergunta]")})
        Me.tableCell14.Font = New System.Drawing.Font("Tahoma", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.tableCell14.ForeColor = System.Drawing.Color.Blue
        Me.tableCell14.Name = "tableCell14"
        Me.tableCell14.StyleName = "DetailData1"
        Me.tableCell14.StylePriority.UseBackColor = False
        Me.tableCell14.StylePriority.UseFont = False
        Me.tableCell14.StylePriority.UseForeColor = False
        Me.tableCell14.Weight = 0.31277412488622575R
        '
        'GroupFooter1
        '
        Me.GroupFooter1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.label2})
        Me.GroupFooter1.Dpi = 254.0!
        Me.GroupFooter1.GroupUnion = DevExpress.XtraReports.UI.GroupFooterUnion.WithLastDetail
        Me.GroupFooter1.HeightF = 15.2399998!
        Me.GroupFooter1.Name = "GroupFooter1"
        '
        'label2
        '
        Me.label2.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.label2.Dpi = 254.0!
        Me.label2.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 0.0!)
        Me.label2.Name = "label2"
        Me.label2.SizeF = New System.Drawing.SizeF(2060.0!, 5.28319979!)
        Me.label2.StyleName = "GroupFooterBackground3"
        Me.label2.StylePriority.UseBorders = False
        '
        'xrLabel5
        '
        Me.xrLabel5.Dpi = 254.0!
        Me.xrLabel5.Font = New System.Drawing.Font("Arial", 12.75!, System.Drawing.FontStyle.Bold)
        Me.xrLabel5.ForeColor = System.Drawing.Color.Black
        Me.xrLabel5.LocationFloat = New DevExpress.Utils.PointFloat(1673.70898!, 88.97995!)
        Me.xrLabel5.Multiline = True
        Me.xrLabel5.Name = "xrLabel5"
        Me.xrLabel5.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel5.SizeF = New System.Drawing.SizeF(132.291595!, 63.4199791!)
        Me.xrLabel5.StylePriority.UseFont = False
        Me.xrLabel5.StylePriority.UseForeColor = False
        Me.xrLabel5.StylePriority.UseTextAlignment = False
        Me.xrLabel5.Text = "Dia:"
        Me.xrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'xrLabel6
        '
        Me.xrLabel6.Dpi = 254.0!
        Me.xrLabel6.Font = New System.Drawing.Font("Arial", 12.75!, System.Drawing.FontStyle.Bold)
        Me.xrLabel6.ForeColor = System.Drawing.Color.Black
        Me.xrLabel6.LocationFloat = New DevExpress.Utils.PointFloat(15.9999905!, 88.97995!)
        Me.xrLabel6.Multiline = True
        Me.xrLabel6.Name = "xrLabel6"
        Me.xrLabel6.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.xrLabel6.SizeF = New System.Drawing.SizeF(132.291595!, 63.4199791!)
        Me.xrLabel6.StylePriority.UseFont = False
        Me.xrLabel6.StylePriority.UseForeColor = False
        Me.xrLabel6.StylePriority.UseTextAlignment = False
        Me.xrLabel6.Text = "Filial:"
        Me.xrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'XtraReport_Filial_22
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.TopMargin, Me.BottomMargin, Me.ReportHeader, Me.GroupHeader1, Me.Detail, Me.GroupFooter1})
        Me.ComponentStorage.AddRange(New System.ComponentModel.IComponent() {Me.sqlDataSource1})
        Me.DataMember = "Checklist_vReport_Loja22"
        Me.DataSource = Me.sqlDataSource1
        Me.Dpi = 254.0!
        Me.Font = New System.Drawing.Font("Arial", 9.75!)
        Me.Margins = New System.Drawing.Printing.Margins(20, 20, 50, 74)
        Me.PageHeight = 2970
        Me.PageWidth = 2100
        Me.PaperKind = System.Drawing.Printing.PaperKind.A4
        Me.ReportUnit = DevExpress.XtraReports.UI.ReportUnit.TenthsOfAMillimeter
        Me.SnapGridSize = 25.0!
        Me.StyleSheet.AddRange(New DevExpress.XtraReports.UI.XRControlStyle() {Me.Title, Me.GroupCaption1, Me.GroupData1, Me.DetailCaption1, Me.DetailData1, Me.GroupFooterBackground3, Me.DetailData3_Odd, Me.PageInfo})
        Me.Version = "18.2"
        CType(Me.table1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.table3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

#End Region

    Private Sub xrPictureBox1_BeforePrint(sender As Object, e As Drawing.Printing.PrintEventArgs)
        xrPictureBox1.HeightF = 60
        xrPictureBox1.WidthF = 60

    End Sub
End Class