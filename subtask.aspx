<%@ Page Title="LSCorp - Subtask" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <form id="form1" runat="server" class="flex flex-col items-center justify-center container p-6 bg-white shadow-lg rounded-lg">
        <h2 class="text-xl font-semibold mb-4">Subtask List</h2>

        <div class="w-full max-h-[420px] overflow-x-auto overflow-y-auto">
            <!-- Grid View -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Link"
                        ItemStyle-Width="1%" ItemStyle-CssClass="text-center whitespace-nowrap"
                        EditText="<i class='fa-solid fa-pen text-blue-500 hover:text-yellow-600'></i>"
                        DeleteText="<i class='fa-solid fa-trash text-red-500 hover:text-red-600'></i>">
                        <ControlStyle CssClass="px-3 rounded hover:underline transition" />

                        <ItemStyle CssClass="text-center whitespace-nowrap" Width="1%"></ItemStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="ID" HeaderText="Subtask ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Subtask Name" SortExpression="NAME" />
                    <asp:BoundField DataField="STATUS" HeaderText="Subtask Status" SortExpression="STATUS" />
                    <asp:BoundField DataField="TASKS_ID" HeaderText="TASKS_ID" SortExpression="TASKS_ID" Visible="false" />
                    <asp:BoundField DataField="USERS_ID" HeaderText="USERS_ID" SortExpression="USERS_ID" Visible="false" />
                    <asp:TemplateField HeaderText="Task Name">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="false" ID="DropDownList5" runat="server" DataSourceID="taskdatasource" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TASKS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="taskdatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Full Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="usernamedatasource" DataTextField="User Full Name" DataValueField="ID" SelectedValue='<%# Bind("USERS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="usernamedatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select id, first_name || ' ' || last_name &quot;User Full Name&quot; from users"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;SUBTASKS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;SUBTASKS&quot; (&quot;ID&quot;, &quot;NAME&quot;, &quot;STATUS&quot;, &quot;TASKS_ID&quot;, &quot;USERS_ID&quot;) VALUES (:ID, :NAME, :STATUS, :TASKS_ID, :USERS_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot;, &quot;STATUS&quot;, &quot;TASKS_ID&quot;, &quot;USERS_ID&quot; FROM &quot;SUBTASKS&quot;" UpdateCommand="UPDATE &quot;SUBTASKS&quot; SET &quot;NAME&quot; = :NAME, &quot;STATUS&quot; = :STATUS, &quot;TASKS_ID&quot; = :TASKS_ID, &quot;USERS_ID&quot; = :USERS_ID WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="TASKS_ID" Type="Decimal" />
                <asp:Parameter Name="USERS_ID" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NAME" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="TASKS_ID" Type="Decimal" />
                <asp:Parameter Name="USERS_ID" Type="Decimal" />
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
                            <label class="block text-sm font-medium">Status:</label>
                            <asp:TextBox ID="STATUSTextBox" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("STATUS") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Task:</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="w-full p-2 border rounded bg-white" DataSourceID="SqlDataSource1" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TASKS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;TASKS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;TASKS&quot; (&quot;ID&quot;, &quot;NAME&quot;) VALUES (:ID, :NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;TASKS&quot;" UpdateCommand="UPDATE &quot;TASKS&quot; SET &quot;NAME&quot; = :NAME WHERE &quot;ID&quot; = :ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                    <asp:Parameter Name="NAME" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="NAME" Type="String" />
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div>
                            <label class="block text-sm font-medium">User:</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="w-full p-2 border rounded bg-white" DataSourceID="SqlDataSource2" DataTextField="FIRST_NAME" DataValueField="ID" SelectedValue='<%# Bind("USERS_ID") %>'>
                            </asp:DropDownList>
                    
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;) VALUES (:ID, :FIRST_NAME, :LAST_NAME)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot; FROM &quot;USERS&quot;" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME WHERE &quot;ID&quot; = :ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                                    <asp:Parameter Name="LAST_NAME" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                                    <asp:Parameter Name="LAST_NAME" Type="String" />
                                    <asp:Parameter Name="ID" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="mt-4 flex space-x-4">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton 
                        ID="NewButton" 
                        runat="server" 
                        CausesValidation="False" 
                        CommandName="New" 
                        Text="Add New Subtask" 
                        CssClass="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</asp:Content>
