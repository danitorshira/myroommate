<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

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
        <section class="portfolio-block block-intro" style="padding-top: 34px;">
            <div class="container">
                <div class="about-me">
                    <p><strong>Welcome to MyRoomMate !</strong><br>
                    </p>
                    <section class="login-clean" style="padding-top: 8px; padding-bottom: 8px; background: rgb(255,255,255);">
                        <form method="post" style="box-shadow: 1px 6px 11px 4px var(--gray-dark);" runat="server">
                            <h2 class="sr-only">Login Form</h2>
                            <div class="form-group">
                                <input runat="server" class="form-control" type="email" id="txt_Email" name="email" placeholder="Email" /></div>
                            <div class="form-group">
                                <input class="form-control" type="password" runat="server" id="txt_Password" name="password" placeholder="Password" /></div>
                            <asp:Label ID="lbl_msg" runat="server" ForeColor="Red"></asp:Label>
                            <div class="form-group">
                                <asp:Button class="btn btn-primary btn-block" type="submit" Style="background: rgb(50,0,132);" runat="server" ID="btn_Login" Text="Log In" OnClick="btn_Login_Click" />
                            <%--    <asp:Button class="btn btn-danger btn-block" type="submit" runat="server" ID="btn_GoogleLogin" Text="Continue with Google" OnClick="btn_GoogleLogin_Click"/>
                            --%>

                            </div>
                            <a class="forgot" href="#" style="background: rgb(255,255,255);">Dont' have an account yet ?
                            <a class="btn btn-primary btn-block" href="Register.aspx" style="background: rgb(50,0,132); margin-top: 5px;">Join MyRoomMate</a></a>
                        </form>
                    </section>
                </div>
            </div>
        </section>
        <section class="portfolio-block photography">
            <p class="d-inline d-xl-flex justify-content-xl-center" style="background: #000000; color: rgb(255,255,255); padding: 2px;"><strong>Why use MyRoommate?</strong><br>
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
</html>
