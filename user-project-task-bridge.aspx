﻿<%@ Page Title="LSCorp - User Project Task Bridge" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <form id="form1" runat="server" class="flex flex-col items-center container p-6 bg-white shadow-lg rounded-lg">
        <h2 class="text-xl font-semibold mb-4">Users and Assigned Project Tasks</h2>

        <!-- Grid View -->
        <div class="w-full max-h-[420px] overflow-x-auto overflow-y-auto">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="USERS_ID,PROJECTS_ID,TASKS_ID" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Link"
                        ItemStyle-Width="1%" ItemStyle-CssClass="text-center whitespace-nowrap"
                        EditText="<i class='fa-solid fa-pen text-blue-500 hover:text-yellow-600'></i>"
                        DeleteText="<i class='fa-solid fa-trash text-red-500 hover:text-red-600'></i>">
                        <ControlStyle CssClass="px-3 rounded hover:underline transition" />

                        <ItemStyle CssClass="text-center whitespace-nowrap" Width="1%"></ItemStyle>
                    </asp:CommandField>
                    <asp:BoundField DataField="USERS_ID" HeaderText="USERS_ID" ReadOnly="True" SortExpression="USERS_ID" Visible="false"/>
                    <asp:BoundField DataField="PROJECTS_ID" HeaderText="PROJECTS_ID" ReadOnly="True" SortExpression="PROJECTS_ID" Visible="false"/>
                    <asp:BoundField DataField="TASKS_ID" HeaderText="TASKS_ID" ReadOnly="True" SortExpression="TASKS_ID" Visible="false"/>
                    <asp:TemplateField HeaderText="User Full Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="userfullnamedatasource" DataTextField="User Full Name" DataValueField="ID" SelectedValue='<%# Bind("USERS_ID") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="userfullnamedatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select id, first_name || ' ' || last_name &quot;User Full Name&quot; from users"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="projectnamedatasource" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("PROJECTS_ID") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="projectnamedatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Task Name">
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="tasknamedatasource" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TASKS_ID") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="tasknamedatasource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;USER_PROJECT_TASK&quot; WHERE &quot;USERS_ID&quot; = :USERS_ID AND &quot;PROJECTS_ID&quot; = :PROJECTS_ID AND &quot;TASKS_ID&quot; = :TASKS_ID" InsertCommand="INSERT INTO &quot;USER_PROJECT_TASK&quot; (&quot;USERS_ID&quot;, &quot;PROJECTS_ID&quot;, &quot;TASKS_ID&quot;) VALUES (:USERS_ID, :PROJECTS_ID, :TASKS_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;USERS_ID&quot;, &quot;PROJECTS_ID&quot;, &quot;TASKS_ID&quot; FROM &quot;USER_PROJECT_TASK&quot;">
            <DeleteParameters>
                <asp:Parameter Name="USERS_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECTS_ID" Type="Decimal" />
                <asp:Parameter Name="TASKS_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="USERS_ID" Type="Decimal" />
                <asp:Parameter Name="PROJECTS_ID" Type="Decimal" />
                <asp:Parameter Name="TASKS_ID" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>

        <!-- Form View -->
        <div class="py-6 mt-6 rounded-lg">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="USERS_ID,PROJECTS_ID,TASKS_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-medium">User:</label>
                            <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="User Full Name" DataValueField="ID" SelectedValue='<%# Bind("USERS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select id, first_name || ' ' || last_name &quot;User Full Name&quot; from users"></asp:SqlDataSource>
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Project:</label>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("PROJECTS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
                        </div>
                        <div>
                            <label class="block text-sm font-medium">Task:</label>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource3" DataTextField="NAME" DataValueField="ID" SelectedValue='<%# Bind("TASKS_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;TASKS&quot;"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="mt-4 flex space-x-4">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 transition"/>
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600 transition"/>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton 
                        ID="NewButton" 
                        runat="server" 
                        CausesValidation="False" 
                        CommandName="New" 
                        Text="Assign Project Task" 
                        CssClass="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700 transition" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</asp:Content>
