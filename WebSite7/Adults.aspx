﻿<%@ Page Title="Adults" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Adults.aspx.cs" Inherits="Adults" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Adults</h1>
                <br />
                <h2>(ages 18 & Up)</h2>                
            </hgroup>
            <p>
                Info on page
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
<h2>Jobs:</h2>

    <script language="JavaScript">

        var Connect = new XMLHttpRequest();
        Connect.open("GET", "/scrapeddata.xml", false);
        Connect.send(null);
        var TheDocument = Connect.responseXML;
        var Root = TheDocument.childNodes[0];

        document.write(" <ol class='round'>")
        for (var i = 0; i < Root.children.length; i++) {

            var Job = Root.children[i];
            // Access each of the data values.
            var Name = Job.getElementsByTagName("name");
            var summary = Job.getElementsByTagName("summary");
            var ntnlsupplydemand = Job.getElementsByTagName("ntnl_supply_demand");
            var edureq = Job.getElementsByTagName("edu_req");

            document.write("<li class='zero'>");
            document.write("<h3>" + Name[0].textContent.toString() + "</h3>");
            document.write(summary[0].textContent.toString());
            document.write("<br/>");
            document.write(ntnlsupplydemand[0].textContent.toString());
            document.write("<br/>");
            document.write(edureq[0].textContent.toString());
            document.write("</li>");
        }
        document.write("</ol>");
</script>
</asp:Content>
