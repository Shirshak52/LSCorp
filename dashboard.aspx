<%@ Page Title="LSCorp - Dashboard" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="~/dashboard.aspx.cs" Inherits="LSCorp.dashboard" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <form id="form1" runat="server" class="flex flex-col items-center container h-screen p-6 bg-white shadow-lg rounded-lg">
        <div class=" border-black">
            <h2 class="font-bold text-xl">Dashboard</h2>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT (select count(id) from tasks where status = 'Cleared') as Completed, (select count(id) from tasks where status='Pending') as Pending from dual
"></asp:SqlDataSource>
        <div class="mt-4 grid grid-cols-3 gap-6 divide-x border-t pt-8 border-black w-full">
            <div class="flex flex-col items-center justify-center border-black">
                <p class="font-bold">Tasks</p>
                <asp:Chart ID="Chart1" runat="server">
                    <Series>
                        <asp:Series ChartType="Pie" Name="Series1" XValueMember="Category" YValueMembers="Count">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <div class="flex flex-col items-center justify-center  border-black">
                <p class="font-bold">Users Per Project</p>
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2">
                    <Series>
                        <asp:Series ChartType="Bar" Name="Series1" XValueMember="NAME" YValueMembers="USER_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select p.name, count (u.id) user_count from user_project up join projects p on p.id = up.projects_id join users u on u.id = up.users_id group by p.name"></asp:SqlDataSource>
            <div class="flex flex-col items-center justify-center  border-black">
                <p class="font-bold">Counts</p>
                <asp:Chart ID="Chart3" runat="server">
                    <Series>
                        <asp:Series ChartType="Bar" Name="Series1" XValueMember="Category" YValueMembers="Count">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select (select count(id) from users) as Users, (select count(id) from projects) as Projects, (select count(id) from tasks) as Tasks from dual"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
