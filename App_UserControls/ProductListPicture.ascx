<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListPicture.ascx.cs" Inherits="ZASshop.NET.ProductListPicture" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Panel runat="server" CssClass="productList product-list-catalog test">
    <asp:Repeater ID="rProductListCatalog" runat="server" 
        OnItemCommand="rProductList_ItemCommand" 
        OnItemDataBound="rProductList_ItemDataBound" >
        <ItemTemplate>
            <asp:Panel ID="pProduktPanel" runat="server" CssClass='<%# "product" + (((Container.ItemIndex + 1) % 3 == 0) ? " mod-3" : "") + (((Container.ItemIndex + 1) % 4 == 0) ? " mod-4" : "") + (((Container.ItemIndex + 1) % 2 == 0) ? " mod-2" : "") %>'>

            <div class="inside">

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-list-image">
                            <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>" title="<%# DataBinder.Eval(Container.DataItem, "nazev") %>">
                                <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="<%# DataBinder.Eval(Container.DataItem, "nazev") %>" />
                                
                                <span class="new-badge">
                                  <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "odznaky_html") %>
                                </span>
                                <asp:PlaceHolder runat="server" visible="false">
                                <span class="<%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? "badge mod-news" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? "badge mod-action" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? "badge mod-sellout" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "badge mod-top" : "badge mod-none"))) %>">
                                    <%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? ZASutility.MyUtility.GetLangResource("ActionTypeNewsName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? "Sleva" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? ZASutility.MyUtility.GetLangResource("ActionTypeSellOutName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "TOP" : ""))) %>
                                </span>
                                <span class='badge mod-action <%# (ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph")==0 ? 0 : Math.Ceiling(100 * (Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)-Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),1)) / Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)))<1 ? "hidden" : " " %>'>Sleva
                                <%# ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph")==0 ? 0 : Math.Ceiling(100 * (Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)-Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),1)) / Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)) %> %
                                </span>
                                </asp:PlaceHolder>
                            </a>
                        </div>
                    </div>
                      <div class="col-sm-12">
                                            <h2 class="product-list-title">
                                                <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                                            </h2>
                                        </div>

                                          <div class="col-sm-12 text-container">
                                                                <p class="desc"><%# DataBinder.Eval(Container.DataItem, "zkraceny_popis") %></p>
                                                            </div>
                    <div class="col-sm-12 text-container" style="height: 30px;"><div class="product-list-availability avail" style="font-weight:bold;color:limegreen;"><%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %></div></div>

                    <div class="col-md-6">
                        <!-- productRight -->
                        <div class="productRight product-list-right">
                            <div class="priceInfo product-list-price-info">
                                <asp:PlaceHolder runat="server" Visible='<%# ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph")!=0 && Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),0)!=Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),0) %>'>
                                <span class="product-list-price-old">
                                    <del><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceOnly, ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></del> <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.CurrencyOnly, ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph").ToString(), DataBinder.Eval(Container.DataItem, "ref_cena_id_meny").ToString()) %>
                                </span>
                                </asp:PlaceHolder>
                                <span class="product-list-price price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                <asp:PlaceHolder runat="server" Visible='<%# ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph")!=0 && Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),0)!=Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),0) %>'>
                                <span class="product-list-price-old percent"
                                  data-ref_cena_s_dph='<%# Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1) %>'
                                  data-web_items_cena_s_dph='<%# Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),1) %>'>
                                    sleva <%# ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph")==0 ? 0 : Math.Ceiling(100 * (Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)-Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "web_items_cena_s_dph"),1)) / Math.Round(ZASutility.MyUtility.SafeEvalNumeric(Container.DataItem, "ref_cena_s_dph"),1)) %> %
                                </span>
                                </asp:PlaceHolder>
                                <span class="product-list-vat dph hidden"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                <asp:PlaceHolder ID="phDualPrice" runat="server" Visible="false">
                                    <span class="eura">
                                        <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, GetDualPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni").ToString())).ToString(), ZASutility.MyUtility.GetSession("id_dualni_meny")) %>
                                        <span class="dph"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                    </span>
                                </asp:PlaceHolder>
                            </div>
                        </div>
                        <!-- /productRight -->
                    </div>

                    <div class="col-md-6">
                        <div class="tools">
                            <asp:Button ID="hlCompare" runat="server" CssClass="compare" ToolTip="<%$ Resources: Resource, CompareToolTip %>" Text="<%$ Resources: Resource, Compare %>" CommandName="IntoCompare" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>' />
                            <asp:Panel ID="pAddToBasket" runat="server" CssClass="addToBasket product-list-basket">

                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-inline">
                                            <asp:TextBox ID="tbQuantity" runat="server" Text="1" MaxLength="5" cssClass="form-control input-sm hidden" />
                                            <zas:IntoBasketButton ID="btIntoBasket" runat="server" CssClass="button btn btn-basic btn-sm" CommandName="IntoBasket" ToolTip="<%$ Resources: Resource, BasketAfterInsertTitle %>" Text="DO KOŠÍKU"
                                              TbQuantityId="tbQuantity"
                                              Atribut1Id="" Atribut2Id="" Atribut3Id=""
                                              Atribut1IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' Atribut2IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' Atribut3IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>'
                                              Atribut1Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_1_pracovat") %>' Atribut2Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_2_pracovat") %>' Atribut3Prac='<%# DataBinder.Eval(Container.DataItem, "atribut_3_pracovat") %>'
                                              Atribut1Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_1_cis") %>' Atribut2Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_2_cis") %>' Atribut3Cis='<%# DataBinder.Eval(Container.DataItem, "atribut_3_cis") %>'
                                              Atribut1Req='<%# DataBinder.Eval(Container.DataItem, "atribut_1_povinnost") %>' Atribut2Req='<%# DataBinder.Eval(Container.DataItem, "atribut_2_povinnost") %>' Atribut3Req='<%# DataBinder.Eval(Container.DataItem, "atribut_3_povinnost") %>'
                                              AtributRozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>'
                                              IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                              CisloNomen='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'
                                              TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                              Nazev='<%# DataBinder.Eval(Container.DataItem, "nazev") %>'
                                              IdMj='<%# DataBinder.Eval(Container.DataItem, "id_mj") %>'
                                              Mj='<%# DataBinder.Eval(Container.DataItem, "mj") %>'
                                              Cena='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena")) %>'
                                              Dph='<%# DataBinder.Eval(Container.DataItem, "dph_anone").ToString()=="1" ? true : false %>'
                                              CenaMistni='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni")) %>'
                                              IdMeny='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>'
                                              SazbaDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "sazba_dph")) %>'
                                              KoeficientDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "koeficient")) %>'
                                              ZasobaCelkem='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zasoba_celkem")) %>' />  
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>



            </div>

            </asp:Panel><!-- .product -->


             <!-- clearovaci div pro resp. design -->
                        <asp:Panel runat="server" ID="clearDiv_3" CssClass="clearfix hr-line hidden-xs hidden-sm visible-md-block visible-lg-block" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 3 == 0) %>' />
                        <asp:Panel runat="server" ID="clearDiv_4" CssClass="clearfix hr-line hidden-xs visible-sm-block hidden-md hidden-lg" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 2 == 0) %>' />
                        <asp:Panel runat="server" ID="clearDiv_4Home" CssClass="clearfix hr-line hidden-xs hidden-sm visible-md-block visible-lg-block visible-Homepage item" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 4 == 0) %>' />
                        <!-- clearovaci div pro resp. design -->


        </ItemTemplate>
    </asp:Repeater>

    <asp:Panel ID="AfterInsertIntoBasketAction_Panel" runat="server" visible="false">
        <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control hidden" />
        <asp:ModalPopupExtender ID="AfterInsertIntoBasketAction_mpe" runat="server"
            TargetControlID="FakeBtnAction" PopupControlID="AfterInsertIntoBasketAction"
            DropShadow="true" BackgroundCssClass="modal" CancelControlID="hlAfterBack" />
        <asp:Panel ID="AfterInsertIntoBasketAction" runat="server" CssClass="modal-popup">
            <!-- pageDesc -->
            <div class="pageDesc modal-desc">
                <div class="modal-title"><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertTitle %>"></asp:Literal></div>
                <asp:Panel ID="pDescription" runat="server" cssClass="cartPopupDesc">
                    <p><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc1 %>" /></p>
                    <p><strong><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc2 %>" /></strong></p>
                </asp:Panel>
            </div>
            <!-- /pageDesc -->

			<!-- cartButtons -->
			<div class="cartButtons modal-buttons" data-url='<%: Request.RawUrl %>'>
                <a href='<%: Request.RawUrl %>'   class="button btn btn-sm btn-default"><%: ZASutility.MyUtility.GetLangResource("BasketAfterActionBack") %></a>
                <asp:HyperLink ID="hlAfterBack"   CssClass="button btn btn-sm btn-default hide-control" runat="server" Text="<%$ Resources: Resource, BasketAfterActionBack %>" />
                <asp:HyperLink ID="hlAfterBasket" CssClass="button btn btn-sm btn-default" runat="server" NavigateUrl="~/kosik" Text="<%$ Resources: Resource, BasketAfterActionBasket %>" />
                <asp:HyperLink ID="hlAfterOrder"  CssClass="button btn btn-sm btn-basic"   runat="server" NavigateUrl="~/objednavka" Text="<%$ Resources: Resource, BasketAfterActionOrder %>" />
			</div>
			<!-- /cartButtons -->
        </asp:Panel>
    </asp:Panel>



    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="15" Columns="50" Enabled="false" ReadOnly="true" Visible="false"></asp:TextBox>
</asp:Panel>