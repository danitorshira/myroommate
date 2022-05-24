<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JoinGroup.aspx.cs" Inherits="JoinGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Join Group Request </h1>
    <br />

    <asp:GridView CssClass="table table-bordered" ID="dgv" runat="server" AutoGenerateColumns="False" Width="80%" OnRowCommand="dgv_RowCommand" >
        <Columns>
            <asp:TemplateField HeaderText="Serial number">
                <ItemTemplate>
                    <asp:Label ID="lblSerial" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Requested By" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblTask_Name" runat="server" Text='<%#Eval("RequestedBy") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Gender" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblPriority" runat="server" Text='<%#Eval("Gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblOpenedBy" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="PhoneNumber" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblAssignTo" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Education" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblDueDate1" runat="server" Text='<%#Eval("Education") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Food" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblDueDate2" runat="server" Text='<%#Eval("Food") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Religious" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblDueDate3" runat="server" Text='<%#Eval("Religious") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Residence" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblDueDate4" runat="server" Text='<%#Eval("Residence") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status" ItemStyle-Width="100%">
                <ItemTemplate>
                    <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Action" ItemStyle-Width="100">
                <ItemTemplate>
                    <asp:LinkButton ID="btnApproved" runat="server" CssClass="btn btn-primary" Text="Approve" CommandName="select" CommandArgument='<%# Eval("Id") %>' Visible='<%# Eval("s").ToString() == "P" ? true : false %>' />
                    <asp:LinkButton ID="btnReject" runat="server" CssClass="btn btn-danger" Text="Reject" CommandName="select1" CommandArgument='<%# Eval("Id") %>' Visible='<%# Eval("s").ToString() == "P" ? true : false %>' />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

</asp:Content>

