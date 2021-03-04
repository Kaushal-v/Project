<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminTransactions.aspx.cs" Inherits="testmain.transacrions" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
	 <div class="app-wrapper pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">			    
			    <div class="row g-3 mb-4 align-items-center justify-content-between">
				    <div class="col-auto">
			            <h1 class="app-page-title mb-0">Transcations</h1>
				    </div>
				    <div class="col-auto">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">							    
							    <div class="col-auto">
								    
								    <select class="form-select w-auto" >
										  <option selected value="option-1">All</option>
										  <option value="option-2">This week</option>
										  <option value="option-3">This month</option>
										  <option value="option-4">Last 3 months</option>
										  
									</select>
							    </div>
							    <div class="col-auto">						    
								    <asp:LinkButton runat="server" CssClass="btn app-btn-secondary" OnClick="btndownload_pdf_Click">
									    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-download mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
		  <path fill-rule="evenodd" d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
		  <path fill-rule="evenodd" d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
		</svg>
									    Download PDF
									</asp:LinkButton>
							    </div>
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			   
			    			    <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				    <asp:LinkButton runat="server" OnClick="orders_all_tab_Click" class="flex-sm-fill text-sm-center nav-link active" id="orders_all_tab">All</asp:LinkButton>
				    <asp:LinkButton runat="server" OnClick="orders_verified_tab_Click" class="flex-sm-fill text-sm-center nav-link"  id="orders_verified_tab">Verified</asp:LinkButton>
				    <asp:LinkButton runat="server" OnClick="orders_pending_tab_Click" class="flex-sm-fill text-sm-center nav-link" id="orders_pending_tab">Pending</asp:LinkButton>
				</nav>
				<div class="tab-content" id="orders-table-tab-content">
			        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders_all_tab">
					    <div class="app-card app-card-orders-table shadow-sm mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
									<asp:GridView ID="gvtransactiondetails" CssClass="table app-table-hover mb-0 text-left" OnRowDataBound="gvtransactiondetails_RowDataBound" BorderStyle="None" runat="server" OnPageIndexChanging="gvtransactiondetails_PageIndexChanging" Width="100%" AutoGenerateColumns="False" DataKeyNames="block_hash" EmptyDataText="No records has been added." AllowPaging="True" PageSize="10" PagerStyle-HorizontalAlign="Center">
															<Columns>
																<asp:TemplateField HeaderText="Hash">
																	<ItemTemplate>
																		<asp:Label CssClass="cell" width="248" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("block_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Sender Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label1" runat="server" Text='<%#  Bind("transaction_sender_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Receiver Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label2" runat="server" Text='<%#  Bind("transaction_receiver_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>																
																<asp:TemplateField HeaderText="Previous Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label3" runat="server" Text='<%#  Bind("block_previous_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Time Stamp">
																	<ItemTemplate>
																		<asp:Label width="128" Style="word-wrap: normal; word-break: break-all;" ID="Label4" runat="server" Text='<%#  Bind("block_timestamp")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Status">
																	<ItemTemplate>
																		<asp:Label Style="word-wrap: normal; word-break: break-all;" ID="Label5" runat="server" Text='<%#  Bind("status")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Chips">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label5" Text='<%# Bind("transaction_chips")%>'> </asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>																
															</Columns>

<PagerStyle HorizontalAlign="Center"></PagerStyle>
														</asp:GridView>	
							       
						        </div><!--//table-responsive-->						       
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->						
			        </div><!--//tab-pane-->						
				</div><!--//tab-content-->								    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->  
</asp:Content>