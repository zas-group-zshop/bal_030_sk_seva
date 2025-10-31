<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressDetail.ascx.cs" Inherits="ZASshop.NET.App_UserControls.AddressDetail" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Panel runat="server" CssClass="single-address-form">

<script type="text/javascript">

var smartform = smartform || {};
  
  smartform.beforeInit = function () {
    smartform.setClientId('PyaCN8DuCX');    
  }

          $(document).ready(function () {
                    setTimeout(function() {
                        $(".form-change-country").each(function(i, item) {
                            $( this ).trigger("change");
                        });
                    }, 1000);

                     $(".address-edit").each(function(i, item) {
                                                $( item ).attr("data-number", i+1);
                     });

                     $(".new-address").attr("data-number", 0);


                });


                /** Ve formulari 'smartform-instace-2' nastavi naseptavanou zemi podle hodnoty v combu #country. */
                function changeCountry(state) {                    
                    var country = state;                    
                    if (country === 'CZ' || country === 'SK'){
                        smartform.getInstance('smartform-instance-invoice-0').addressControl.setCountry(country);
                    }

                    if (country != 'SK' && country != 'PL')
                        $("[data-is_dph]").hide();
                    else
                        $("[data-is_dph]").show();

                    /**CheckAres(poradi);*/
                }

        function validateIC(e, evt) {

          var selector_id = $(e).parents(".address-edit, .new-address").attr("data-number");
          var selector = $('[data-number="'+ selector_id +'"]');
          var stat = selector.find("[data-attr-stat]").val();

          if(stat === "CZ" || stat === "SK") {
              var theEvent = evt || window.event;              
              var key = theEvent.keyCode || theEvent.which;
              key = String.fromCharCode( key );
              var regex = /[0-9]|\./;
              if( !regex.test(key) ) {
                theEvent.returnValue = false;
                if(theEvent.preventDefault) theEvent.preventDefault();
              }
          }

        }

        function validateDIC(e, evt) {

            var valdic = $(e).val();
            var selector_id = $(e).parents(".address-edit, .new-address").attr("data-number");
            var selector = $('[data-number="'+ selector_id +'"]');

            var stat = selector.find("[data-attr-stat]").val();

            if(valdic.length >= 2 && valdic.toLowerCase().indexOf("cz") >= 0 || valdic.length >= 2 && valdic.toLowerCase().indexOf("sk") >= 0 ) {

                if( stat === "CZ" || stat === "SK") {
                                      var theEvent = evt || window.event;
                                      var key = theEvent.keyCode || theEvent.which;
                                      key = String.fromCharCode( key );
                                      var regex = /[0-9]|\./;
                                      if( !regex.test(key) ) {
                                        theEvent.returnValue = false;
                                        if(theEvent.preventDefault) theEvent.preventDefault();
                                      }
                                  }

            }
        }

         function validateFormatDIC(val) {

                   var selector_id = $(val).parents(".address-edit, .new-address").attr("data-number");
                   var selector = $('[data-number="'+ selector_id +'"]');
                   var stat = selector.find("[data-attr-stat]").val();

                   var dic = $(val).val();

                   if(stat === "CZ" && dic != "") {


                   var num = dic.substr(2);

                    if(dic.toLowerCase().indexOf("cz") >= 0) {

                         if (num.match(/^\d+$/)) {

                            selector.find("[data-attr-dic-help]").html("");
                            selector.find("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");

                         } else {

                             selector.find("[data-attr-dic-help]").html('<%# ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                             selector.find("[data-attr-dic-help]").parent(".formRow").addClass("form-error");

                         }

                    } else {
                        selector.find("[data-attr-dic-help]").html('<%# ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                        selector.find("[data-attr-dic-help]").parent(".formRow").addClass("form-error");
                    }
                    } else if(stat === "SK" && dic != "") {
                        var num = dic.substr(2);

                        if(dic.toLowerCase().indexOf("sk") >= 0) {

                            if (num.match(/^\d+$/)) {

                                selector.find("[data-attr-dic-help]").html("");
                                selector.find("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");

                            } else {

                                selector.find("[data-attr-dic-help]").html('<%# ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                                selector.find("[data-attr-dic-help]").parent(".formRow").addClass("form-error");

                            }

                        } else {
                            selector.find("[data-attr-dic-help]").html('<%# ZASutility.MyUtility.GetLangResource("DICvalidationFormat") %>');
                            selector.find("[data-attr-dic-help]").parent(".formRow").addClass("form-error");
                        }
                   } else {

                         selector.find("[data-attr-dic-help]").html("");
                         selector.find("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");
                   }

                }

        function SearchCompanyAres( set ) {

            var ic = $(set).val();
            var selector_id = $(set).parents(".address-edit, .new-address").attr("data-number");
            var selector = $('[data-number="'+ selector_id +'"]');
            var stat = selector.find("[data-attr-stat]").val();

            if( stat === "CZ" && ic != "" ) {

                     selector.find("[data-attr-ic-help]").show();
                     selector.find("[data-attr-ic-help]").html('<%# ZASutility.MyUtility.GetLangResource("ARESsearching") %>'+' <span class="loader"></span>');

                     $.ares(ic, {
                        notfound: function() {

                            selector.find("[data-attr-ic-help]").html('<%# ZASutility.MyUtility.GetLangResource("ICwasNotFounded") %>');
                                                  },
                         finished: function(object) {

                          selector.find("[data-attr-dic]").val(object.vatNumber);
                          selector.find("[data-attr-name]").val(object.name);
                          selector.find("[data-attr-street]").val(object.street);
                          selector.find("[data-attr-cp]").val(object.cp);
                          selector.find("[data-attr-city]").val(object.cityPart);
                          selector.find("[data-attr-postal]").val(object.postalCode);
                          selector.find("[data-attr-ic-help]").html("IČ je v pořádku");
                          selector.find("[data-attr-ic-help] .loader").hide();
                          selector.find("[data-attr-dic]").trigger("change");

                          }
                        });
            }
        }


        function CheckAres(poradi) {

                 var selector = $('[data-number="'+poradi+'"]');

                 var stat = selector.find("[data-attr-stat]").val();

                      if(stat === "CZ" || stat === "SK") {
                              selector.find("[data-attr-ic-help]").show();
                              selector.find("[data-attr-dic-help]").show();
                              selector.find("[data-attr-ic]").trigger("change");
                              selector.find("[data-attr-dic]").trigger("change");
                      } else {
                              selector.find("[data-attr-ic-help]").hide();
                              selector.find("[data-attr-dic-help]").hide();
                              selector.find("[data-attr-dic-help]").parent(".formRow").removeClass("form-error");
                      }

        }

        $(document).ready(CheckAres);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(CheckAres);

    </script>

        <asp:HiddenField ID="adresa_poradi" runat="server" />
        <asp:HiddenField ID="adresa_typ" runat="server" />

		<!-- orderBox -->
		<asp:Panel ID="pAddressesHeader" runat="server" CssClass="orderBox boxHeader" Visible="false">
			<p>
                <asp:Literal ID="lAddressDescription" runat="server" />
            </p>
		</asp:Panel>
		<!-- /orderBox -->
        
        <!-- newAddressBox -->
        <div class="newAddressBox" data-validate-registration>
            <div class="row">
                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lFirstName" runat="server" Text="<%$ Resources: Resource, AddressFirstName %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lFirstNameReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_jmeno" runat="server" DetailMode="Insert" AutoCompleteType="FirstName" CssClass="form-control" data-required="true" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lSurName" runat="server" Text="<%$ Resources: Resource, AddressSurName %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lSurNameReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_prijmeni" runat="server" DetailMode="Insert" AutoCompleteType="LastName" CssClass="form-control" data-required="true" />
                    </div>
                </div>
            </div>
    
            <div class="row" style="border:1px solid lightgray;margin:10px 0px 10px 0px;padding-bottom: 15px;">
                <legend style="font-size: 14px;font-weight: bold;padding: 5px 0px 5px 5px;margin-bottom: 0px;border-bottom: 0px;font-style: italic;">Firemní údaje</legend>

                <div class="col-sm-4">
                    <asp:Panel ID="pCompanyNameIC" runat="server" CssClass="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lCompanyNameIC" runat="server" Text="<%$ Resources: Resource, AddressCompanyIC %>" ></asp:Label>
                        </span>
                        <zas:ZasTextBox ID="adresa_firma_ic" data-attr-ic onchange="SearchCompanyAres(this);" onkeypress="validateIC(this, event);" runat="server" DoZasDataBind="true" Type="PositiveWholeNumber" style="text-align:left;" DetailMode="Insert" CssClass="form-control" />
                        <small data-attr-ic-help class="text-muted" style="display: none">
                              <%# ZASutility.MyUtility.GetLangResource("ARESinfo") %>
                        </small>
                    </asp:Panel>

                </div>

                <div class="col-sm-4">
                                                <div class="formRow">
                                                    <span class="formLabel form-label">
                                                        <asp:Label ID="lCompanyName" runat="server" Text="<%$ Resources: Resource, AddressCompanyName %>"></asp:Label>
                                                    </span>
                                                    <zas:ZasTextBox ID="adresa_nazev" data-attr-name runat="server" DetailMode="Insert" AutoCompleteType="Company" CssClass="form-control" />
                                                </div>
                </div>

                <div class="col-sm-4">
                    <asp:Panel ID="pCompanyNameDIC" runat="server" CssClass="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lCompanyNameDIC" runat="server" Text="<%$ Resources: Resource, AddressCompanyDIC %>"></asp:Label>
                        </span>
                        <zas:ZasTextBox ID="adresa_firma_dic" onkeypress="validateDIC(this, event);" onchange="validateFormatDIC(this);" data-attr-dic runat="server" DetailMode="Insert" CssClass="form-control" />
                        <span data-attr-dic-help class="form-error-span"></span>
                    </asp:Panel>
                </div>
                <div class="col-sm-4">
                    <asp:Panel ID="IcDPH" CssClass="formRow" data-is_dph runat="server">
                        <asp:Label ID="lCompanyNameIcDph" runat="server" Text="<%$ Resources: Resource, CompanyIcDPH %>" CssClass="formLabel form-label"></asp:Label>
                        <zas:ZasTextBox ID="adresa_firma_ic_dph" runat="server" DetailMode="Insert" CssClass="form-control" />
                    </asp:Panel>
                </div>
            </div>
    

            <div class="row">

                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lStreet" runat="server" Text="<%$ Resources: Resource, AddressStreet %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lStreetReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_ulice" data-attr-street runat="server" DetailMode="Insert" data-required="true" AutoCompleteType="BusinessStreetAddress" class="smartform-instance-#ADR_TYP#-#ADR_PORADI# smartform-address-street smartform-street form-control" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lStreetNumber" runat="server" Text="<%$ Resources: Resource, AddressStreetNumber %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lStreetNumberReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_cislo_popisne" data-attr-cp runat="server" DetailMode="Insert" data-required="true" class="smartform-instance-#ADR_TYP#-#ADR_PORADI# smartform-address-number smartform-number form-control" />
                    </div>
                </div>
                <div class="col-sm-4">
                    
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lCity" runat="server" Text="<%$ Resources: Resource, AddressCity %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lCityReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_mesto" data-attr-city runat="server" DetailMode="Insert" data-required="true" AutoCompleteType="BusinessCity" class="smartform-instance-#ADR_TYP#-#ADR_PORADI# smartform-address-city smartform-city form-control" />
                    </div>
                    
                </div>
            </div>


            <asp:Panel ID="addressPanel" runat="server" CssClass="row">

                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lZipCode" runat="server" Text="<%$ Resources: Resource, AddressZipCode %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lZipCodeReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <zas:ZasTextBox ID="adresa_psc" data-attr-postal runat="server" DoZasDataBind="true" Type="Numeric" style="text-align:left;" data-xxx="xxx" DetailMode="Insert" data-required="true" AutoCompleteType="BusinessZipCode" class="smartform-instance-#ADR_TYP#-#ADR_PORADI# smartform-address-zip smartform-zip form-control" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="formRow">
                        <span class="formLabel form-label state">
                            <asp:Label ID="lState" runat="server" Text="<%$ Resources: Resource, AddressState %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="lStateReq" runat="server" Text="*" Font-Bold="true" />
                        </span>
                        <asp:DropDownList ID="adresa_stat" data-attr-stat runat="server" CssClass="form-change-country form-control" onchange="changeCountry(this.value)" />
                    </div>
                </div>

                <div class="col-sm-4">
                    <asp:Panel runat="server" ID="StateState" CssClass="formRow state-state">
                        <label class="formLabel form-label state-state">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources: Resource, StateState %>" Font-Bold="true"></asp:Label>
                            <asp:Label ID="Label6" runat="server" Text="*" Font-Bold="true" />
                        </label>
                        <zas:ZasDropDownList ID="uz_jednotka" runat="server" style="margin-top:-5px;"
                            EnableViewState="false" ViewStateMode="Disabled" DetailMode="Edit"
                            InitialValue="" Enabled="true"
                            data-select-value='kod'
                            data-select-result-row-text='kod,nazev'
                            data-select-result-row-value='nazev'
                            data-count='20'
                            data-free='false'
                            data-height='300' data-clear="true"
                            data-command='GET_UZ_JEDNOTKY_FT'
                            data-parameters='{"par":"strcis"}'
                            data-dynamic-parameters='<%# "{\"stat\":\""+adresa_stat.ClientID+"\"}" %>'
                            data-query-min-length='0'
                            data-result-names='items,item'
                            CssClass="form-control-in-panel form-control select-combobox" Width="100%"/>
                        <!-- Na plnenych udajich musi byt EnableViewState="false" ViewStateMode="Disabled", jinak to nefunguje dobre. -->
                    </asp:Panel>
                </div>
            </asp:Panel>
            
            <div class="row">
                <div class="col-sm-6 col-md-4">
                    <asp:Panel ID="pMobil" runat="server" CssClass="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lMobil" runat="server" Text="<%$ Resources: Resource, AddressMobil %>"></asp:Label>
                            <asp:Label ID="lMobilReq" runat="server" Text="*" Font-Bold="true" Visible="false"/>
                        </span>
                        <asp:TextBox ID="adresa_mobil_preset" runat="server" MaxLength="4" CssClass="form-phone-preset form-control" />
                        <zas:ZasTextBox ID="adresa_mobil" runat="server" DetailMode="Insert" Type="PhoneNumber" DoZasDataBind="true" CssClass="form-phone-input form-control" AutoCompleteType="Cellular" />
                    </asp:Panel>
                </div>
                <div class="col-sm-6 col-md-4">
                    <asp:Panel ID="pPhone" runat="server" CssClass="formRow">
                        <span class="formLabel form-label">
                            <asp:Label ID="lPhone" runat="server" Text="<%$ Resources: Resource, AddressPhone %>"></asp:Label>
                            <asp:Label ID="lPhoneReq" runat="server" Text="*" Font-Bold="true" Visible="false" />
                        </span>
                        <asp:TextBox ID="adresa_telefon_preset" runat="server" MaxLength="4" CssClass="form-phone-preset form-control" />
                        <zas:ZasTextBox ID="adresa_telefon" runat="server" DetailMode="Insert" Type="PhoneNumber" DoZasDataBind="true" CssClass="form-phone-input form-control" />
                    </asp:Panel>
                </div>
            </div>
    
        </div>
        <!-- /newAddressBox -->
        
        <!-- popupButtons -->
		<div class="popupButtons">
			<asp:Button ID="btnSave" runat="server" Text="<%$ Resources: Resource, AddressSave %>" OnClick="btnSave_Click" CssClass="btn btn-basic btn-default" send_data_validate />
			<!-- <asp:Button ID="btnStorno" runat="server" Text="<%$ Resources: Resource, Storno %>" CssClass="gray " /> -->
            <asp:PlaceHolder runat="server" ID="phAddressStorno" Visible='<%# !FirstAddress %>' >
                <input type="button" class="gray address-edit-storno btn btn-default btn-normal" value="Storno">
            </asp:PlaceHolder>
		</div>
		<!-- /popupButtons -->

</asp:Panel>