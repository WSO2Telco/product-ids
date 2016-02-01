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
var SYSTEM_REGISTRY = 'system.registry';

var ANONYMOUS_REGISTRY = 'anonymous.registry';

var SERVER_USER_MANAGER = 'server.usermanager';

var SERVER_OPTIONS = 'server.options';

var init = function (options) {
    var carbon = require('carbon'),
        server = new carbon.server.Server(options.server.https + '/admin'),
        system = new carbon.registry.Registry(server, {
            system: true,
            tenantId: carbon.server.superTenant.tenantId
        }),
        anonymous = new carbon.registry.Registry(server, {
            tenantId: carbon.server.superTenant.tenantId
        }),
        um = new carbon.user.UserManager(server, carbon.server.tenantDomain());
    application.put(SERVER, server);
    application.put(SYSTEM_REGISTRY, system);
    application.put(ANONYMOUS_REGISTRY, anonymous);
    application.put(SERVER_USER_MANAGER, um);
    application.put(SERVER_OPTIONS, options);
};

var options = function () {
    return application.get(SERVER_OPTIONS);
};

var systemRegistry = function () {
    return application.get(SYSTEM_REGISTRY);
};

var anonRegistry = function () {
    return application.get(ANONYMOUS_REGISTRY);
};

var server = function () {
    return application.get(SERVER);
};

var userManager = function () {
    return application.get(SERVER_USER_MANAGER);
};

