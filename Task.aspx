<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="Task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3 id="h1" runat="server" style="color: red; display: block; text-align: center; margin-top: 20px;" visible="false">Not Member of any Group </h3>

    <section class="portfolio-block block-intro" style="padding-top: 34px; font-family: Acme, sans-serif;" runat="server" id="sectionMain">
        <div class="container">
            <div class="d-xl-flex justify-content-xl-center about-me">
                <p style="font-size: 36px;">TO-DO LIST</p>
            </div>

            <div class="row">
                <div class="col-md-4 col-sm-12">
                    <asp:Button Text="Assign Task" class="btn btn-primary" runat="server" OnClick="btn_AssignTask_Click" ID="btn_AssignTask" />
                </div>
                <div class="col-md-4 col-sm-12">
                    <asp:Button Text="Whole Group Task" class="btn btn-primary" runat="server" OnClick="btn_GroupTask_Click" ID="btn_GroupTask" />
                </div>
                <div class="col-md-4 col-sm-12">
                    <asp:Button Text="My Task" class="btn btn-primary" runat="server" OnClick="btn_MyTask_Click" ID="btn_MyTask" />
                </div>

            </div>

        </div>
        <br />
        <div runat="server" id="div_AssignTask">
            <section class="contact-clean" style="padding: 30px 0px; padding-bottom: 18px; background: rgb(255,255,255);">
                <div style="padding: 19px;">
                    <h2 class="text-center">Assign A Work</h2>
                    <asp:Label runat="server" ID="lbl_msg" ForeColor="Red"></asp:Label>
                    <div class="form-group">
                        <input class="form-control" type="text" name="TaskName" runat="server" id="txt_TaskName" placeholder="Task Name" />
                    </div>
                    <div class="d-xl-flex justify-content-xl-center" style="padding: 0; margin: 4px;">
                        <p style="margin: 0; margin-bottom: 0; font-size: 19px;">Priority&nbsp; &nbsp;</p>
                        <div class="form-check" style="margin: 3px;">
                            <input class="form-check-input" type="radio" name="Pri" id="radio_High" runat="server" /><label class="form-check-label" for="formCheck-1" />High</label>
                        </div>
                        <div class="form-check" style="margin: 3px;">
                            <input class="form-check-input" type="radio" name="Pri" id="radio_Medium" runat="server" /><label class="form-check-label" for="formCheck-1" />Medium</label>
                        </div>
                        <div class="form-check" style="margin: 3px;">
                            <input class="form-check-input" type="radio" name="Pri" id="radio_Low" runat="server" /><label class="form-check-label" for="formCheck-1" />Low</label>
                        </div>
                    </div>
                    <div class="form-group">

                        <asp:DropDownList class="form-control is-invalid" runat="server" ID="DDL_GroupMember">
                        </asp:DropDownList>

                    </div>
                    <input class="form-control" runat="server" id="txt_DueDate" type="date" />
                    <div class="form-group">
                        <asp:Button ID="btn_Assign" OnClick="btn_Assign_Click" runat="server" class="btn btn-primary" Style="border-radius: 7px;" Text="Assign"></asp:Button>
                    </div>
                </div>
            </section>

            <div class="container">

                <asp:GridView CssClass="table table-bordered" ID="dgv_AssignTask" runat="server" AutoGenerateColumns="False" Width="80%">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Task Name" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblTask_Name" runat="server" Text='<%#Eval("Task_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Priority" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("Priority") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opened By" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblOpenedBy" runat="server" Text='<%#Eval("OpenedBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assign To" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblAssignTo" runat="server" Text='<%#Eval("AssignTo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblDueDate" runat="server" Text='<%#Eval("DueDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>


          <div class="container" id="grouptask" runat="server" visible="false">

                <asp:GridView CssClass="table table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" Width="80%">
                    <Columns>
                        <asp:TemplateField HeaderText="Serial number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Task Name" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblTask_Name" runat="server" Text='<%#Eval("Task_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Priority" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("Priority") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opened By" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblOpenedBy" runat="server" Text='<%#Eval("OpenedBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assign To" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblAssignTo" runat="server" Text='<%#Eval("AssignTo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblDueDate" runat="server" Text='<%#Eval("DueDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        <div runat="server" id="div_MyTask" visible="false">
            <br />
            <h3 runat="server" id="lbl_myTaskMessage" style="color: red; display: block; text-align: center"></h3>
            <div class="container-fluid">
                <asp:GridView CssClass="table table-bordered" ID="dgv_myTask" runat="server" AutoGenerateColumns="False" Width="80%" OnRowCommand="dgv_myTask_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="Serial number">
                            <ItemTemplate>
                                <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Task Name" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblTask_Name" runat="server" Text='<%#Eval("Task_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Priority" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("Priority") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opened By" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblOpenedBy" runat="server" Text='<%#Eval("OpenedBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assign To" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblAssignTo" runat="server" Text='<%#Eval("AssignTo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Due Date" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblDueDate" runat="server" Text='<%#Eval("DueDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Status" ItemStyle-Width="100%">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" CssClass="label label-primary" Text='<%#Eval("Status").ToString() == "Completed" ? "Completed" : "" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="100">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Pending" CommandName ="select" CommandArgument='<%# Eval("Task_Id") %>' Visible='<%# Eval("s").ToString() == "P" ? true : false %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </section>

</asp:Content>

