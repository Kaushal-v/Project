<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminDefault.aspx.cs" Inherits="testmain.adminDefault" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content runat="server" ContentPlaceHolderID="adminContent"> 
	<asp:Literal id="lit1" Visible="false" runat="server" />
	<asp:Literal id="lit2" Visible="false" runat="server" />
<script>
	var thisweekdatajson = JSON.parse('<%=lit1.Text%>')
	var lastweekdatajson = JSON.parse('<%=lit2.Text%>')
	var thisweekdata = parseInt(thisweekdatajson[0]);
    console.log(thisweekdata)
window.chartColors = {
	green: '#75c181',
	gray: '#a9b5c9',
	text: '#252930',
	border: '#e7e9ed'
	};
    
/* Random number generator for demo purpose */
var randomDataPoint = function(){ return Math.round(Math.random()*100)};	
//Chart.js Line Chart Example 
var lineChartConfig = {
	type: 'line',

	data: {
		labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'],
		
		datasets: [{
			label: 'Current week',
			fill: false,
			backgroundColor: window.chartColors.green,
			borderColor: window.chartColors.green,
			data: [
                thisweekdatajson[0],
                thisweekdatajson[1],
                thisweekdatajson[2],
                thisweekdatajson[3],
                thisweekdatajson[4],
                thisweekdatajson[5],
                thisweekdatajson[6]
			],
		}, {
			label: 'Previous week',
		    borderDash: [3, 5],
			backgroundColor: window.chartColors.gray,
			borderColor: window.chartColors.gray,
			
			data: [
                lastweekdatajson[0],
                lastweekdatajson[1],
                lastweekdatajson[2],
                lastweekdatajson[3],
                lastweekdatajson[4],
                lastweekdatajson[5],
                lastweekdatajson[6]
			],
			fill: false,
		}]
	},
	options: {
		responsive: true,	
		aspectRatio: 1.5,
		
		legend: {
			display: true,
			position: 'bottom',
			align: 'end',			
		}, 
		tooltips: {
			mode: 'index',
			intersect: false,
			titleMarginBottom: 10,
			bodySpacing: 10,
			xPadding: 16,
			yPadding: 16,
			borderColor: window.chartColors.border,
			borderWidth: 1,
			backgroundColor: '#fff',
			bodyFontColor: window.chartColors.text,
			titleFontColor: window.chartColors.text,

            callbacks: {
	            //Ref: https://stackoverflow.com/questions/38800226/chart-js-add-commas-to-tooltip-and-y-axis
                label: function(tooltipItem, data) {
	                if (parseInt(tooltipItem.value) >= 100) {
                        return tooltipItem.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") +'C';
                    } else {
	                    return tooltipItem.value +'C';
                    }
                }
            },

		},
		hover: {
			mode: 'nearest',
			intersect: true
		},
		scales: {
			xAxes: [{
				display: true,
				gridLines: {
					drawBorder: false,
					color: window.chartColors.border,
				},
				scaleLabel: {
					display: false,
				
				}
			}],
			yAxes: [{
				display: true,
				gridLines: {
					drawBorder: false,
					color: window.chartColors.border,
				},
				scaleLabel: {
					display: false,
				},
				ticks: {
		            beginAtZero: true,
		            userCallback: function(value, index, values) {
		                return value.toLocaleString() +'C';   //Ref: https://stackoverflow.com/questions/38800226/chart-js-add-commas-to-tooltip-and-y-axis
		            }
		        },
			}]
		}
	}
};

// Generate charts on load
window.addEventListener('load', function(){
	
	var lineChart = document.getElementById('canvas-linechart').getContext('2d');
	window.myLine = new Chart(lineChart, lineChartConfig);
	

});	
</script>	
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
									<asp:Label runat="server" ID="lblnodatafound" Visible="false" Text="No data is available"></asp:Label>
						        </div><!--//table-responsive-->
					        </div><!--//app-card-body-->
							</div><!--//app-card-->
			        </div><!--//col-->
			    </div><!--//row-->
			    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>