<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="home.aspx.cs" Inherits="testmain.home" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div>
        <div style="padding-top:70px;">
            <lable style="font-size:50px;margin-top:100px;font-weight:bold">Buy and Sell Shares Online</lable><br /><br />
            <label>ShareLog is the easiest place to buy, sell, and manage your shares portfolio.</label>
        </div>
        <div class="lbl-get-started">
            <br />
            <br />
            <br />
            <label style="font-size:30px;">Hurry!! Sign up Now and get 10 Chips Free... <asp:LinkButton runat="server" OnClick="btnsignup_Click" ID="btnsignup">Get Started</asp:LinkButton></label>
        </div>
        <div>
            <div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
							   <asp:GridView ID="share_info" CssClass="table app-table-hover mb-auto text-center" runat="server" DataKeyField="share_id" AutoGenerateColumns="False" style="border:none; margin-top:50px; margin-left: auto; margin-right:auto;" Width="70%" PageSize="5">
                                <Columns>
									<asp:BoundField DataField="share_name" HeaderText="Share Name"/>
									<asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <asp:Label ID="share_price" runat="server" Text='<%#  Math.Round(Convert.ToDouble(Eval("share_price")),3) %>'></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>                                   
									<asp:TemplateField HeaderText="Change">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchange" runat="server" Text="0"></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trade">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnbuy" href="signup.aspx" runat="server" Text="Buy"></asp:LinkButton>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
		                </div><!--//row-->
			        </div><!--//app-card-header-->
                    <div class="row g-4 mb-4" style="padding-top:50px;">
				    <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Security / Immutability</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1">Once every block is sealed cryptographically, it is impossible to copy, delete or edit, ensuring the immutability of the digital ledger. Because of the very nature of decentralisation of networks, there can never be central points of error or failure within the system. With an absence of weak points within the system for hacking, there can be zero chances of malicious, which boosts the network’s reliability. On top of this, every transaction needs the digital signature through both private and public keys which utilise different cryptographic schemes ensuring complete encryption.</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
				    
				   <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Open source</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1"><p>Blockchain being open source software, there are reduced entry barriers that lead to stronger developer base and enhanced transparency. Open source software is shared freely, collaboratively produced, transparently developed and published for the community good instead of being a single organisation or individual’s property with the aim of making a profit. No single individual or a company develops, sells or owns the software which removes any chokepoints or bottlenecks in the open source software development process.</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
				   <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Trust</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1">As the participant’s identity remains confidential, everyone can deal freely with another through the secure network. Complete anonymity and transaction security are among the top advantages of blockchain technology. It is crucial for participants to maintain privacy and anonymity for many reasons. With every transaction on centralised networks, the address is given out, which means the details of the user can be found out by hackers. Blockchain protects addresses in a given wallet by changing addresses constantly which makes it difficult for payments or transactions to be traced.</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
				<div class="bg-pic"><img style="width:100%;" src="home_blockchain.png" /></div>
                <div class="row g-4 mb-4" style="padding-top:50px;">
				    <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Decentralised</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1">As one of the most interesting aspects of the blockchain, decentralisation is also its key advantage. Instead of being stored in any one single point, blockchain system is entirely decentralised, which means that it is not possible for an overarching authority to advance its own agenda and control the network. Decentralisation also translates into more security besides being a fair system of distribution</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
				    
				   <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Ease of use</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1"><p>With competent integration capabilities, blockchain has the advantage of being easy to use and fast. The flow of data or money is quicker because of the absence of middlemen. In traditional banks, transactions of huge volume take multiple days to complete owing to different protocols or transferring software. Besides, financial institutes have defined working hours while online transactions are also not allowed on holidays in some countries. 
Blockchain technology operates on a 24×7 basis, which means any day or any time, transactions can be made quickly and safely.</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
				   <div class="col-12 col-lg-4">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 style="font-size:30px;" class="stats-type mb-1">Transparency</h4>
							    <div style="padding-top:10px; text-align:justify;" class="mb-1">It is possible for users to verify and track transactions in the public, decentralised ledger. Any individual can view the entire record of transactions. Besides, the software, being open source, any alteration of data is incredibly difficult. With multiple eyes glued to the network, any alteration in the logged data is sure to be seen, which adds to the transparency and security of blockchain.</div>
						    </div><!--//app-card-body-->
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
			</div>
		</div>
	</div>
			</div>
		</div>
	
</asp:Content>
