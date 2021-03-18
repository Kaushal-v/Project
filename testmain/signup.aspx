<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="signup.aspx.cs" Inherits="testmain.signup" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div class="row g-0 app-auth-wrapper" style="height:auto;">
	    <div class="col-12 auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="home.aspx"><img class="logo-icon mr-2" src="blockchain.png" alt="logo"></a></div>
					<h2 class="auth-heading text-center mb-4">Sign up to ShareLog</h2>					
	
					<div class="auth-form-container text-left mx-auto">
						<div class="auth-form auth-signup-form">         
							<div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="f_namet" CssClass="form-control" placeholder="First name" required="required"></asp:TextBox>
							</div>
							<div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="l_namet" CssClass="form-control" placeholder="Last name" required="required"></asp:TextBox>
							</div>
							<div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="u_namet" CssClass="form-control" OnTextChanged="u_namet_TextChanged" placeholder="User name" required="required"></asp:TextBox>
								<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblunamenot">Username is not available!!</asp:Label></div>
							</div>
                            <div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="mailt" TextMode="Email" CssClass="form-control" placeholder="Email"></asp:TextBox>
							</div>
                            <div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="con_not" OnTextChanged="con_not_TextChanged" TextMode="Number" MaxLength="10" CssClass="form-control" placeholder="Contact No" required="required"></asp:TextBox>
								<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblphone">Enter valid contact number!!</asp:Label></div>

							</div>
                            <div class="email mb-3">
								<asp:TextBox AutoCompleteType="Disabled" runat="server" ID="passt" TextMode="Password" CssClass="form-control" OnTextChanged="passt_TextChanged" placeholder="Password" required="required"></asp:TextBox>
								<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblpassnotcorrect">Please chose password more than 8 characters!!</asp:Label></div>
							</div>
							 <div class="email mb-3">
                                <Lable style="margin-left:12px;">As Miner:</Lable>
                                <asp:CheckBox ID="cbminer" runat="server"></asp:CheckBox>
                            </div>
							<div class="text-center">
								<asp:Button runat="server" ID="Signup" OnClick="Signup_Click" CssClass="btn app-btn-primary btn-block theme-btn mx-auto" Text="Sign Up"></asp:Button>
							</div>
						</div><!--//auth-form-->
						
						<div class="auth-option text-center pt-5">Already have an account? <a class="text-link" href="signin.aspx" >Log in</a></div>
					</div><!--//auth-form-container-->	
			    </div><!--//auth-body-->
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
    
    </div><!--//row-->
</asp:Content>