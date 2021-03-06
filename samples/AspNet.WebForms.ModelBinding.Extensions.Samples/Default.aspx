﻿<%@ Page Title="Home Page" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AspNet.WebForms.ModelBinding.Extensions.Samples._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2>Categories</h2>

    <asp:ListView runat="server" ID="productsList"
        ItemType="AspNet.WebForms.ModelBinding.Extensions.Samples.Model.Category" DataKeyNames="ID"
        SelectMethod="GetCategoriesAsync"
        DeleteMethod="DeleteCategoryAsync">
        <LayoutTemplate>
            <table>
                <thead>
                    <tr>
                        <th><asp:LinkButton runat="server" CommandName="Sort" CommandArgument="ID">ID</asp:LinkButton></th>
                        <th><asp:LinkButton runat="server" CommandName="Sort" CommandArgument="Name">Name</asp:LinkButton></th>
                        <th>Products</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="3">
                            <asp:DataPager runat="server" PageSize="5" QueryStringField="page">
                                <Fields><asp:NumericPagerField /></Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </tfoot>
                <tbody>
                    <tr runat="server" id="itemPlaceholder"></tr>
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%#: Item.ID %></td>
                <td><%#: Item.Name %></td>
                <td><asp:HyperLink runat="server" NavigateUrl='<%#: ResolveUrl("~/Products.aspx?categoryId=" + Item.ID) %>'><%#: Item.Products.Count %></asp:HyperLink></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
