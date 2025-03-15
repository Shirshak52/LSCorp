<%@ Page Title="LSCorp - Top Performer" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <form id="form1" runat="server" class="container mt-10 p-6 bg-white shadow-lg rounded-lg">
        <div>
            <!-- SQL Data Source for Project Dropdown -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.name &quot;Project Name&quot;, u.first_name || ' ' || u.last_name &quot;User Full Name&quot;, count(t.id) &quot;Tasks Completed&quot;, dense_rank() over (partition by p.name order by count(t.id) desc) &quot;User Rank&quot; from user_project_task upt join users u on upt.users_id = u.id join projects p on upt.projects_id = p.id join tasks t on upt.tasks_id = t.id where p.id = :project and t.status='Cleared' group by p.name, u.first_name, u.last_name order by p.name">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <h2 class="text-xl font-semibold mb-4">Top Performer in Each Project</h2>

            <!-- Project Dropdown -->
            <div class="flex-col items-center justify-center">
                <label class="block text-sm font-medium">Select Project:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="ID">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
        </div>

        <!-- Grid View -->
        <div class="max-h-[350px] overflow-x-auto overflow-y-auto mt-4">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:BoundField DataField="Project Name" HeaderText="Project Name" SortExpression="Project Name" />
                    <asp:BoundField DataField="User Full Name" HeaderText="User Full Name" SortExpression="User Full Name" />
                    <asp:BoundField DataField="Tasks Completed" HeaderText="Tasks Completed" SortExpression="Tasks Completed" />
                    <asp:BoundField DataField="User Rank" HeaderText="User Rank" SortExpression="User Rank" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>
