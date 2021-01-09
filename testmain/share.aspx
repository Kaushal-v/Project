<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="share.aspx.cs" Inherits="testmain.share" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Shares</h1>
				<div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
							<div class="text-right" style="padding:30px 30px 0px 30px;"><h3><asp:LinkButton ID="btnaddshare" OnClick="btnaddshare_Click" CssClass="btn-lg app-btn-secondary" runat="server" Text="Add Share"></asp:LinkButton></h3></div>
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										<div class="col-12">
											<div class="app-card app-card-stats-table h-100 shadow-sm">
												<div class="app-card-header p-3 border-bottom-0">
															<div class="row align-items-center gx-3">
																<div class="col-auto">
																	<h4 class="app-card-title" style="font-size:25px;"><asp:Label Visible="false" runat="server" ID="lblsharedetails">Share Details</asp:Label></h4>
																</div><!--//col-->
															</div><!--//row-->
														</div><!--//app-card-header-->
												<div class="app-card-header p-3">
													<div class="row justify-content-between align-items-center">
													   <asp:GridView ID="gvsharedetails" BorderStyle="None" runat="server" Width="100%" OnRowDeleting="gvsharedetails_RowDeleting" AutoGenerateColumns="False" DataKeyNames="share_id" EmptyDataText="No records has been added.">
															<Columns>
																<asp:BoundField DataField="share_id" HeaderText="#"/>
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
																		<asp:LinkButton ID="btnadd" OnClick="btnadd_Click" runat="server" Text="Add"></asp:LinkButton>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:BoundField DataField="share_sold_count" HeaderText="Sold"/>                                   																								
																<asp:TemplateField HeaderText="Chart">
																   <ItemTemplate>

																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Edit">
																   <ItemTemplate>
																		<asp:LinkButton ID="btndelete" runat="server" Text="Delete"></asp:LinkButton>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
														</asp:GridView>
														 <div class="auth-form-container text-left">
															<div class="auth-form login-form col-4"> 
																		<div class="row justify-content-between align-items-center">
																				<div class="email mb-3 w-100">
																					<asp:TextBox ID="tbsname" runat="server" CssClass="form-control" placeholder="Share Name" Visible="false" required="required"></asp:TextBox>
																				</div>
																		</div>
																		<div class="row justify-content-between align-items-center">
																				<div class="email mb-3">
																					<asp:TextBox ID="tbsprice" runat="server" CssClass="form-control" placeholder="Price" Visible="false" required="required"></asp:TextBox>
																				</div>
																		</div>
																		<div class="row justify-content-between align-items-center">
																				<div class="email mb-3 text-left">
																					<asp:TextBox ID="tbsavailc" runat="server" CssClass="form-control" placeholder="Count" Visible="false" required="required"></asp:TextBox>
																				</div>
																				<asp:Label runat="server" ID="lblincorrect" Visible="false" ForeColor="Red" CssClass="text-left" Text="incorrect share details!!"></asp:Label>
																		</div>
																	<div class="app-card-footer p-4">
																		<div class="email mb-3" style="float:left; padding-right:10px;"><asp:LinkButton ID="btnsaveshare" Visible="false" CssClass="btn-lg app-btn-secondary" OnClick="btnsaveshare_Click" runat="server" Text="Save"></asp:LinkButton></div>
																	   <div class="email mb-3" style="float:left;"><asp:LinkButton ID="btncancel" Visible="false" href="share.aspx" CssClass="btn-lg app-btn-secondary" runat="server" Text="Cancel"></asp:LinkButton></div>
																	</div>	
																</div>
															</div>
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
