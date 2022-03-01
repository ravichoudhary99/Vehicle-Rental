<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="signupselect.aspx.vb" Inherits="Vehicle_Rental.signupselect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/styleforselect.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Cabin:400,500,600,bold" rel="stylesheet" type="text/css" />
    <link  href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow:regular,bold" rel="stylesheet" type="text/css" />
</head>
<body class="bodyd">


<div id="pagegradient"><div class="logo">
        <a href="home.aspx"><img src="Images/logo1.png"  /></a>
    </div></div>

    <a class="button">
        <span onclick="window.location.href ='registercust.aspx';">Drive Car</span>
    </a>

    <a class="button1">
        <span onclick="window.location.href ='registervendor.aspx';">Car Agent</span>
    </a>

  

<!-- 
  <button class=" btn-car need-car" onclick="window.location.href = 'https://www.google.com';">Drive Car
  </button>
   <button class="btn-car need-car-asso">Car Agent
  </button> -->
</body>
</html>
