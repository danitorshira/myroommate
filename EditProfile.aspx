<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" EnableSessionState="True" Inherits="EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <main class="page lanidng-page">
        <section style="padding-top: 34px;">
            <div class="container">
                <div class="about-me">
                    <div>
                        <p style="font-size: 15px; font-weight: 600; display: block; text-align: center; margin-bottom: 30px; font-family: Lato, sans-serif;">
                            <asp:Label Style="display: block; text-align: center; color: red" runat="server" ID="lbl_msg"></asp:Label>
                        </p>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="file" class="form-control" runat="server" id="oFile" />
                                    <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                        <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                    </asp:Panel>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <asp:Button ID="btnUpload" type="submit" Text="Upload" OnClick="btnUpload_Click" CssClass="btn btn-primary" runat="server"></asp:Button>
                            </div>
                            <div class="col-md-3">
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <asp:Image runat="server" ID="lbl_Image" Width="130" Height="100" alt="Profile Picture" Style="border-radius: 50%;" />
                                </div>
                            </div>
                        </div>

                        <br />
                        <hr />
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
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
                                        <label for="exampleFormControlInput1">Phone Number</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_Phone" />
                                    </div>
                                </div>

                                <div class="col-md-3">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Occupation</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Occupation" />
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Password</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="password" class="form-control" runat="server" id="txt_Pass" />
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Pets</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Pets" />
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
                                        <label for="exampleFormControlInput1">Group Number</label>
                                        <label type="text" class="form-control" runat="server" id="lbl_Group_Id" />
                                    </div>
                                </div>
                            </div>
                            <br />
                            <asp:Button runat="server" ID="btn_submit" CssClass="btn-primary" Style="margin-left: 48%;" Text="Update Profile " OnClick="btn_submit_Click" /><br />
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </section>
    </main>

    <%--Create Group--%>
    <hr />
    <main class="page lanidng-page" runat="server" id="div_group" visible="true">
        <section>
            <div class="container">
                <div class="about-me">
                    <div>
                        <p style="font-size: 15px; font-weight: 600; display: block; text-align: center; margin-bottom: 30px; font-family: Lato, sans-serif;">
                            <h2>Create a new group </h2>
                            <asp:Label Style="display: block; text-align: center; color: red" runat="server" ID="lbl_Group_error"></asp:Label>
                        </p>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">City</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_City" />
                                    </div>
                                </div>

                                <div class="col-md-3">

                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Street</label>
                                        <input type="text" class="form-control" runat="server" id="txt_Street" />
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">No.</label>
                                        <input type="text" class="form-control" runat="server" id="txt_No" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        
                                        <label for="exampleFormControlInput1">Maximum Number of Roommate</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <asp:DropDownList runat="server" ID="DropDownList1" class="form-control">
                                            <asp:ListItem Value="Choose"> Choose Option </asp:ListItem>
                                            <asp:ListItem Value="1"> 1 </asp:ListItem>
                                            <asp:ListItem Value="2"> 2 </asp:ListItem>
                                            <asp:ListItem Value="3"> 3</asp:ListItem>
                                            <asp:ListItem Value="4"> 4 </asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="exampleFormControlInput1">Description</label><p style="color: red; display: inline-flex; margin-bottom: -1px;">*</p>
                                        <input type="text" class="form-control" runat="server" id="txt_Desc" />
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <input type="file" class="form-control" runat="server" id="File1" />
                                        <asp:Panel ID="Panel1" Visible="False" runat="server">
                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <asp:Button runat="server" Width="80%" CssClass="btn btn-primary" Text="Add" ID="btn_UploadFile" OnClick="btn_UploadFile_Click" />
                                    </div>
                                </div>
                            </div>

                            <asp:GridView CssClass="table table-bordered" ID="dgv_Image" runat="server" AutoGenerateColumns="False" Width="80%" OnRowDeleting="dgv_Image_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="Serial number">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Image" ItemStyle-Width="50%">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImageSrc") %>' Style="width: 50px; height: 60px;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ControlStyle-CssClass="btn btn-danger" ControlStyle-BorderStyle="Groove" ShowDeleteButton="True" />
                                </Columns>
                            </asp:GridView>

                            <br />
                            <asp:Button runat="server" ID="btn_CreateGroup" CssClass="btn-primary" Style="margin-left: 48%;" Text="Create a Group and Get an ID" OnClick="btn_CreateGroup_Click" /><br />
                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </section>
    </main>

    <hr />
    <main class="page lanidng-page" runat="server" id="div_LeaveGroup" visible="true">
        <section>
            <div class="container">
                <div class="about-me">
                    <div class="form-group">
                        <asp:Label runat="server" Text="Want to Leave Group ?" Style="display: block; text-align: center; padding-bottom: 5px;"></asp:Label>
                        <asp:TextBox runat="server" ID="txt_Group_No" class="form-control"></asp:TextBox><br />
                        <asp:Button Text="Leave Group" ID="btn_LeaveGroup" runat="server" CssClass="btn btn-danger" OnClick="btn_LeaveGroup_Click" />
                    </div>
                    <asp:Label ID="lbl_GroupLeave" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </section>
    </main>

    <footer class="page-footer"></footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>

</asp:Content>

