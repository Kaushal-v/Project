<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminDefault.aspx.cs" Inherits="testmain.adminDefault" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    
    <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">    
			    <div class="row g-4 mb-4">
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Total Sales</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lbltotalsales"></asp:Label>C</div>
						    </div><!--//app-card-body-->						    
					    </div><!--//app-card-->
				    </div><!--//col-->
				    
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Sold Shares</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lblsoldshares"></asp:Label></div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Shares</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lbltotal_shares"></asp:Label></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="share.aspx"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Users</h4>
							    <div class="stats-figure"><asp:Label runat="server" ID="lbltotal_users"></asp:Label></div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="users.aspx"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
			    <div class="row g-4 mb-4">
			        <div class="col-12 col-lg-6">
				        <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
							        <div class="col-auto">
						                <h4 class="app-card-title">Sales Chart</h4>
							        </div><!--//col-->							        
						        </div><!--//row-->
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-3 p-lg-4">
							    <div class="mb-3 d-flex">   
							        <select class="form-select form-select-sm ml-auto d-inline-flex w-auto">
									    <option value="1" selected>This week</option>
									    <option value="2">Today</option>
									    <option value="3">This Month</option>
									    <option value="3">This Year</option>
									</select>
							    </div>
						        <div class="chart-container">
				                    <canvas id="canvas-linechart"></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
			        </div><!--//col-->
			        <div class="col-12 col-lg-6">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
							        <div class="col-auto">
						                <h4 class="app-card-title">Shares Stats</h4>
							        </div><!--//col-->
						        </div><!--//row-->
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-3 p-lg-4">
						        <div class="table-responsive">
							        <table class="table table-borderless mb-0">
										<thead>
											<tr>
												<th class="meta">Share</th>
												<th class="meta stat-cell">Price</th>
												<th class="meta stat-cell">Change</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><asp:Label runat="server" ID="lblshare1"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice1"></asp:Label></td>
												<td class="stat-cell">
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up text-success" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
									</svg> 
									                30%
									            </td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare2"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice2"></asp:Label></td>
												<td class="stat-cell">23%</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare3"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice3"></asp:Label></td>
												<td class="stat-cell">
													<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down text-danger" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
									</svg>
												    20%
											    </td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare4"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice4"></asp:Label></td>
												<td class="stat-cell">-</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare5"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice5"></asp:Label></td>
												<td class="stat-cell">15%</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare6"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice6"></asp:Label></td>
												<td class="stat-cell">15%</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare7"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice7"></asp:Label></td>
												<td class="stat-cell">15%</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare8"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice8"></asp:Label></td>
												<td class="stat-cell">15%</td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare9"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice9"></asp:Label></td>
												<td class="stat-cell">15%</td>
											</tr>
										</tbody>
									</table>
						        </div><!--//table-responsive-->
					        </div><!--//app-card-body-->
							</div><!--//app-card-->
			        </div><!--//col-->
			    </div><!--//row-->
			    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>