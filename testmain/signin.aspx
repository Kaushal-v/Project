<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="signin.aspx.cs" Inherits="testmain.signin" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div class="row g-0 app-auth-wrapper contener" style="height:auto;">
	    <div class="col-12 auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-center">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="home.aspx"><img class="logo-icon mr-2" src="assets/images/app-logo.svg" alt="logo"></a></div>
					<h2 class="auth-heading text-center mb-5">Log in to ShareLog</h2>
			        <div class="auth-form-container text-left">
						<div class="auth-form login-form">         
							<div class="email mb-3">
								<label class="sr-only" for="signin-email">Email</label>
								<asp:TextBox ID="u_namet" runat="server" CssClass="form-control signin-email" placeholder="User Name" required="required"></asp:TextBox>
							</div><!--//form-group-->
							<div class="password mb-3">
								<label class="sr-only" for="signin-password">Password</label>
								<asp:TextBox ID="passt" runat="server" TextMode="password" CssClass="form-control signin-password" placeholder="Password" required="required" OnTextChanged="passt_TextChanged"></asp:TextBox>
								<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" ID="lblconfirm">Username or Password is incorrect!!</asp:Label></div>
								<div class="extra mt-3 row justify-content-between">
									<div class="col-6">
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="RememberPassword" style="display:none;">
											<label class="form-check-label" for="RememberPassword" style="display:none;">
											Remember me
											</label>
										</div>
									</div><!--//col-6-->
									<div class="col-6">
										<div class="forgot-password text-right">
											<a  style="display:none;" href="reset-password.html">Forgot password?</a>
										</div>
									</div><!--//col-6-->
								</div><!--//extra-->
							</div><!--//form-group-->
							<div class="text-center">
								<asp:Button runat="server" ID="Signin" OnClick="Signin_Click" CssClass="btn app-btn-primary btn-block theme-btn mx-auto" Text="Log In"></asp:Button>
							</div>
						</div>
						
						<div class="auth-option text-center pt-5">No Account? Sign up <a class="text-link" href="signup.aspx" >here</a>.</div>
					</div><!--//auth-form-container-->	

			    </div><!--//auth-body-->	
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
    </div><!--//row-->
</asp:Content>
