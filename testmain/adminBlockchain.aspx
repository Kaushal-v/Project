<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminBlockchain.aspx.cs" Inherits="testmain.adminBlockchain" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  


<asp:Content runat="server" ContentPlaceHolderID="adminContent">
		<asp:Panel runat="server" CssClass="app-card app-card-stat shadow-lg" ID ="panelchangename">
									<div class="app-card-body p-2 p-lg-4">
										<br />									
										<div class="text-left" style="padding-top:4px;">
											<h3 class="stats-type mb-4 text-left"><asp:Label runat="server" ID="lblpanelcurname"></asp:Label></h3>
										</div>
										<div class="align-content-center">
											<div class="auth-form login-form">         												
												<div class="password mb-3">			
													<asp:TextBox AutoCompleteType="Disabled" ID="tbpanelchangename" runat="server" CssClass="form-control" placeholder="Name" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" Font-Size="Small" ForeColor="Red" ID="lblpanelchangenameconfirm">Enter correct details!!</asp:Label></div>
												</div>
											</div>
										</div>
										<div class="text-left" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangenamecancel" OnClick="btnpanelchangenamecancel_Click" CssClass="text-left" runat="server" Text="Cancel"></asp:LinkButton>
										</div>
										<div class="text-right" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangenameconfirm" OnClick="btnpanelchangenameconfirm_Click" CssClass="btn-sm app-btn-secondary" runat="server" Text="Confirm"></asp:LinkButton>
										</div>
										<br />
									</div>
								</asp:Panel>
			<cc1:ModalPopupExtender ID="popupchangename" runat="server" TargetControlID="btnchangename" PopupControlID="panelchangename"></cc1:ModalPopupExtender>
	<asp:Panel runat="server" CssClass="app-card app-card-stat shadow-lg" ID ="panelchangeproofofd">
									<div class="app-card-body p-2 p-lg-4">
										<br />									
										<div class="text-left" style="padding-top:4px;">
											<h3 class="stats-type mb-4 text-left"><asp:Label runat="server" ID="lblpanelcurproofofd"></asp:Label></h3>
										</div>
										<div class="align-content-center">
											<div class="auth-form login-form">         												
												<div class="password mb-3">			
													<asp:TextBox AutoCompleteType="Disabled" ID="tbpanelchangeproofofd" runat="server" CssClass="form-control" placeholder="Proof of Difficulty" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" Font-Size="Small" ForeColor="Red" ID="lblpanelchangeproofofdconfirm">Enter correct details!!</asp:Label></div>
												</div>
											</div>
										</div>
										<div class="text-left" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangeproofofdcancel" OnClick="btnpanelchangeproofofdcancel_Click" CssClass="text-left" runat="server" Text="Cancel"></asp:LinkButton>
										</div>
										<div class="text-right" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangeproofofdconfirm" OnClick="btnpanelchangeproofofdconfirm_Click" CssClass="btn-sm app-btn-secondary" runat="server" Text="Confirm"></asp:LinkButton>
										</div>
										<br />
									</div>
								</asp:Panel>
			<cc1:ModalPopupExtender ID="popupchangeproofofd" runat="server" TargetControlID="btnchangeproofofd" PopupControlID="panelchangeproofofd"></cc1:ModalPopupExtender>
	<asp:Panel runat="server" CssClass="app-card app-card-stat shadow-lg" ID ="panelchangeminereward">
									<div class="app-card-body p-2 p-lg-4">
										<br />									
										<div class="text-left" style="padding-top:4px;">
											<h3 class="stats-type mb-4 text-left"><asp:Label runat="server" ID="lblpanelcurminereward"></asp:Label></h3>
										</div>
										<div class="align-content-center">
											<div class="auth-form login-form">         												
												<div class="password mb-3">			
													<asp:TextBox AutoCompleteType="Disabled" ID="tbpanelchangeminereward" runat="server" CssClass="form-control" placeholder="Mining Reward" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" Font-Size="Small" ForeColor="Red" ID="lblpanelchangeminerewardconfirm">Enter correct details!!</asp:Label></div>
												</div>
											</div>
										</div>
										<div class="text-left" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangeminerewardcancel" OnClick="btnpanelchangeminerewardcancel_Click" CssClass="text-left" runat="server" Text="Cancel"></asp:LinkButton>
										</div>
										<div class="text-right" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanelchangeminerewardconfrim" OnClick="btnpanelchangeminerewardconfrim_Click" CssClass="btn-sm app-btn-secondary" runat="server" Text="Confirm"></asp:LinkButton>
										</div>
										<br />
									</div>
								</asp:Panel>
			<cc1:ModalPopupExtender ID="popupchangeminereward" runat="server" TargetControlID="btnchangeminereward" PopupControlID="panelchangeminereward"></cc1:ModalPopupExtender>
    <div class="app-wrapper pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Blockchain</h1>
                <div class="row gy-4">
	                <div class="col-12 ">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
									 <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-columns-gap" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M6 1H1v3h5V1zM1 0a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H1zm14 12h-5v3h5v-3zm-5-1a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1h-5zM6 8H1v7h5V8zM1 7a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H1zm14-6h-5v7h5V1zm-5-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h5a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1h-5z"></path>
	</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Blockchain Details</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						     <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Name</strong></div>
											 <div class="item-data text-left"><asp:Label runat="server" ID="lblname"></asp:Label></div>
									    </div><!--//col-->
										 <div class="col text-right">
										    <asp:LinkButton ID="btnchangename" runat="server" class="btn-sm app-btn-secondary">Change</asp:LinkButton>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
								<div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Proof of Difficulty</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lblproofofd"></asp:Label></div>
									    </div><!--//col-->
										 <div class="col text-right">
										     <asp:LinkButton ID="btnchangeproofofd" runat="server" class="btn-sm app-btn-secondary">Change</asp:LinkButton>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
								<div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Mining Reward</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lblminereward"></asp:Label></div>
									    </div><!--//col-->
										 <div class="col text-right">
										     <asp:LinkButton ID="btnchangeminereward" runat="server" class="btn-sm app-btn-secondary">Change</asp:LinkButton>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Blocks Mined</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lblblockmined"></asp:Label></div>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->	
								 <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Blockchain Created Time</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lbltime"></asp:Label></div>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->	
						    </div><!--//app-card-body-->						   					   										   
						</div><!--//app-card-->
	                </div><!--//col-->	            
                </div><!--//row-->
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
</asp:Content>