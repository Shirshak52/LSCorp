<%@ Page Title="LSCorp - User" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <form id="form1" runat="server" class="flex flex-col items-center justify-center container p-6 bg-white shadow-lg rounded-lg">
        <h2 class="text-xl font-semibold mb-4">User List</h2>
        <div class="w-full max-h-[420px] overflow-x-auto overflow-y-auto">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Link"
                        ItemStyle-Width="1%" ItemStyle-CssClass="text-center whitespace-nowrap"
                        EditText="<i class='fa-solid fa-pen text-blue-500 hover:text-yellow-600'></i>"
                        DeleteText="<i class='fa-solid fa-trash text-red-500 hover:text-red-600'></i>">
                        <ControlStyle CssClass="px-3 rounded hover:underline transition" />
                    </asp:CommandField>
                    <asp:BoundField DataField="ID" HeaderText="User ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" SortExpression="FIRST_NAME" />
                    <asp:BoundField DataField="LAST_NAME" HeaderText="Last Name" SortExpression="LAST_NAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" SortExpression="EMAIL" />
                    <asp:BoundField DataField="CONTACT" HeaderText="Contact" SortExpression="CONTACT" />
                </Columns>
            </asp:GridView>
        </div>


        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USERS&quot; WHERE &quot;ID&quot; = :ID" InsertCommand="INSERT INTO &quot;USERS&quot; (&quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;CONTACT&quot;) VALUES (:ID, :FIRST_NAME, :LAST_NAME, :EMAIL, :CONTACT)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;CONTACT&quot; FROM &quot;USERS&quot; order by id" UpdateCommand="UPDATE &quot;USERS&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;CONTACT&quot; = :CONTACT WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
                <asp:Parameter Name="FIRST_NAME" Type="String" />
                <asp:Parameter Name="LAST_NAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FIRST_NAME" Type="String" />
                <asp:Parameter Name="LAST_NAME" Type="String" />
                <asp:Parameter Name="EMAIL" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
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
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("ID") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">First Name:</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("FIRST_NAME") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Last Name:</label>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("LAST_NAME") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Email:</label>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("EMAIL") %>' />
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Contact:</label>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="w-full p-2 border rounded" Text='<%# Bind("CONTACT") %>' />
                        </div>
                    </div>
                    
                    <!-- Add and Cancel Buttons -->
                    <div class="mt-4 flex space-x-4">
                        <asp:LinkButton 
                            ID="LinkButton1" 
                            runat="server" 
                            CausesValidation="True" 
                            CommandName="Insert" 
                            Text="Insert" 
                            CssClass="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition" />
                        
                        <asp:LinkButton 
                            ID="LinkButton2" 
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
                        Text="Add New User" 
                        CssClass="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</asp:Content>
