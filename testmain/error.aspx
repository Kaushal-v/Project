<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="error.aspx.cs" Inherits="testmain.error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 Not Found</title>
    <link rel="shortcut icon" href="favicon.ico"/> 
    
    <!-- FontAwesome JS-->
    <script src="assets/plugins/fontawesome/js/all.min.js"></script>
    <link rel="stylesheet" href="1Style.css"/>
    
    <!-- App CSS -->  
</head>
<body class="app app-404-page">
    <form id="form1" runat="server">
       <div >   	
   
    <div class="container mb-5">
	    <div class="row">
		    <div class="col-12 col-md-11 col-lg-7 col-xl-6 mx-auto">
			    <div class="app-branding text-center mb-5">
		            <a class="app-logo" href="home.aspx"><img class="logo-icon mr-2" src="blockchain.png" alt="logo"/><span class="logo-text">ShareLog</span></a>
	
		        </div><!--//app-branding-->  
			    <div class="app-card p-5 text-center shadow-sm">
				    <h1 class="page-title mb-4">404<br/><span class="font-weight-light">Page Not Found</span></h1>
				    <div class="mb-4">
					    Sorry, we can't find the page you're looking for. 
				    </div>
				    <a class="btn app-btn-primary" href="home.aspx">Go to home page</a>
			    </div>
		    </div><!--//col-->
	    </div><!--//row-->
    </div><!--//container-->
   
     <footer class="content page-footer font-small carousel-dark">

  <div >
    <div class="container">

      <!-- Grid row-->
      <div class="row py-4 d-flex align-items-center">

        <!-- Grid column -->
        <div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
          <h6 class="mb-0">Get connected with us on social networks!</h6>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-6 col-lg-7 text-center text-md-right">

          <!-- Facebook -->
          <a class="fb-ic">
            <asp:HyperLink runat="server" Target="_blank" NavigateUrl="https://www.facebook.com/"><i class="fab fa-facebook-f white-text mr-4"></i></asp:HyperLink>
          </a>
          <!-- Twitter -->
          <a class="tw-ic">
            <asp:HyperLink runat="server" Target="_blank" NavigateUrl="https://www.twitter.com/"><i class="fab fa-twitter white-text mr-4"> </i></asp:HyperLink>
          </a>
          <!-- Google +-->
          <a class="gplus-ic">
            <asp:HyperLink runat="server" Target="_blank" NavigateUrl="https://www.googleplus.com/"><i class="fab fa-google-plus-g white-text mr-4"> </i></asp:HyperLink>
          </a>
          <!--Linkedin -->
          <a class="li-ic">
            <asp:HyperLink runat="server" Target="_blank" NavigateUrl="https://www.linkedin.com/"><i class="fab fa-linkedin-in white-text mr-4"> </i></asp:HyperLink>
          </a>
          <!--Instagram-->
          <a class="ins-ic">
           <asp:HyperLink runat="server" Target="_blank" NavigateUrl="https://www.instagram.com/"> <i class="fab fa-instagram white-text"> </i></asp:HyperLink>
          </a>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row-->

    </div>
  </div>

  <!-- Footer Links -->
  <div class="container text-center text-md-left mt-5">

    <!-- Grid row -->
    <div class="row mt-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4" style="width:50%; text-align:justify">

        <!-- Content -->
        <h6 class="text-uppercase font-weight-bold">About us</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>It is an Online Share Market. From where users can buy and sell shares online. Blockchain is used for each transaction made by selling or buying any share. So, any user connected to the Blockchain can see the whole ledger of the transactions.</p>
		  <br />
          <h5>Guide : Prof. Akash N Siddhpura </h5>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Members</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <a href="#!">Kaushal Vaghasiya (186620307059)</a>
        </p>
        <p>
          <a href="#!">Smit Meghapara (186620307036)</a>
        </p>        

      </div>
      <!-- Grid column -->
     

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

        <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i>At Hadala, Rajkot - Morbi Hwy, Gujarat</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> kaushalvaghasiya111@gmail.com, meghaparasmit@gmail.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> +91 XXXXX XXXXX</p>        

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© Copyright:
    <a href="home.aspx"> ShareLog <asp:Label runat="server" ID="lblcuryear"></asp:Label></a>
  </div>
  <!-- Copyright -->

</footer>

    <!-- Javascript -->          
    <script src="assets/plugins/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>           
    
    <!-- Charts JS -->
    <script src="assets/plugins/chart.js/chart.min.js"></script> 
    <script src="assets/js/charts-custom.js"></script> 
    
    <!-- Page Specific JS -->
    <script src="assets/js/app.js"></script> 

</div>
    </form>
</body>
</html>
