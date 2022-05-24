<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MoneyManagement.aspx.cs" Inherits="MoneyManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 id="h1" runat="server" style="color: red; display: block; text-align: center; margin-top: 20px;" visible="false">Not Member of any Group </h3>

    <section class="portfolio-block block-intro" style="padding-top: 34px; font-family: Acme, sans-serif;" runat="server" id="sectionMain">
        <div class="container">
            <div class="d-xl-flex justify-content-xl-center about-me">
                <p style="font-size: 36px;">Money Management</p>
            </div>

            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <asp:Button Text="Assign Payment" class="btn btn-primary" runat="server" OnClick="btn_AssignMoney_Click" ID="btn_AssignMoney" />
                </div>
                <div class="col-md-3 col-sm-12">
                    <asp:Button Text="Whole Group Ledger" class="btn btn-primary" runat="server" ID="btn_GroupLedger" OnClick="btn_GroupLedger_Click" />
                </div>
                <div class="col-md-3 col-sm-12">
                    <asp:Button Text="My Ledger" class="btn btn-primary" runat="server" OnClick="btn_Myledger_Click" ID="btn_Myledger" />
                </div>
            </div>

        </div>
        <br />
        <div runat="server" id="div_AssignTask">
            <section class="contact-clean" style="padding: 30px 0px; padding-bottom: 18px; background: rgb(255,255,255);">
                <div style="padding: 19px;">
                    <h2 class="text-center">Assign Payment</h2>
                    <asp:Label runat="server" ID="lbl_msg" ForeColor="Red"></asp:Label>
                    <div class="form-group">
                        <input class="form-control" type="Number" name="TaskName" runat="server" id="txt_Payment" placeholder="Payment" />
                    </div>
                    <div class="form-group">
                       <b style="color:blue;"> Group Members</b> <br />
                        <asp:ListBox runat="server" ID="DDL_GroupMember" SelectionMode="multiple"></asp:ListBox>
                    </div>
                    <input class="form-control" runat="server" id="txt_Date" type="date" />
                    <br />
                    <div class="form-group">
                        <input class="form-control" type="text" runat="server" id="txt_Desc" placeholder="Description" />
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Button ID="btn_AssignPayment" runat="server" class="btn btn-primary" OnClick="btn_AssignPayment_Click"  Style="border-radius: 7px;" Text="Assign Payment"></asp:Button>
                    </div>
                </div>
            </section>

            <div class="container">

                <asp:GridView CssClass="table table-bordered" ID="dgv_AssignPayment" runat="server" AutoGenerateColumns="true" Width="80%">
                   
                </asp:GridView>
            </div>

        </div>

        <div runat="server" id="div_MyTask" visible="false">
            <br />
            <h3 runat="server" id="lbl_myTaskMessage" style="color: red; display: block; text-align: center"></h3>
            <div class="container-fluid">
                <asp:GridView CssClass="table table-bordered" ID="dgv_myLedger" runat="server" AutoGenerateColumns="true" Width="80%">             
                </asp:GridView>
            </div>
        </div>

        <div runat="server" id="div2" visible="false">
            <br />
            <h3 runat="server" id="H2" style="color: red; display: block; text-align: center"></h3>
            <div class="container-fluid">
                <asp:GridView CssClass="table table-bordered" ID="dgv_Group" runat="server" AutoGenerateColumns="true" Width="80%">             
                </asp:GridView>
            </div>
        </div>

    </section>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[id*=DDL_GroupMember]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

</asp:Content>

