<%@ Page Title="LSCorp - Project Milestone" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
    <form id="form1" runat="server" class="container mt-10 p-6 bg-white shadow-lg rounded-lg">
        <div>

            <h2 class="text-xl font-semibold mb-4">Milestone Details of Each Project</h2>

            <!-- Project Dropdown -->
            <div class="flex-col items-center justify-center">
                <label class="block text-sm font-medium">Select Project:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="ID">
                </asp:DropDownList>
            </div>

            <!-- SQL Data Source for Project Dropdown -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.name &quot;PROJECT_NAME&quot;, p.start_date, p.due_date, p.status &quot;PROJECT_STATUS&quot;, m.name &quot;MILESTONE_NAME&quot;, m.status &quot;MILESTONE_STATUS&quot; from projects p join milestones m on p.id = m.projects_id where p.id = :project">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="project" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- Grid View -->
            <div class="max-h-[350px] overflow-x-auto overflow-y-auto mt-4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                    <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
                    <Columns>
                        <asp:BoundField DataField="PROJECT_NAME" HeaderText="Project Name" SortExpression="PROJECT_NAME" />
                        <asp:BoundField DataField="START_DATE" HeaderText="Project Start Date" SortExpression="START_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                        <asp:BoundField DataField="DUE_DATE" HeaderText="Project Due Date" SortExpression="DUE_DATE" DataFormatString="{0:yyyy-MMM-dd}" HtmlEncode="false"/>
                        <asp:BoundField DataField="PROJECT_STATUS" HeaderText="Project Status" SortExpression="PROJECT_STATUS" />
                        <asp:BoundField DataField="MILESTONE_NAME" HeaderText="Milestone Name" SortExpression="MILESTONE_NAME" />
                        <asp:BoundField DataField="MILESTONE_STATUS" HeaderText="Milestone Status" SortExpression="MILESTONE_STATUS" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
    </form>
</asp:Content>
