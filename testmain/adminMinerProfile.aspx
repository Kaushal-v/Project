<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminMinerProfile.aspx.cs" MasterPageFile="~/admin.Master" Inherits="testmain.adminMinerProfile" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
     <div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title"><asp:Label runat="server" ID="lblmain"></asp:Label></h1>
                <div class="row mb-4 gy-4">
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
					<div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"></path>
  <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"></path>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Your Shares</h4>
							        </div><!--//col-->									
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
									    <div class="col-auto">
										    <asp:GridView ID="gvhoder_share_info" runat="server" DataKeyField="share_id" AutoGenerateColumns="False" EmptyDataText="No records has been added." style="border:none;" Width="100%" PageSize="5">
												<Columns>
													<asp:BoundField DataField="share_id" HeaderText="#"/>
													<asp:BoundField DataField="share_name" HeaderText="Share Name"/>
													<asp:BoundField DataField="share_price" HeaderText="Price"/>                                   
													<asp:TemplateField HeaderText="Change">
														<ItemTemplate>
															<asp:Label ID="lblchange" runat="server" Text="0"></asp:Label>
														</ItemTemplate>
													</asp:TemplateField>
													<asp:BoundField DataField="holder_share_count" HeaderText="Share Count"/>                                   
												</Columns>
												<AlternatingRowStyle BackColor="White" />
											</asp:GridView>
									    </div><!--//col-->
							    </div><!--//item-->								
						    </div><!--//app-card-body-->						    
						</div><!--//app-card-->
	                </div><!--//col-->
				</div>


				<div class="row mb-4 gy-4">
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"></path>
  <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"></path>
  <circle cx="3.5" cy="5.5" r=".5"></circle>
  <circle cx="3.5" cy="8" r=".5"></circle>
  <circle cx="3.5" cy="10.5" r=".5"></circle>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Pending Transactions</h4>
							        </div><!--//col-->									
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto" style="overflow-x:auto;">
										     <asp:GridView ID="gvminerpendingtransactions" runat="server" EmptyDataText="No Pending Transactions" AutoGenerateColumns="False" style="border:none;" Width="100%" PageSize="5">
												<Columns>
													<asp:TemplateField HeaderText="Sender Hash">
																	<ItemTemplate>
																		<asp:Label width="270" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("from")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Receiver Hash">
																	<ItemTemplate>
																		<asp:Label width="270" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("to")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Chips">
																	<ItemTemplate>
																		<asp:Label ID="lblblockhash" runat="server" Text='<%#  Bind("amount")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
												</Columns>
												<AlternatingRowStyle BackColor="White" />
											</asp:GridView>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->		
							</div>
						</div><!--//app-card-->
	                </div><!--//col-->
					<div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"></path>
  <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"></path>
</svg>
									    </div><!--//icon-holder-->						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Blocks Mined</h4>
							        </div><!--//col-->									
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
									   <div class="col-auto" style="overflow-x:auto;">
										     <asp:GridView ID="gvblocksmined" runat="server" EmptyDataText="None Blocks are mined" AutoGenerateColumns="False" style="border:none;" Width="100%" PageSize="5">
												<Columns>
													<asp:TemplateField HeaderText="Sender Hash">
																	<ItemTemplate>
																		<asp:Label width="265" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("from")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Receiver Hash">
																	<ItemTemplate>
																		<asp:Label width="265" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("to")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Reward">
																	<ItemTemplate>
																		<asp:Label ID="lblblockhash" runat="server" Text='<%#  Bind("amount")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
												</Columns>
												<AlternatingRowStyle BackColor="White" />
											</asp:GridView>
									    </div><!--//col-->
							    </div><!--//item-->								
						    </div><!--//app-card-body-->						    
						</div><!--//app-card-->
	                </div><!--//col-->
				</div>
			</div>
		</div>
	</div>
</asp:Content>
