<%@ Page Title="LSCorp - Top Performer" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="~/top-performer.aspx.cs" Inherits="LSCorp.top_performer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server" class="flex flex-col items-center container h-screen p-6 bg-white shadow-lg rounded-lg">
        <div>


            <h2 class="text-xl font-semibold mb-4">Top Performer in Each Project</h2>

            <!-- Project Dropdown -->
            <div class="flex-col items-center justify-center">
                <label class="block text-sm font-medium">Select Project:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;NAME&quot; FROM &quot;PROJECTS&quot;"></asp:SqlDataSource>
        </div>

        <!-- Grid View -->
        <div class="w-full max-h-[350px] overflow-x-auto overflow-y-auto mt-4">
            <asp:GridView ID="GridView1" runat="server" CssClass="w-full border border-gray-300 rounded-lg bg-white shadow text-center">
                <RowStyle CssClass="bg-gray-100 hover:bg-gray-200 p-4" />
            </asp:GridView>
        </div>
    </form>
</asp:Content>
