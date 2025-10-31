<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailDiscussion.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailDiscussion" EnableViewState="true" ViewStateMode="Enabled" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<!-- tabContent -->
<div class="tabContent">
    <h3>
        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, TabProductDetailDiscFull %>" />
        <zas:ZasLiteral ID="zLiteral1" runat="server" XmlPath="nazev"></zas:ZasLiteral>
    </h3>
    <p><asp:Literal ID="lDiscDesc" runat="server"></asp:Literal></p>
    <p><asp:LinkButton ID="lbDiscNew" runat="server" CssClass="new-item" OnClick="lbDiscNew_Click" /></p>

    <zas:ZasRepeaterForRating ID="rProductDetailDiscussion" runat="server" ViewStateMode="Enabled"
        OnItemCommand="rProductDetailDiscussion_ItemCommand"
        OnItemDataBound="rProductDetailDiscussion_ItemDataBound"
        CssClassRoot="comment single-comment darkgray" CssClassChild="comment single-comment lightgray" CssClassNewItem="comment form"
        ItemPadding="15" ContentPanelID="pDiscussion" EnableViewState="true">
        <ItemTemplate>
            <!-- comment -->
            <asp:Panel ID="pDiscussion" runat="server">
                <asp:Panel ID="pDiscussionView" runat="server">
                    <h4><%# DataBinder.Eval(Container.DataItem, "nadpis") %> <div class="date"><%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "datum")).ToLongDateString() %> - <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "datum")).ToShortTimeString() %></div></h4>
                    <div class="name"><%# DataBinder.Eval(Container.DataItem, "uzivatel") %></div>
                    <div class="rating">
                        <%# DataBinder.Eval(Container.DataItem, "web_items_hodnoceni") %>
                    </div>
                    <hr />

                    <p><%# DataBinder.Eval(Container.DataItem, "prizpevek") %></p>
                    <asp:LinkButton ID="lbAnswer" runat="server" CssClass="answer btn btn-basic btn-xs" Text="<%$ Resources: Resource, BtnAnswer %>" CommandName="answer" EnableViewState="true" ViewStateMode="Enabled" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "zarazeni") + "^||^" + DataBinder.Eval(Container.DataItem, "nadpis") %>' />
                </asp:Panel>
                <asp:Panel ID="pDiscussionEdit" runat="server" Visible="false">
                    <fieldset>
                        <asp:TextBox ID="prispevek_nadpis" runat="server" CssClass="title form-control" Text='<%# DataBinder.Eval(Container.DataItem, "nadpis") %>' ValidationGroup="save-discussion" />
                        <asp:TextBoxWatermarkExtender ID="tbweNadpis" runat="server"
                            TargetControlID="prispevek_nadpis" WatermarkCssClass="watermarked form-control"
                            WatermarkText="<%$ Resources: Resource, DiscussionSubjectDesc %>" />
                        <asp:RequiredFieldValidator ID="rfv_Nadpis" runat="server"
                            ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-discussion"
                            ControlToValidate="prispevek_nadpis" SetFocusOnError="true"
                            Display="Dynamic" CssClass="reguired-field-mess" />

                        <div class="date"><%# DateTime.Now.ToLongDateString() %> - <%# DateTime.Now.ToShortTimeString() %></div>
                        <asp:TextBox ID="prispevek_uzivatel" runat="server" CssClass="name form-control" Text='<%# DataBinder.Eval(Container.DataItem, "uzivatel") %>' ValidationGroup="save-discussion" />
                        <asp:TextBoxWatermarkExtender ID="tbweUzivatel" runat="server"
                            TargetControlID="prispevek_uzivatel" WatermarkCssClass="watermarked form-control"
                            WatermarkText="<%$ Resources: Resource, DiscussionUserDesc %>" />
                        <asp:RequiredFieldValidator ID="rfv_Uzivatel" runat="server"
                            ErrorMessage="<%$ Resources: Resource, RequiredField %>" ValidationGroup="save-discussion"
                            ControlToValidate="prispevek_uzivatel" SetFocusOnError="true"
                            Display="Dynamic" CssClass="reguired-field-mess" />

                        <asp:HiddenField ID="prispevek_email"       runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "e_mail") %>' />
                        <asp:HiddenField ID="prispevek_zarazeni"    runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "zarazeni") %>' />
                        <asp:HiddenField ID="prispevek_id_nomen"    runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>' />

                        <div class="rating" date-star="5">
                            <asp:HiddenField ID="prispevek_hodnoceni" runat="server" Value="0" />

                        </div>
                        <asp:TextBox ID="prispevek_txt" runat="server" Columns="40" Rows="10" TextMode="MultiLine" CssClass="form-control" />
                        <asp:TextBoxWatermarkExtender ID="tbweTxt" runat="server"
                            TargetControlID="prispevek_txt" WatermarkCssClass="watermarked form-control"
                            WatermarkText="<%$ Resources: Resource, DiscussionTxtDesc %>" />
                        <asp:Button ID="btnStorno" runat="server" Text="<%$ Resources: Resource, BtnStorno %>" CommandName="storno" CssClass="btn btn-default" />
                        <asp:Button ID="btnSaveDisc" runat="server" Text="<%$ Resources: Resource, BtnSaveDisc %>" CommandName="save" ValidationGroup="save-discussion" CssClass="btn btn-basic" />
                    </fieldset>
                </asp:Panel>
            </asp:Panel>
            <!-- /comment -->
        </ItemTemplate>
    </zas:ZasRepeaterForRating>
</div>
<!-- /tabContent -->
</asp:Panel>