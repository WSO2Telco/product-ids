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
 ******************************************************************************/(function () {

    /**
     * @return {boolean} always true.
     */
    var TRUE_FUNC = function () {
        return true;
    };

    var containerConfig = {};
    containerConfig[osapi.container.ContainerConfig.RENDER_DEBUG] = '1';

    var gadgetInfoMap = {};
    UESContainer = new osapi.container.Container(containerConfig);

    UESContainer.managedHub = new OpenAjax.hub.ManagedHub({
        onSubscribe: TRUE_FUNC,
        onUnsubscribe: TRUE_FUNC,
        onPublish: TRUE_FUNC
    });
    gadgets.pubsub2router.init({
        hub: UESContainer.managedHub
    });

    UESContainer.getGadgetInfo = function (elId) {
        return gadgetInfoMap[elId];
    };

    UESContainer.renderGadget = function (elId, url, opt, callback) {
        var params = {};
        params[osapi.container.RenderParam.WIDTH] = '100%';
        params[osapi.container.RenderParam.HEIGHT] = '100%';
        params[osapi.container.RenderParam.USER_PREFS] = opt && opt.prefs;
        params[osapi.container.RenderParam.VIEW] = opt && opt.view || 'default';
        var gadgetInfo = gadgetInfoMap[elId];
        if (!gadgetInfo) {
            gadgetInfo = {};
            gadgetInfo.site = UESContainer.newGadgetSite(document.getElementById(elId));
            gadgetInfoMap[elId] = gadgetInfo;
        }
        gadgetInfo.opt = opt || {};
        UESContainer.navigateGadget(gadgetInfo.site, url, {}, params, function (r) {
            gadgetInfo.meta = r;
            callback && callback(gadgetInfo);
        });
    };

    UESContainer.removeGadget = function (elId) {
        var gadgetInfo = gadgetInfoMap[elId];
        if (gadgetInfo) {
            UESContainer.closeGadget(gadgetInfo.site);
            delete gadgetInfoMap[elId];
        }
    };

    UESContainer.redrawGadget = function (elId, opt) {
        var gadgetInfo = gadgetInfoMap[elId];
        if (gadgetInfo && (!opt || !opt.view || gadgetInfo.meta.views[opt.view])) {
            for (var optName in opt){
                gadgetInfo.opt[optName] = opt[optName];
            }
            UESContainer.renderGadget(elId, gadgetInfo.meta.url, gadgetInfo.opt);
        }
    };

    UESContainer.maximizeGadget = function (elId) {
        UESContainer.redrawGadget(elId, {view: "home"});
    };

    UESContainer.restoreGadget = function (elId) {
        UESContainer.redrawGadget(elId, {view: "default"});
    };

    $(function () {
        try {
            // Connect to the ManagedHub
            UESContainer.inlineClient = new OpenAjax.hub.InlineContainer(UESContainer.managedHub, 'container',
                {
                    Container: {
                        onSecurityAlert: function (source, alertType) { /* Handle client-side security alerts */
                        },
                        onConnect: function (container) {/* Called when client connects */
                        },
                        onDisconnect: function (container) { /* Called when client connects */
                        }
                    }
                });
            //connect to the inline client
            UESContainer.inlineClient.connect();

        } catch (e) {
            console && console.error(e.message);
        }
    });
})();



