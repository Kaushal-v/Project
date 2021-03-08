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
									                <asp:Label runat="server" ID="lblchange1"></asp:Label>
									            </td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare2"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice2"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange2"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare3"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice3"></asp:Label></td>
												<td class="stat-cell">													
												    <asp:Label runat="server" ID="lblchange3"></asp:Label>
											    </td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare4"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice4"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange4"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare5"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice5"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange5"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare6"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice6"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange6"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare7"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice7"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange7"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare8"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice8"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange8"></asp:Label></td>
											</tr>
											<tr>
												<td><asp:Label runat="server" ID="lblshare9"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblshareprice9"></asp:Label></td>
												<td class="stat-cell"><asp:Label runat="server" ID="lblchange9"></asp:Label></td>
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