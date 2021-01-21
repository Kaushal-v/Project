<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminAdminProfile.aspx.cs" MasterPageFile="~/admin.Master" Inherits="testmain.adminAdminProfile" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
     <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title"><asp:Label runat="server" ID="lblmain"></asp:Label></h1>
                <div class="row gy-4">
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Profile</h4>
							        </div><!--//col-->
									<div class="col-auto text-right">
										    <asp:LinkButton runat="server" ID="btnedit" OnClick="btnedit_Click" CssClass="btn-sm app-btn-secondary">Edit</asp:LinkButton>
									    </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>First Name</strong></div>
											 <div class="item-data text-left"><asp:Label runat="server" ID="lblfname"></asp:Label></div>
									        <asp:TextBox Visible="false" ID="tbfname" runat="server" CssClass="item-data tb"></asp:TextBox>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
								<div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Last Name</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lbllname"></asp:Label></div>
									        <asp:TextBox Visible="false" ID="tblname" runat="server" CssClass="item-data tb"></asp:TextBox>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
								<div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>User Name</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lbluname"></asp:Label></div>
									        <asp:TextBox Visible="false" ID="tbuname" runat="server" CssClass="item-data tb"></asp:TextBox>
									    </div><!--//col-->
										<div class="col text-right">
										    <asp:Label runat="server" ID="lblunamenotavail" CssClass="btn-sm" ForeColor="#ff3300" Visible="false">username is not availble</asp:Label>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Email Address</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lblmail"></asp:Label></div>
									        <asp:TextBox Visible="false" ID="tbmail" runat="server" CssClass="item-data tb"></asp:TextBox>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
								<div class="item py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong><asp:Label runat="server" ID="lblasminer">As Miner</asp:Label></strong>
												<asp:CheckBox ID="cbminer" runat="server" CssClass="item-data"></asp:CheckBox>
											</div>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
						    </div><!--//app-card-body-->
						    <div class="app-card-footer p-4 mt-auto">
							   <asp:LinkButton runat="server" ID="btnsave" OnClick="btnsave_Click" CssClass="btn app-btn-secondary" Visible="false">Save Profile</asp:LinkButton>
								<asp:LinkButton runat="server" ID="btncancel" OnClick="btncancel_Click" CssClass="btn app-btn-secondary" Visible="false">Cancel</asp:LinkButton>
						    </div><!--//app-card-footer-->
						   
						</div><!--//app-card-->
	                </div><!--//col-->					
				</div>
			</div>
		</div>
	</div>
</asp:Content>
