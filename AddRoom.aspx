<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddRoom.aspx.cs" Inherits="AddRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #mystyle {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="background-color: lightgray; color: black;">
        <div id="heading">
            <br />
            <h1 style="margin-left: 3%; color: darkblue;">Add Room!</h1>
            <br />
            <h1 style="margin-left: 3%; border: 2px solid black; padding: 5px; width: 15%; color: White; background-color: black;">Basic Information</h1>

        </div>
        <div id="mystyle">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label runat="server" for="DDL_DocxType" Text="Upload Room Pictures"></asp:Label>
                        <asp:FileUpload ID="FU" CssClass="btn btn-primary" Width="80%" runat="server" />
                        <asp:Label runat="server" ForeColor="Red" ID="FileStatus"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:CheckBox runat="server" Width="80%" Text="Main Cover" ID="chk_Main" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button runat="server" Width="80%" CssClass="btn btn-primary" Text="Add" ID="btn_UploadFile" OnClick="btn_UploadFile_Click" />
                    </div>
                </div>
                <asp:GridView CssClass="table table-bordered" ID="dgv_Pic" runat="server" AutoGenerateColumns="False" Width="80%" OnRowDeleting="dgv_Pic_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <ItemStyle HorizontalAlign="Right" Width="50%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Main" HeaderText="IsMain">
                            <ItemStyle HorizontalAlign="Right" Width="50%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Image" ItemStyle-Width="50%">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImageSrc") %>' Style="width: 50px; height: 60px;" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <br />

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Room Size</label>
                            <input type="Number" class="form-control" runat="server" id="txt_Occupation" />
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlInput1">Address</label>
                            <input type="text" class="form-control" runat="server" id="txt_Political" />
                        </div>

                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Occuptied By</label>
                            <input type="text" class="form-control" runat="server" id="txt_Edu" />
                        </div>

                        <div class="form-group">
                            <label for="exampleFormControlInput1">Rent</label>
                            <input type="Number" class="form-control" runat="server" id="txt_hobbies" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Bed in Room</label>
                            <input type="Number" class="form-control" runat="server" id="txt_Religion" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Contact Person Name</label>
                            <input type="Number" class="form-control" runat="server" id="Number1" />
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Contact Person Number</label>
                            <input type="text" class="form-control" runat="server" id="Text2" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="exampleFormControlInput1">Description</label>
                            <input type="text" class="form-control" runat="server" id="txt_Desc" />
                        </div>
                    </div>
                </div>
                <br />
                <asp:Button runat="server" ID="btn_submit" CssClass="bg-primary" Style="margin-left: 48%;" Text="Go!" />

            </div>
        </div>
    </div>

</asp:Content>

