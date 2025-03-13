<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="LSCorp.project" %>

<!DOCTYPE html>
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LSCorp - Project</title>

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
        <h2 class="text-xl font-semibold mb-4">Project List</h2>
        <div class="max-h-[350px] overflow-x-auto overflow-y-auto">
            <!-- Grid View -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Link"
                        ItemStyle-Width="1%" ItemStyle-CssClass="text-center whitespace-nowrap"
                        EditText="<i class='fa-solid fa-pen text-blue-500 hover:text-yellow-600'></i>"
                        DeleteText="<i class='fa-solid fa-trash text-red-500 hover:text-red-600'></i>">
                        <ControlStyle CssClass="px-3 rounded hover:underline transition" />
                    </asp:CommandField>
                    <asp:BoundField DataField="ID" HeaderText="Project ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Project Name" SortExpression="NAME" />
                    <asp:BoundField DataField="START_DATE" HeaderText="Start Date" SortExpression="START_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                    <asp:BoundField DataField="DUE_DATE" HeaderText="Due Date" SortExpression="DUE_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                    <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;PROJECTS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;PROJECTS&quot; (&quot;ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot;) VALUES (:ID, :NAME, :START_DATE, :DUE_DATE, :STATUS)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot;, &quot;START_DATE&quot;, &quot;DUE_DATE&quot;, &quot;STATUS&quot; FROM &quot;PROJECTS&quot;" UpdateCommand="UPDATE &quot;PROJECTS&quot; SET &quot;NAME&quot; = :NAME, &quot;START_DATE&quot; = :START_DATE, &quot;DUE_DATE&quot; = :DUE_DATE, &quot;STATUS&quot; = :STATUS WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="START_DATE" Type="DateTime" />
                <asp:Parameter Name="DUE_DATE" Type="DateTime" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <!-- Form View -->
        <div class="py-6 mt-6 rounded-lg">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium">ID:</label>
                            <asp:TextBox ID="IDTextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("ID") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Name:</label>
                            <asp:TextBox ID="NAMETextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("NAME") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Start Date:</label>
                            <asp:TextBox ID="START_DATETextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("START_DATE") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Due Date:</label>
                            <asp:TextBox ID="DUE_DATETextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("DUE_DATE") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Status:</label>
                            <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("STATUS") %>' />
                        </div>
                    </div>
    
                    <!-- Add and Cancel Buttons -->
                    <div class="mt-4 flex space-x-4">
                        <asp:LinkButton 
                            ID="InsertButton" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Insert" 
                            Text="Insert" 
                            CssClass="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition" />
        
                        <asp:LinkButton 
                            ID="InsertCancelButton" 
                            runat="server" 
                            CausesValidation="False" 
                            CommandName="Cancel" 
                            Text="Cancel" 
                            CssClass="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton 
                        ID="NewButton" 
                        runat="server" 
                        CausesValidation="False" 
                        CommandName="New" 
                        Text="Add New Project" 
                        CssClass="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
