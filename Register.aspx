<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Home - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Acme">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Akaya+Kanadaka">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/css/pikaday.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-Clean.css">
</head>

<body>
    <main class="page lanidng-page">
        <nav class="navbar navbar-light navbar-expand-md d-xl-flex align-content-start justify-content-xl-end align-items-xl-end navigation-clean" style="padding-top: 0; padding-bottom: 2px; margin: 3px; border-width: 1px; border-style: none; box-shadow: 1px 6px 20px var(--gray-dark);">
            <div class="container"><a class="navbar-brand logo" href="#" style="font-family: 'Akaya Kanadaka', serif; margin: 0; margin-right: 2px; color: rgb(5,3,86); text-shadow: 1px 6px 9px var(--gray-dark); padding-bottom: 0px;">&nbsp;<img src="assets/img/logo.png" style="height: 63px;">&nbsp; MY ROOMMATE</a></div>
        </nav>
        <section style="padding-top: 34px;">
            <div class="container">
                <div class="about-me">
                    <form runat="server">
                        <p style="font-size: 15px; font-weight: 600; display: block; text-align: center; margin-bottom: 30px; font-family: Lato, sans-serif;">
                            Welcome to our signup page!<br>
                            <br>
                            Please fill all mandatory fields <b style="color: red;">Red Asterisk(*)</b> in detail<br>
                            <br />
                            <asp:Label Style="display: block; text-align: center; color: red" runat="server" ID="lbl_msg"></asp:Label>
                        </p>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="exampleFormControlInput1">Profile Picture</label>
                                    <input type="file" class="form-control" runat="server" id="oFile" />
                                    <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                        <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <br />
                                <asp:Button ID="btnUpload" type="submit" Text="Upload" OnClick="btnUpload_Click" CssClass="btn btn-primary" runat="server"></asp:Button>

                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Image runat="server" ID="lbl_Image" />
                                </div>
                            </div>
                        </div>

                        <br />
                        <hr />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">First Name</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_FirstName" />
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Residence</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DDL_Residence" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="Central Israel"> Central Israel </asp:ListItem>
                                            <asp:ListItem Value="North Israel"> North Israel </asp:ListItem>
                                            <asp:ListItem Value="South Israel"> South Israel </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Last Name</label>
                                        <input type="text" class="form-control" runat="server" id="txt_LastName" />
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Phone Number</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_Phone" />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Gender</label>
                                        <asp:DropDownList runat="server" ID="DDL_Gender" class="form-control">
                                            <asp:ListItem Value="Male"> Male </asp:ListItem>
                                            <asp:ListItem Value="Female"> Female </asp:ListItem>
                                            <asp:ListItem Value="Other"> Other </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Email</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_Email" />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Date of Birth</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="date" class="form-control" runat="server" id="txt_DOB" />
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Password</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="password" class="form-control" runat="server" id="txt_Pass" />
                                    </div>
                                </div>

                            </div>

                            <br />
                            <hr />

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Occupation</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Occupation" />
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Political Position</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DDL_Political" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="Rightist"> Rightist </asp:ListItem>
                                            <asp:ListItem Value="Leftist"> Leftist </asp:ListItem>
                                            <asp:ListItem Value="Neutral"> Neutral </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Education</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DDL_Edu" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="12 school years"> 12 school years </asp:ListItem>
                                            <asp:ListItem Value="high school education"> high school education </asp:ListItem>
                                            <asp:ListItem Value="Academic education"> Academic education </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Hobbies</label>
                                        <input type="text" class="form-control" runat="server" id="txt_hobbies" />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Religion</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DDL_Religion" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="Secular"> Secular </asp:ListItem>
                                            <asp:ListItem Value="Traditional"> Traditional </asp:ListItem>
                                            <asp:ListItem Value="Religious"> Religious </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Allerigies</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Allerigies" />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Food Preferences</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DDL_Food" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="Vegetarian"> Vegetarian </asp:ListItem>
                                            <asp:ListItem Value="Vegan"> Vegan </asp:ListItem>
                                            <asp:ListItem Value="kosher">kosher</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Pets</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Pets" />
                                    </div>
                                </div>

                            </div>
                            <br />
                            <asp:Button runat="server" ID="btn_submit" CssClass="btn-primary" Style="margin-left: 48%;" Text="Submit!" OnClick="btn_submit_Click" /><br />
                            <a style="display: block; text-align: center;" href="index.aspx">Account Already Exist visit Login Page </a>
                        </div>
                    </form>
                    <br />
                    <br />
                </div>
            </div>
        </section>
        <section class="portfolio-block photography">
            <p class="d-inline d-xl-flex justify-content-xl-center" style="background: #000000; color: rgb(255,255,255); padding: 2px;">
                <strong>Why use MyRoommate?</strong><br>
            </p>
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-6 col-lg-4 d-xl-flex justify-content-xl-start align-items-xl-start item zoom-on-hover" style="background: rgb(255,255,255);">
                        <img src="assets/img/img/1.png">
                        <p style="padding-left: 8px;">
                            <br>
                            <strong>Managing household chores</strong><br>
                            <br>
                            <strong>Together with your roommates, you</strong><br>
                            <strong>will be able to manage your household chores in an orderly manner.</strong><br>
                        </p>
                    </div>
                    <div class="col-md-6 col-lg-4 d-xl-flex align-items-xl-start item zoom-on-hover" style="color: rgb(0,0,0); background: rgb(255,255,255);">
                        <img src="assets/img/img/2.png">
                        <p style="padding-left: 8px;">
                            <br>
                            <strong>&nbsp;A perfect match</strong><br>
                            <br>
                            <strong>Create your personal roommate</strong><br>
                            <strong>profile, fill your characteristics and get started finding the most suitable</strong><br>
                            <strong>partner by filtering features that you prefer.</strong><br>
                            <br>
                        </p>
                    </div>
                    <div class="col-md-6 col-lg-4 d-xl-flex align-content-center justify-content-xl-start align-items-xl-start item zoom-on-hover" style="background: rgb(255,255,255);">
                        <img src="assets/img/img/3.png">
                        <p style="padding-left: 8px;">
                            <br>
                            <strong>budget management </strong>
                            <br>
                            <br>
                            <strong>Keep track of your shared expenses</strong><br>
                            <strong>and balances with your roommates.</strong><br>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer class="page-footer"></footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pikaday/1.6.1/pikaday.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
