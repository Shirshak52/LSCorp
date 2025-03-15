<%@ Page Title="LSCorp - User Project" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <form id="form1" runat="server" class="container mt-10 p-6 bg-white shadow-lg rounded-lg">
        <!-- SQL Data Source for User Dropdown -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select u.first_name || ' ' || u.last_name &quot;User Full Name&quot;, p.name &quot;PROJECT NAME&quot;, p.start_date, p.due_date, p.status from users u join user_project up on u.id = up.users_id join projects p on up.projects_id = p.id where u.id = :selectedUser
">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="selectedUser" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>

        <h2 class="text-xl font-semibold mb-4">Assigned Project Details of Each User</h2>

        <!-- User Dropdown -->
        <div class="flex-col items-center justify-center">
            <label class="block text-sm font-medium">Select User:</label>
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FIRST_NAME" DataValueField="ID">
            </asp:DropDownList>
        </div>

        <!-- Grid View -->
        <div class="max-h-[350px] overflow-x-auto overflow-y-auto mt-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:BoundField DataField="User Full Name" HeaderText="User Full Name" SortExpression="User Full Name" />
                    <asp:BoundField DataField="PROJECT NAME" HeaderText="Project Name" SortExpression="PROJECT NAME" />
                    <asp:BoundField DataField="START_DATE" HeaderText="Project Start Date" SortExpression="START_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                    <asp:BoundField DataField="DUE_DATE" HeaderText="Project Due Date" SortExpression="DUE_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                    <asp:BoundField DataField="STATUS" HeaderText="Project Status" SortExpression="STATUS" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot; FROM &quot;USERS&quot;"></asp:SqlDataSource>
    </form>
</asp:Content>
