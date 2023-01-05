Public Class XtraReport_F04
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
    Private WithEvents xrLabel14 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel15 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel16 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel18 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents vReportAdapter1 As ReportCheckList_F04TableAdapters.vReportAdapter_F04
    Private WithEvents reportCheckList1 As ReportCheckList_F04
    Private WithEvents groupHeaderBand1 As DevExpress.XtraReports.UI.GroupHeaderBand
    Private WithEvents xrLabel2 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel1 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLine1 As DevExpress.XtraReports.UI.XRLine
    Private WithEvents xrLabel4 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel3 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel7 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel9 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel5 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel6 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel12 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLabel13 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents pageFooterBand1 As DevExpress.XtraReports.UI.PageFooterBand
    Private WithEvents xrLine3 As DevExpress.XtraReports.UI.XRLine
    Private WithEvents xrPageInfo1 As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents xrPageInfo2 As DevExpress.XtraReports.UI.XRPageInfo
    Private WithEvents reportHeaderBand1 As DevExpress.XtraReports.UI.ReportHeaderBand
    Private WithEvents xrLabel19 As DevExpress.XtraReports.UI.XRLabel
    Private WithEvents xrLine5 As DevExpress.XtraReports.UI.XRLine
    Private WithEvents Title As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents FieldCaption As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents PageInfo As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents DataField As DevExpress.XtraReports.UI.XRControlStyle
    Private WithEvents topMarginBand1 As DevExpress.XtraReports.UI.TopMarginBand
    Private WithEvents bottomMarginBand1 As DevExpress.XtraReports.UI.BottomMarginBand
    Private WithEvents xrPictureBox1 As DevExpress.XtraReports.UI.XRPictureBox
    Private WithEvents vReportAdapter2 As dstReport2TableAdapters.vReportAdapter
    Private WithEvents reportCheckList2 As ReportCheckList_F04
    Private WithEvents reportCheckList3 As ReportCheckList_F04
    Private WithEvents reportCheckList4 As ReportCheckList_F04
    Private WithEvents reportCheckList5 As ReportCheckList_F04

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resourceFileName As String = "XtraReport_F04.resx"
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.vReportAdapter1 = New ReportCheckList_F04TableAdapters.vReportAdapter_F04()
        Me.reportCheckList1 = New ReportCheckList_F04()
        Me.groupHeaderBand1 = New DevExpress.XtraReports.UI.GroupHeaderBand()
        Me.xrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLine1 = New DevExpress.XtraReports.UI.XRLine()
        Me.xrLabel3 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel4 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel5 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel6 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel7 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel9 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel12 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel13 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel14 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel15 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel16 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLabel18 = New DevExpress.XtraReports.UI.XRLabel()
        Me.pageFooterBand1 = New DevExpress.XtraReports.UI.PageFooterBand()
        Me.xrLine3 = New DevExpress.XtraReports.UI.XRLine()
        Me.xrPageInfo1 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.xrPageInfo2 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.reportHeaderBand1 = New DevExpress.XtraReports.UI.ReportHeaderBand()
        Me.xrLabel19 = New DevExpress.XtraReports.UI.XRLabel()
        Me.xrLine5 = New DevExpress.XtraReports.UI.XRLine()
        Me.Title = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.FieldCaption = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.PageInfo = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.DataField = New DevExpress.XtraReports.UI.XRControlStyle()
        Me.topMarginBand1 = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.bottomMarginBand1 = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.xrPictureBox1 = New DevExpress.XtraReports.UI.XRPictureBox()
        Me.vReportAdapter2 = New dstReport2TableAdapters.vReportAdapter()
        Me.reportCheckList2 = New ReportCheckList_F04()
        Me.reportCheckList3 = New ReportCheckList_F04()
        Me.reportCheckList4 = New ReportCheckList_F04()
        Me.reportCheckList5 = New ReportCheckList_F04()
        CType(Me.reportCheckList1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.reportCheckList2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.reportCheckList3, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.reportCheckList4, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.reportCheckList5, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.xrPictureBox1, Me.xrLabel14, Me.xrLabel15, Me.xrLabel16, Me.xrLabel18, Me.xrLabel7, Me.xrLabel9, Me.xrLine1})
        Me.Detail.HeightF = 102.166702!
        Me.Detail.Name = "Detail"
        Me.Detail.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100.0!)
        Me.Detail.StyleName = "DataField"
        Me.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft
        '
        'vReportAdapter1
        '
        Me.vReportAdapter1.ClearBeforeFill = True
        '
        'reportCheckList1
        '
        Me.reportCheckList1.DataSetName = "ReportCheckList_F04"
        Me.reportCheckList1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'groupHeaderBand1
        '
        Me.groupHeaderBand1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.xrLabel2, Me.xrLabel1, Me.xrLabel3, Me.xrLabel4})
        Me.groupHeaderBand1.GroupFields.AddRange(New DevExpress.XtraReports.UI.GroupField() {New DevExpress.XtraReports.UI.GroupField("listaGrupo", DevExpress.XtraReports.UI.XRColumnSortOrder.Ascending)})
        Me.groupHeaderBand1.HeightF = 26.0000095!
        Me.groupHeaderBand1.Name = "groupHeaderBand1"
        '
        'xrLabel1
        '
        Me.xrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(6.00001001!, 0.333341002!)
        Me.xrLabel1.Name = "xrLabel1"
        Me.xrLabel1.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 7, 0, 100.0!)
        Me.xrLabel1.SizeF = New System.Drawing.SizeF(53.0!, 25.6666698!)
        Me.xrLabel1.StyleName = "FieldCaption"
        Me.xrLabel1.StylePriority.UsePadding = False
        Me.xrLabel1.Text = "Grupo:"
        '
        'xrLabel2
        '
        Me.xrLabel2.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.listaGrupo")})
        Me.xrLabel2.LocationFloat = New DevExpress.Utils.PointFloat(59.0000191!, 0.333341002!)
        Me.xrLabel2.Name = "xrLabel2"
        Me.xrLabel2.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 7, 0, 100.0!)
        Me.xrLabel2.SizeF = New System.Drawing.SizeF(243.009293!, 25.6666603!)
        Me.xrLabel2.StyleName = "DataField"
        Me.xrLabel2.StylePriority.UsePadding = False
        Me.xrLabel2.Text = "xrLabel2"
        '
        'xrLine1
        '
        Me.xrLine1.BorderDashStyle = DevExpress.XtraPrinting.BorderDashStyle.Dash
        Me.xrLine1.LocationFloat = New DevExpress.Utils.PointFloat(0.0!, 5.0!)
        Me.xrLine1.Name = "xrLine1"
        Me.xrLine1.SizeF = New System.Drawing.SizeF(638.000122!, 2.0!)
        Me.xrLine1.StylePriority.UseBorderDashStyle = False
        '
        'xrLabel3
        '
        Me.xrLabel3.LocationFloat = New DevExpress.Utils.PointFloat(331.0!, 0.0!)
        Me.xrLabel3.Name = "xrLabel3"
        Me.xrLabel3.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 7, 0, 100.0!)
        Me.xrLabel3.SizeF = New System.Drawing.SizeF(78.0416565!, 26.0!)
        Me.xrLabel3.StyleName = "FieldCaption"
        Me.xrLabel3.StylePriority.UsePadding = False
        Me.xrLabel3.Text = "Subgrupo:"
        '
        'xrLabel4
        '
        Me.xrLabel4.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.listaSubgrupo")})
        Me.xrLabel4.LocationFloat = New DevExpress.Utils.PointFloat(409.041687!, 0.0!)
        Me.xrLabel4.Name = "xrLabel4"
        Me.xrLabel4.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 7, 0, 100.0!)
        Me.xrLabel4.SizeF = New System.Drawing.SizeF(254.750107!, 25.9999809!)
        Me.xrLabel4.StyleName = "DataField"
        Me.xrLabel4.StylePriority.UsePadding = False
        Me.xrLabel4.Text = "xrLabel4"
        '
        'xrLabel5
        '
        Me.xrLabel5.Font = New System.Drawing.Font("Times New Roman", 14.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel5.LocationFloat = New DevExpress.Utils.PointFloat(506.958313!, 32.9999886!)
        Me.xrLabel5.Name = "xrLabel5"
        Me.xrLabel5.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel5.SizeF = New System.Drawing.SizeF(42.7434082!, 26.0000095!)
        Me.xrLabel5.StylePriority.UseFont = False
        Me.xrLabel5.Text = "Dia:"
        '
        'xrLabel6
        '
        Me.xrLabel6.Font = New System.Drawing.Font("Times New Roman", 14.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel6.LocationFloat = New DevExpress.Utils.PointFloat(5.99997902!, 32.9999886!)
        Me.xrLabel6.Name = "xrLabel6"
        Me.xrLabel6.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel6.SizeF = New System.Drawing.SizeF(59.0!, 26.0000095!)
        Me.xrLabel6.StylePriority.UseFont = False
        Me.xrLabel6.Text = "Filial:"
        '
        'xrLabel7
        '
        Me.xrLabel7.Font = New System.Drawing.Font("Arial", 10.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel7.ForeColor = System.Drawing.Color.Blue
        Me.xrLabel7.LocationFloat = New DevExpress.Utils.PointFloat(8.16952419!, 10.0000095!)
        Me.xrLabel7.Name = "xrLabel7"
        Me.xrLabel7.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel7.SizeF = New System.Drawing.SizeF(74.7887573!, 18.0!)
        Me.xrLabel7.StylePriority.UseFont = False
        Me.xrLabel7.StylePriority.UseForeColor = False
        Me.xrLabel7.Text = "Pergunta:"
        '
        'xrLabel9
        '
        Me.xrLabel9.Font = New System.Drawing.Font("Arial", 10.0!, System.Drawing.FontStyle.Italic)
        Me.xrLabel9.ForeColor = System.Drawing.Color.Red
        Me.xrLabel9.LocationFloat = New DevExpress.Utils.PointFloat(8.16958714!, 28.0000095!)
        Me.xrLabel9.Name = "xrLabel9"
        Me.xrLabel9.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel9.SizeF = New System.Drawing.SizeF(74.7887573!, 18.0!)
        Me.xrLabel9.StylePriority.UseFont = False
        Me.xrLabel9.StylePriority.UseForeColor = False
        Me.xrLabel9.Text = "Resposta:"
        '
        'xrLabel12
        '
        Me.xrLabel12.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.Dia", "{0:dd/MM/yyyy}")})
        Me.xrLabel12.Font = New System.Drawing.Font("Times New Roman", 14.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel12.LocationFloat = New DevExpress.Utils.PointFloat(549.701721!, 32.9999886!)
        Me.xrLabel12.Name = "xrLabel12"
        Me.xrLabel12.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel12.SizeF = New System.Drawing.SizeF(94.2983398!, 26.0000095!)
        Me.xrLabel12.StylePriority.UseFont = False
        Me.xrLabel12.Text = "xrLabel12"
        '
        'xrLabel13
        '
        Me.xrLabel13.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.FilialLista")})
        Me.xrLabel13.Font = New System.Drawing.Font("Times New Roman", 14.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel13.LocationFloat = New DevExpress.Utils.PointFloat(64.9999619!, 32.9999886!)
        Me.xrLabel13.Name = "xrLabel13"
        Me.xrLabel13.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel13.SizeF = New System.Drawing.SizeF(237.009399!, 26.0!)
        Me.xrLabel13.StylePriority.UseFont = False
        Me.xrLabel13.Text = "xrLabel13"
        '
        'xrLabel14
        '
        Me.xrLabel14.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.descPergunta")})
        Me.xrLabel14.Font = New System.Drawing.Font("Arial", 10.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel14.ForeColor = System.Drawing.Color.Blue
        Me.xrLabel14.LocationFloat = New DevExpress.Utils.PointFloat(82.9582825!, 10.0000095!)
        Me.xrLabel14.Name = "xrLabel14"
        Me.xrLabel14.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel14.SizeF = New System.Drawing.SizeF(479.622101!, 18.0!)
        Me.xrLabel14.StylePriority.UseFont = False
        Me.xrLabel14.StylePriority.UseForeColor = False
        Me.xrLabel14.Text = "xrLabel14"
        '
        'xrLabel15
        '
        Me.xrLabel15.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.Hora", "{0:HH:mm}")})
        Me.xrLabel15.LocationFloat = New DevExpress.Utils.PointFloat(562.580322!, 10.0000095!)
        Me.xrLabel15.Name = "xrLabel15"
        Me.xrLabel15.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel15.SizeF = New System.Drawing.SizeF(65.9611816!, 18.0!)
        Me.xrLabel15.Text = "xrLabel15"
        '
        'xrLabel16
        '
        Me.xrLabel16.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.Descricao")})
        Me.xrLabel16.Font = New System.Drawing.Font("Arial", 10.0!, CType((System.Drawing.FontStyle.Bold Or System.Drawing.FontStyle.Italic), System.Drawing.FontStyle))
        Me.xrLabel16.ForeColor = System.Drawing.Color.Red
        Me.xrLabel16.LocationFloat = New DevExpress.Utils.PointFloat(82.9583511!, 28.0000095!)
        Me.xrLabel16.Name = "xrLabel16"
        Me.xrLabel16.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel16.SizeF = New System.Drawing.SizeF(545.58313!, 18.0!)
        Me.xrLabel16.StylePriority.UseFont = False
        Me.xrLabel16.StylePriority.UseForeColor = False
        Me.xrLabel16.Text = "xrLabel16"
        '
        'xrLabel18
        '
        Me.xrLabel18.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "vReport.imgTitle")})
        Me.xrLabel18.Font = New System.Drawing.Font("Arial", 10.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel18.ForeColor = System.Drawing.Color.Green
        Me.xrLabel18.LocationFloat = New DevExpress.Utils.PointFloat(5.99997902!, 53.8333588!)
        Me.xrLabel18.Name = "xrLabel18"
        Me.xrLabel18.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel18.SizeF = New System.Drawing.SizeF(638.000122!, 18.0!)
        Me.xrLabel18.StylePriority.UseFont = False
        Me.xrLabel18.StylePriority.UseForeColor = False
        Me.xrLabel18.Text = "xrLabel18"
        '
        'pageFooterBand1
        '
        Me.pageFooterBand1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.xrLine3, Me.xrPageInfo1, Me.xrPageInfo2})
        Me.pageFooterBand1.HeightF = 31.0!
        Me.pageFooterBand1.Name = "pageFooterBand1"
        '
        'xrLine3
        '
        Me.xrLine3.LocationFloat = New DevExpress.Utils.PointFloat(6.0!, 0.0!)
        Me.xrLine3.Name = "xrLine3"
        Me.xrLine3.SizeF = New System.Drawing.SizeF(638.0!, 2.0!)
        '
        'xrPageInfo1
        '
        Me.xrPageInfo1.LocationFloat = New DevExpress.Utils.PointFloat(6.0!, 8.0!)
        Me.xrPageInfo1.Name = "xrPageInfo1"
        Me.xrPageInfo1.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrPageInfo1.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.xrPageInfo1.SizeF = New System.Drawing.SizeF(313.0!, 23.0!)
        Me.xrPageInfo1.StyleName = "PageInfo"
        '
        'xrPageInfo2
        '
        Me.xrPageInfo2.Format = "Page {0} of {1}"
        Me.xrPageInfo2.LocationFloat = New DevExpress.Utils.PointFloat(331.0!, 8.0!)
        Me.xrPageInfo2.Name = "xrPageInfo2"
        Me.xrPageInfo2.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrPageInfo2.SizeF = New System.Drawing.SizeF(313.0!, 23.0!)
        Me.xrPageInfo2.StyleName = "PageInfo"
        Me.xrPageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'reportHeaderBand1
        '
        Me.reportHeaderBand1.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.xrLabel19, Me.xrLine5, Me.xrLabel6, Me.xrLabel13, Me.xrLabel5, Me.xrLabel12})
        Me.reportHeaderBand1.HeightF = 61.0!
        Me.reportHeaderBand1.Name = "reportHeaderBand1"
        '
        'xrLabel19
        '
        Me.xrLabel19.Font = New System.Drawing.Font("Tahoma", 16.0!, System.Drawing.FontStyle.Bold)
        Me.xrLabel19.LocationFloat = New DevExpress.Utils.PointFloat(5.99997902!, 0.0!)
        Me.xrLabel19.Name = "xrLabel19"
        Me.xrLabel19.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        Me.xrLabel19.SizeF = New System.Drawing.SizeF(638.0!, 26.3333397!)
        Me.xrLabel19.StyleName = "Title"
        Me.xrLabel19.StylePriority.UseFont = False
        Me.xrLabel19.Text = "Relatório Diário - Checklist"
        '
        'xrLine5
        '
        Me.xrLine5.LocationFloat = New DevExpress.Utils.PointFloat(6.0!, 59.0!)
        Me.xrLine5.Name = "xrLine5"
        Me.xrLine5.SizeF = New System.Drawing.SizeF(638.0!, 2.0!)
        '
        'Title
        '
        Me.Title.BackColor = System.Drawing.Color.Transparent
        Me.Title.BorderColor = System.Drawing.Color.Black
        Me.Title.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.Title.BorderWidth = 1
        Me.Title.Font = New System.Drawing.Font("Tahoma", 24.0!, System.Drawing.FontStyle.Bold)
        Me.Title.ForeColor = System.Drawing.Color.Teal
        Me.Title.Name = "Title"
        '
        'FieldCaption
        '
        Me.FieldCaption.BackColor = System.Drawing.Color.Transparent
        Me.FieldCaption.BorderColor = System.Drawing.Color.Black
        Me.FieldCaption.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.FieldCaption.BorderWidth = 1
        Me.FieldCaption.Font = New System.Drawing.Font("Arial", 10.0!, System.Drawing.FontStyle.Bold)
        Me.FieldCaption.ForeColor = System.Drawing.Color.Black
        Me.FieldCaption.Name = "FieldCaption"
        '
        'PageInfo
        '
        Me.PageInfo.BackColor = System.Drawing.Color.Transparent
        Me.PageInfo.BorderColor = System.Drawing.Color.Black
        Me.PageInfo.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.PageInfo.BorderWidth = 1
        Me.PageInfo.Font = New System.Drawing.Font("Arial", 9.0!)
        Me.PageInfo.ForeColor = System.Drawing.Color.Black
        Me.PageInfo.Name = "PageInfo"
        '
        'DataField
        '
        Me.DataField.BackColor = System.Drawing.Color.Transparent
        Me.DataField.BorderColor = System.Drawing.Color.Black
        Me.DataField.Borders = DevExpress.XtraPrinting.BorderSide.None
        Me.DataField.BorderWidth = 1
        Me.DataField.Font = New System.Drawing.Font("Arial", 10.0!)
        Me.DataField.ForeColor = System.Drawing.Color.Black
        Me.DataField.Name = "DataField"
        Me.DataField.Padding = New DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100.0!)
        '
        'topMarginBand1
        '
        Me.topMarginBand1.HeightF = 20.0!
        Me.topMarginBand1.Name = "topMarginBand1"
        '
        'bottomMarginBand1
        '
        Me.bottomMarginBand1.HeightF = 20.0!
        Me.bottomMarginBand1.Name = "bottomMarginBand1"
        '
        'xrPictureBox1
        '
        Me.xrPictureBox1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Image", Nothing, "vReport.imgData")})
        Me.xrPictureBox1.LocationFloat = New DevExpress.Utils.PointFloat(6.00001001!, 71.8333588!)
        Me.xrPictureBox1.Name = "xrPictureBox1"
        Me.xrPictureBox1.SizeF = New System.Drawing.SizeF(638.000122!, 27.6249809!)
        Me.xrPictureBox1.Sizing = DevExpress.XtraPrinting.ImageSizeMode.AutoSize
        '
        'vReportAdapter2
        '
        Me.vReportAdapter2.ClearBeforeFill = True
        '
        'reportCheckList2
        '
        Me.reportCheckList2.DataSetName = "ReportCheckList_F04"
        Me.reportCheckList2.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'reportCheckList3
        '
        Me.reportCheckList3.DataSetName = "ReportCheckList_F04"
        Me.reportCheckList3.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'reportCheckList4
        '
        Me.reportCheckList4.DataSetName = "ReportCheckList_F04"
        Me.reportCheckList4.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'reportCheckList5
        '
        Me.reportCheckList5.DataSetName = "ReportCheckList_F04"
        Me.reportCheckList5.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'XtraReport2
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail, Me.groupHeaderBand1, Me.pageFooterBand1, Me.reportHeaderBand1, Me.topMarginBand1, Me.bottomMarginBand1})
        Me.DataAdapter = Me.vReportAdapter1
        Me.DataMember = "vReport_Loja4"
        Me.DataSource = Me.reportCheckList1
        Me.Margins = New System.Drawing.Printing.Margins(20, 20, 20, 20)
        Me.PageHeight = 1654
        Me.PageWidth = 1169
        Me.PaperKind = System.Drawing.Printing.PaperKind.A3
        Me.ScriptLanguage = DevExpress.XtraReports.ScriptLanguage.VisualBasic
        Me.StyleSheet.AddRange(New DevExpress.XtraReports.UI.XRControlStyle() {Me.Title, Me.FieldCaption, Me.PageInfo, Me.DataField})
        Me.Version = "12.2"
        CType(Me.reportCheckList1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.reportCheckList2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.reportCheckList3, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.reportCheckList4, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.reportCheckList5, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand

#End Region

End Class