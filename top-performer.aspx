<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="top-performer.aspx.cs" Inherits="LSCorp.top_performer" %>

<!DOCTYPE html>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LSCorp - User-Project</title>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="py-10 pt-20 bg-gray-100 flex flex-col items-center justify-center">

    <!-- Navbar -->
    <nav class="bg-yellow-500 p-4 text-white w-full shadow-lg fixed top-0 z-50">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">LSCorp</h1>
            <ul class="grid grid-cols-4">
                <li><a href="index.aspx" class="hover:underline">Home</a></li>
                <li><a href="user.aspx" class="hover:underline">User</a></li>
                <li><a href="project.aspx" class="hover:underline">Project</a></li>
                <li><a href="task.aspx" class="hover:underline">Task</a></li>
                <li><a href="subtask.aspx" class="hover:underline">Subtask</a></li>
                <li><a href="milestone.aspx" class="hover:underline">Milestone</a></li>
                <li><a href="user-project.aspx" class="hover:underline">User Project</a></li>
                <li><a href="user-project-bridge.aspx" class="hover:underline">User Project Bridge</a></li>
                <li><a href="project-milestone.aspx" class="hover:underline">Project Milestone</a></li>
                <li><a href="top-performer.aspx" class="hover:underline">Top Performer</a></li>
                <li><a href="user-project-task-bridge.aspx" class="hover:underline">User Project Task Bridge</a></li>
            </ul>
        </div>
    </nav>

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
</body>
</html>
