<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="users.aspx.cs" Inherits="testmain.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  


<asp:Content runat="server" ContentPlaceHolderID="adminContent">
	<asp:Panel ID="paneladduser" runat="server" CssClass="app-card app-card-stat shadow-lg" style="width:350px;">
			<div class="app-card-body p-2 p-lg-4">
										<div class="align-content-end" style="float:left;width:100%;padding-top:4px;">
											<h3 class="stats-type mb-4 text-right"><label>Add User</label></h3>
										</div>
										<div class="align-content-center">
											<div class="auth-form login-form">         
												<div class="email mb-3">
													<asp:TextBox ID="tbfname" runat="server" CssClass="form-control" placeholder="First Name" required="required" ></asp:TextBox>
												</div><!--//form-group-->
												<div class="email mb-3">
													<asp:TextBox ID="tblname" runat="server" CssClass="form-control" placeholder="Last Name" required="required" ></asp:TextBox>
												</div>
												<div class="email mb-3">
													<asp:TextBox ID="tbuname" runat="server" CssClass="form-control" OnTextChanged="tbuname_TextChanged" placeholder="User Name" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblunamenot">Username is not available!!</asp:Label></div>
												</div>
												<div class="email mb-3">
													<asp:TextBox runat="server" ID="tbmail" TextMode="Email" CssClass="form-control" OnTextChanged="tbmail_TextChanged" placeholder="Email"></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblmail">Enter valid mail address!!</asp:Label></div>
												</div>
												<div class="password mb-3">			
													<asp:TextBox ID="tbconno" runat="server" OnTextChanged="tbconno_TextChanged" TextMode="Number" MaxLength="10" CssClass="form-control" placeholder="Contact No" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblphone">Enter valid contact number!!</asp:Label></div>
												</div>
												<div class="email mb-3">
													<asp:DropDownList runat="server" ID="ddlusertype" AutoPostBack="true" CssClass="form-control" OnSelectedIndexChanged="ddlusertype_SelectedIndexChanged">
														<asp:ListItem Value="Select">User Type</asp:ListItem>
														<asp:ListItem Value="sub">Subscriber</asp:ListItem>
														<asp:ListItem Value="miner">Miner</asp:ListItem>
														<asp:ListItem Value="admin">Admin</asp:ListItem>
													</asp:DropDownList>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblselectvalid">Please chose user type!!</asp:Label></div>
												</div>
												<div class="email mb-3">
													<asp:TextBox ID="tbpass" runat="server" OnTextChanged="tbpass_TextChanged" CssClass="form-control" placeholder="Password" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblpassnotcorrect">Please chose password more than 8 characters!!</asp:Label></div>
												</div>												
											</div>																						
										</div>
										<div class="text-left" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelcancel" OnClick="btnpanelcancel_Click" CssClass="text-left" runat="server" Text="Cancel"></asp:LinkButton>
										</div>
										<div class="text-right" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelconfirm" OnClick="btnpanelconfirm_Click" CssClass="btn-sm app-btn-secondary" runat="server" Text="Add"></asp:LinkButton>
										</div>
										<br />
									</div>
		</asp:Panel>
		<cc1:ModalPopupExtender ID="popupadduser" runat="server" TargetControlID="btnadduser" PopupControlID="paneladduser"></cc1:ModalPopupExtender>
     <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">    
				 <h1 class="app-page-title">Users</h1>
			    <div class="row g-4 mb-4">
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Guests</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lblguests"></asp:Label></div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->				    
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Subscribers</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lblsubs"></asp:Label></div>
						    </div><!--//app-card-body-->
							<a class="app-card-link-mask" href="adminUsers.aspx?type=sub"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Miners</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lblminers"></asp:Label></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="adminUsers.aspx?type=miner"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Admins</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lbladmins"></asp:Label></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="adminUsers.aspx?type=admin"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->		
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
							<div class="text-left" style="float:left; padding:30px 30px 0px 30px; width:50%;">
								<div class="text-left" style="float:left;width:50%;"><asp:TextBox AutoPostBack="true" OnTextChanged="tbusersearch_TextChanged" placeholder="Search User" runat="server" CssClass="text-left form-control w-50 btn-sm app-btn-secondary" ID="tbusersearch" TextMode="Search"></asp:TextBox></div>								
								<div class="text-left" style="float:left; width:50%;"><asp:LinkButton ID="btnsearchuser" OnClick="btnsearchuser_Click" CssClass="btn-sm text-right app-btn-secondary" runat="server" Text="Search"></asp:LinkButton></div>
							</div>
							<div class="text-right" style="float:left; padding:30px 30px 0px 30px; width:50%;"><h3><asp:LinkButton ID="btnadduser" CssClass="btn-lg app-btn-secondary" runat="server" Text="Add User"></asp:LinkButton></h3></div>
							<div class="text-left"  style="padding:30px 30px 0px 30px;"><asp:Label runat="server" Visible="false" ForeColor="Red" Font-Size="Small" ID="lblnouserfound">No user found!!</asp:Label></div>
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										
									</div>
								</div>
							</div>
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
</asp:Content>
