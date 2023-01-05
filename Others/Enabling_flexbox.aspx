<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Enabling_flexbox.aspx.vb" Inherits="Others_Enabling_flexbox" %>

<!DOCTYPE html>
<html  lang="pt-br">

<head runat="server">

    <style type="text/css">

        html {
            height: 100%;
					font-size: 62.5%; /* 10px with default settings */
        }

        body {
            margin: 0;
					height: 100%;
					width: 100%; /* width needed for Firefox */

					/* old flexbox - Webkit and Firefox. For backwards compatibility */
					display: -webkit-box; display: -moz-box;
					/* middle-aged flexbox. Needed for IE 10 */
					display: -ms-flexbox;
					/* new flexbox. Chrome (prefix), Opera, upcoming browsers without */
					display: -webkit-flex;
					display: flex;
					
					/* old flexbox: box-* */
					-webkit-box-align: center; -moz-box-align: center;
					/* middle flexbox: flex-* */
					-ms-flex-align: center;
					/* new flexbox: various property names */
					-webkit-align-items: center;
					align-items: center;
					
					
					-webkit-box-pack: center; -moz-box-pack: center;
					-ms-flex-pack: center;
					-webkit-justify-content: center;
					justify-content: center;
					
					background: white url("../image/2.jpg") no-repeat center;
					background-size: auto 100%;
                       

        }

        h1 {
           display: -webkit-box; display: -moz-box;
					display: -ms-flexbox;
					display: -webkit-flex;
					display: flex;
					
					-webkit-box-align: center; -moz-box-align: center;
					-ms-flex-align: center;
					-webkit-justify-content: center;
					justify-content: center;
					
					-webkit-box-pack: center; -moz-box-pack: center;
					-ms-flex-pack: center;
					-webkit-align-items: center;
					align-items: center;
					
					height: 10rem;
					padding: 0 3rem;
					
					background-color: hsla(0, 100%, 0%, .9);
					color: white;

					font-family: helvetica, sans-serif;
					font-size: 5rem; /* font shorthand doesn’t work with rem in IE10 */
					text-transform: uppercase;
					text-shadow: 0 0 1.2rem hsla(0, 100%, 100%, .4);

					box-shadow: 0 0 1.5rem hsla(0, 100%, 0%, .4);
					border-radius: .5rem;
        }


    </style>


    <meta charset="utf-8" />
    <title>Centering an Element on the Page</title>
</head>

<body>
    <form id="form1" runat="server">
    <h1>OMG, I'm centered</h1>
    </form>
</body>
</html>
