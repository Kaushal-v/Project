<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="share.aspx.cs" Inherits="testmain.share" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>  

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
	<asp:LinkButton ID="btnad" runat="server"></asp:LinkButton>
	<asp:Panel ID="paneladdshare" runat="server" CssClass="app-card app-card-stat shadow-lg w-auto">
			<div class="app-card-body p-2 p-lg-4">
										<br />										
										<div class="align-content-end" style="float:left;width:100%;padding-top:4px;">
											<h3 class="stats-type mb-4 text-right"><asp:Label runat="server" ID="lblpanelsharename"></asp:Label></h3>
										</div>
										<div class="align-content-center">
											<div class="auth-form login-form">         												
												<div class="password mb-3">		
													<div class="text-left"><label>Insert amount of shares:</label></div>
													<asp:TextBox ID="tbpanelcount" runat="server" TextMode="Number" min="1" max="100" CssClass="form-control" placeholder="Count" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" ForeColor="Red" ID="lblconfirm">Enter correct count!!</asp:Label></div>
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
	<asp:Panel ID="paneladdwholeshare" runat="server" CssClass="app-card app-card-stat shadow-lg">
			<div class="app-card-body p-2 p-lg-4">
										<br />									
										<div class="align-content-center">
											<div class="auth-form login-form">         
												<div class="email mb-3">
													<asp:TextBox ID="tbshare_name" runat="server" CssClass="form-control" placeholder="Name" required="required" ></asp:TextBox>
												</div><!--//form-group-->
												<div class="email mb-3">
													<asp:TextBox ID="tbshare_price" runat="server" TextMode="Number" min="0" CssClass="form-control" placeholder="Price" required="required" ></asp:TextBox>
												</div>
												<div class="password mb-3">			
													<asp:TextBox ID="tbshare_availc" runat="server" TextMode="Number" MaxLength="2" min="0" CssClass="form-control" placeholder="Count" required="required" ></asp:TextBox>
													<div class="text-right"><asp:Label runat="server" Visible="false" Font-Size="Small" ForeColor="Red" ID="lblpanel2confirm">Enter correct details!!</asp:Label></div>
												</div>
											</div>
										</div>
										<div class="text-left" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanel2cancel" OnClick="btnpanel2cancel_Click" CssClass="text-left" runat="server" Text="Cancel"></asp:LinkButton>
										</div>
										<div class="text-right" style="width:50%;float:left;padding:10px;">
											<asp:LinkButton ID="btnpanel2confirm" OnClick="btnpanel2confirm_Click" CssClass="btn-sm app-btn-secondary" runat="server" Text="Save"></asp:LinkButton>
										</div>
										<br />
									</div>
		</asp:Panel>
		<cc1:ModalPopupExtender ID="popupaddwholeshare" runat="server" TargetControlID="btnaddshare" PopupControlID="paneladdwholeshare"></cc1:ModalPopupExtender>
		<cc1:ModalPopupExtender ID="popupaddshare" runat="server" TargetControlID="btnad" PopupControlID="paneladdshare"></cc1:ModalPopupExtender>
    <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Shares</h1>
				<div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
							<div class="text-right" style="padding:30px 30px 0px 30px;">
								<div class="row align-items-center gx-3" style="width:50%; float:left;">
									 <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"></path>
  <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"></path>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Share Details</h4>
							        </div><!--//col-->
						        </div><!--//row--><!--//col--><div><h3><asp:LinkButton ID="btnaddshare" CssClass="btn-lg app-btn-secondary" runat="server" Text="Add Share"></asp:LinkButton></h3></div></div>
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										<div class="col-12">
											<div class="app-card app-card-stats-table h-100 shadow-sm">
												<div class="app-card-header p-3 border-bottom-0">
															<div class="row align-items-center gx-3">
																
															</div><!--//row-->
														</div><!--//app-card-header-->
												<div class="app-card-header p-3">
													<div class="row justify-content-between align-items-center">
													   <asp:GridView ID="gvsharedetails" CssClass="table app-table-hover mb-0 text-left" BorderStyle="None" runat="server" Width="100%" OnRowCommand="gvsharedetails_RowCommand" OnRowDeleting="gvsharedetails_RowDeleting" AutoGenerateColumns="False" DataKeyNames="share_id" EmptyDataText="No records has been added.">
															<Columns>
																<asp:BoundField DataField="share_name" HeaderText="Share Name"/>
																<asp:BoundField DataField="share_price" HeaderText="Price"/>                                   																								
																<asp:TemplateField HeaderText="Change">
																	<ItemTemplate>
																		<asp:Label ID="lblchange" runat="server" Text="0"></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Available Count">
																	<ItemTemplate>
																		<asp:Label ID="lblavailc" runat="server" Text='<%# Bind("share_available_count") %>'></asp:Label>
																		<asp:LinkButton ID="btnadd" CommandName="addshare" CommandArgument='<%# Bind("share_id") %>' runat="server" Text="Add"></asp:LinkButton>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:BoundField DataField="share_sold_count" HeaderText="Sold"/>                                   																								
																<asp:TemplateField HeaderText="Chart">
																   <ItemTemplate>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Edit">
																   <ItemTemplate>
																		<asp:LinkButton CommandName="deleteshare" CommandArgument='<%# Bind("share_id") %>' ID="btndelete" runat="server" Text="Delete"></asp:LinkButton>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
														</asp:GridView>														
														</div>
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>
