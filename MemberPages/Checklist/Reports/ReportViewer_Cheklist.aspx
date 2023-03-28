<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ReportViewer_Cheklist.aspx.vb" Inherits="MemberPages_Checklist_Reports_ReportViewer_Cheklist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
        <br />
        <br />
    <div class="row col-12" runat="server" id="divMenu">
        <div class="col-1"></div>
        <div class="col-2">            
            <button type="button" class="btn btn-secondary btn-lg" onclick="createPDF();">Importar para PDF(Texto)</button>
        </div>
        <div class="col-6"></div>

        <div class="col-2">
            <button type="button" class="btn btn-secondary btn-lg justify-content-end" onclick="createPDF2();">Importar para PDF(Imagem)</button>
        </div>
        <div class="col-1"></div>
        <br />
    </div>

    <div class="container" style="max-width: 80%; font-size: 12pt" id="renderRel" runat="server">

    </div>

    <script>

        function createPDF2() {
            var quotes = document.getElementById('MainContent_renderRel');
            var d = new Date().toISOString().slice(0, 19).replace(/-/g, "");
            filename = 'report_' + d + '.pdf';
            html2canvas(quotes, {
                onrendered: function (canvas) {
                    //! MAKE YOUR PDF
                    var pdf = new jsPDF('l', 'pt', 'a4');

                    for (var i = 0; i <= quotes.clientHeight / 885; i++) {
                        //! This is all just html2canvas stuff
                        var srcImg = canvas;
                        var sX = 0;
                        var sY = 885 * i; // start 980 pixels down for every new page
                        var sWidth = 1350;
                        var sHeight = 885;
                        var dX = 0;
                        var dY = 0;
                        var dWidth = 1350;
                        var dHeight = 885;

                        window.onePageCanvas = document.createElement("canvas");
                        onePageCanvas.setAttribute('width', 1350);
                        onePageCanvas.setAttribute('height', 885);
                        var ctx = onePageCanvas.getContext('2d');
                        // details on this usage of this function: 
                        // https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API/Tutorial/Using_images#Slicing
                        ctx.drawImage(srcImg, sX, sY, sWidth, sHeight, dX, dY, dWidth, dHeight);

                        // document.body.appendChild(canvas);
                        var canvasDataURL = onePageCanvas.toDataURL("image/png", 1.0);

                        var width = onePageCanvas.width;
                        var height = onePageCanvas.clientHeight;

                        //! If we're on anything other than the first page,
                        // add another page
                        if (i > 0) {
                            pdf.addPage(840, 590); //8.5" x 11" in pts (in*72)
                        }
                        //! now we declare that we're working on that page
                        pdf.setPage(i + 1);
                        //! now we add content to that page!
                        pdf.addImage(canvasDataURL, 'PNG', 0, 0, (width * .62), (height * .62));

                    }
                    //! after the for loop is finished running, we save the pdf.
                    pdf.save(filename);
                }
            });
        }

        function createPDF() {
            var pdf = new jsPDF('p', 'pt', 'a4');
            var d = new Date().toISOString().slice(0, 19).replace(/-/g, "");
            filename = 'report_' + d + '.pdf';
            // source can be HTML-formatted string, or a reference
            // to an actual DOM element from which the text will be scraped.
            source = document.getElementById('MainContent_renderRel');

            // we support special element handlers. Register them with jQuery-style 
            // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
            // There is no support for any other type of selectors 
            // (class, of compound) at this time.
            specialElementHandlers = {
                // element with id of "bypass" - jQuery style selector
                '#bypassme': function (element, renderer) {
                    // true = "handled elsewhere, bypass text extraction"
                    return true
                }
            };
            margins = {
                top: 15,
                bottom: 15,
                left: 40,
                width: 542
            };
            // all coords and widths are in jsPDF instance's declared units
            // 'inches' in this case
            pdf.fromHTML(
                source, // HTML string or DOM elem ref.
                margins.left, // x coord
                margins.top, { // y coord
                'width': margins.width, // max width of content on PDF
                'elementHandlers': specialElementHandlers
            },

                function (dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save(filename);
                }, margins);
        }

    </script>

    <script src="../../assets/js/jquery-2.1.4.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../../assets/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/canvas2image@1.0.5/canvas2image.min.js"></script>
</asp:Content>


