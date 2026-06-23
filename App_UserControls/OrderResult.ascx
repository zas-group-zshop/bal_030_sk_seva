<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderResult.ascx.cs" Inherits="ZASshop.NET.App_UserControls.OrderResult" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
                    <script type="text/javascript">
                        try {
                            localStorage.removeItem("discountCode");
                            localStorage.removeItem("discount");
                            localStorage.removeItem("discount-code");
                        } catch (e) { }
                    </script>
                    <div class="RegForm">
                    <!-- pageDesc -->
                    <div class="pageDesc page-description">
                        <h1><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, PageResultPageOrderTitle %>" /></h1>

                        <asp:Panel ID="pDescription" runat="server" CssClass="page-description-text">
                            <p>
                                <asp:Literal ID="lStav" runat="server" Text="<%$ Resources: Resource, PageResultPageOrderTitleDesc %>" />
                                <asp:HyperLink ID="hpStav" runat="server" Text="<%$ Resources: Resource, AddressDescriptionAddressUrlTitle %>" />
                            </p>
                            <asp:Panel ID="pHttpCall" runat="server" />

                            <asp:Panel ID="pGoPayRedirect" runat="server" />
                        </asp:Panel>

                    </div>
                    <!-- /pageDesc -->

                    <asp:Panel ID="pErrorMessage" runat="server" CssClass="pageCustomError" Visible="false" />
                </div>
</asp:Panel>