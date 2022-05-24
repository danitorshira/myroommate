<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Find.aspx.cs" Inherits="Find" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>

    <section class="portfolio-block block-intro" style="padding-top: 34px; font-family: Acme, sans-serif;">
        <div class="container">
            <div class="about-me">
                <div class="form-group">
                    <p style="background: #e6e6e6; font-size: 21px;">
                        Search&nbsp;<input type="search" />
                        <asp:Button runat="server" ID="lbl_Filter" Text="Filter" CssClass="btn-Primary" OnClick="lbl_Filter_Click" />
                    </p>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="about-me">
                <div class="form-group">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        <p class="d-xl-flex align-items-xl-start" style="margin-bottom: 5px; font-size: 19px;">Religion</p>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" runat="server" value="" type="checkbox" id="chk_Reg_Secular" /><label class="form-check-label" for="formCheck-1">Secular<br />
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" runat="server" type="checkbox" id="chk_Reg_Traditional" /><label class="form-check-label" for="formCheck-1">Traditional
                                                <br />
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" runat="server" type="checkbox" id="chk_Reg_Religious" /><label class="form-check-label" for="formCheck-1">Religious<br>
                                            </label>
                                        </div>
                                    </th>
                                    <th>
                                        <p class="d-xl-flex align-items-xl-start" style="margin-bottom: 5px; font-size: 19px;">Education</p>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_12year"/><label class="form-check-label" for="formCheck-1">12 school years<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_high"/><label class="form-check-label" for="formCheck-1">high school education<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_Academic"/><label class="form-check-label" for="formCheck-1">Academic education<br/>
                                            </label>
                                        </div>
                                    </th>
                                    <th>
                                        <p class="d-xl-flex align-items-xl-start" style="margin-bottom: 5px; font-size: 19px;">
                                            <br>
                                            <strong>Political position</strong><br>
                                        </p>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox"  runat="server" id="chk_Rightist"/><label class="form-check-label" for="formCheck-1">Rightist<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox"  runat="server" id="chk_Leftist"/><label class="form-check-label" for="formCheck-1">Leftist<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox"  runat="server" id="chk_Neutral"/><label class="form-check-label" for="formCheck-1">Neutral<br/>
                                            </label>
                                        </div>
                                    </th>
                                </tr>

                                <tr>
                                    <th>
                                        <p class="d-xl-flex align-items-xl-start" style="margin-bottom: 5px; font-size: 19px;">
                                            <br>
                                            <strong>Food Preference</strong>
                                        </p>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_Vegetarian" /><label class="form-check-label" for="formCheck-1">Vegetarian<br />
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_Vegan"  /><label class="form-check-label" for="formCheck-1">Vegan<br />
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_kosher" /><label class="form-check-label" for="formCheck-1">kosher<br />
                                            </label>
                                        </div>
                                    </th>
                                    <th>
                                        <p class="d-xl-flex align-items-xl-start" style="margin-bottom: 5px; font-size: 19px;">
                                            <br/>
                                            <strong>Residence</strong>
                                        </p>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_Central"/><label class="form-check-label" for="formCheck-1">Central Israel<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_North"/><label class="form-check-label" for="formCheck-1">North Israel<br/>
                                            </label>
                                        </div>
                                        <div class="form-check d-xl-flex justify-content-xl-start">
                                            <input class="form-check-input" type="checkbox" runat="server" id="chk_South"/><label class="form-check-label" for="formCheck-1">South Israel<br/>
                                            </label>
                                        </div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <div class="container">
            <div class="about-me">

                <h3 runat="server" id="lbl_Msg" visible="false">  </h3>

                <asp:DataList runat="server" ID="DL1">
                    <ItemTemplate>
                        <div class="table-responsive" style="background: #efc8c8;">

                            <table class="table">
                                <thead>
                                    <tr>
                                        <th style="width: 111px; border-style: none;">
                                            <img class="rounded bg-white border rounded-circle border-white shadow-sm" src="<%# Eval("ProfilePicture") %>" style="height: 80px; border-radius: 44px; width: 80px;"></th>
                                        <th class="d-flex" style="padding: 0; padding-right: 1px; border-style: none; margin-top: 20px;">
                                            <p style="margin-bottom: -2px; font-family: ABeeZee, sans-serif;">&nbsp;<%# Eval("Name") %></p>
                                            <p style="margin-bottom: 0; font-size: 17px;"></p>
                                        </th>
                                        <th class="d-flex" style="padding: 4px; border-style: none;">
                                            <p style="margin-bottom: 0; font-size: 17px;">&nbsp;<%# Eval("City") %></p>
                                        </th>
                                        <th style="border-style: none; width: 195px;">
                                            <p style="margin-bottom: 0; font-size: 13px;">&nbsp;<%# Eval("Residence") %></p>
                                            <p style="margin-bottom: 0; font-size: 13px;">&nbsp;<%# Eval("Religious") %></p>
                                            <p style="margin-bottom: 0; font-size: 13px;">&nbsp;<%# Eval("Education") %></p>
                                            <p style="margin-bottom: 0; font-size: 13px;">&nbsp;<%# Eval("Political") %></p>
                                        </th>
                                    </tr>

                                </thead>

                            </table>

                        </div>
                        <div class="table-responsive" style="background: #efc8c8;">

                            <table class="table">
                                <thead>
                                    <tr style="width: 100%;">
                                        <th style="text-align: left; font-size: 15px;"><%# Eval("Description") %><br />
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="text-align: left;"><%# Eval("Address") %></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <img src="<%# Eval("DisplayImage") %>" height="150px" width="400px">
                                            <img src="<%# Eval("DisplayImage2") %>" style="margin-left: 5px;" height="150px" width="210px">
                                        </td>
                                        <%--<img src="Images/Image1.jpeg" >--%>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; padding: 13px; padding-top: 0; padding-bottom: 0;">
                                            <a runat="server" class="btn btn-primary" type="button" style="border-radius: 8px;background: rgb(6,73,116);margin: 5px;" href='<%# Eval("WhatsappLink") %>' target="_blank" > Contact </a>
                                            <asp:Button runat="server" ID="btn_JoinGroup" OnClick="btn_JoinGroup_Click" class="btn btn-primary" type="button" style="border-radius: 8px; background: rgb(6,73,116);" CommandArgument='<%# Eval("Room_Id") %>' Text="Join Group" ></asp:Button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        </div>
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </div>
    </section>
</asp:Content>

