/*******************************************************************************
 * Copyright  (c) 2015-2016, WSO2.Telco Inc. (http://www.wso2telco.com) All Rights Reserved.
 * 
 * WSO2.Telco Inc. licences this file to you under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
var host;

var testGadgets = [];

$(function () {
    //initializing the common container
    CommonContainer.init();
    host = resolveHost();
    // TODO: we need to integrate the REST api get the following gadgets, in milestone 2
    testGadgets = [host + '/portal/gadgets/co2-emission/co2-emission.xml', host + '/portal/gadgets/agricultural-land/agricultural-land.xml', host + '/portal/gadgets/electric-power/electric-power.xml', host + '/portal/gadgets/energy-use/energy-use.xml', host + '/portal/gadgets/greenhouse-gas/greenhouse-gas.xml'];
    drawGadgets();
});

var drawGadgets = function () {
    CommonContainer.preloadGadgets(testGadgets, function (result) {
        for (var gadgetURL in result) {
            if (!result[gadgetURL].error) {
                buildGadget(result, gadgetURL);
                curId++;
            }
        }
    });
};

var gadgetTemplate = '<div class="portlet">' +
    '<div class="portlet-header"></div>' +
    '<div id="gadget-site" class="portlet-content"></div>' +
    '</div>';

var buildGadget = function (result, gadgetURL) {
    result = result || {};
    var element = getNewGadgetElement(result, gadgetURL);
    $(element).data('gadgetSite', CommonContainer.renderGadget(gadgetURL, curId));

    //determine which button was click and handle the appropriate event.
    $('.portlet-header .ui-icon').click(function () {
        handleNavigateAction($(this).closest('.portlet'), $(this).closest('.portlet').find('.portlet-content').data('gadgetSite'), gadgetURL, this.id);
    });
};

var getNewGadgetElement = function (result, gadgetURL) {
    result[gadgetURL] = result[gadgetURL] || {};

    var newGadgetSite = gadgetTemplate;
    newGadgetSite = newGadgetSite.replace(/(gadget-site)/g, '$1-' + curId);

    $(newGadgetSite).appendTo($('#gadgetArea-' + curId));
    
    var gadgetHeader = '<div class="gadget-header"> \
								<a href="#"><i class="icon-cog icon-large"></i></a> \
						</div>';
	$('#gadgetArea-' + curId).parents('li').prepend(gadgetHeader);
	
    return $('#gadget-site-' + curId).get([0]);
}

var resolveHost = function () {
    //http://<domain>:<port>/
    return document.location.protocol + "//" + document.location.host;

}



