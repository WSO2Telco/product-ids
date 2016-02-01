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
 ******************************************************************************/var getDashboardLayout, setDashboardLayout;

(function() {

	// *** private const ***
	var USER_REGISTRY_KEY = 'server.user.registry';
	var CARBON = require('carbon');

	// *** private functions ***

	var getRegistry = function(userName) {
		var cachedReg = session.get(USER_REGISTRY_KEY);
		if (!cachedReg) {
			//print('new');
			var server = new CARBON.server.Server(null);
			var newReg = new CARBON.registry.Registry(server, {
				username : userName,
				tenantId : CARBON.server.tenantId()
			});
			session.put(USER_REGISTRY_KEY, newReg);
			return newReg;
		} else {
			return cachedReg;
		}
	};

	var registryPath = function(dashboardName, userName) {
		return '/_system/governance/users/' + userName + '/' + dashboardName + '/layout.json';
	};

	// *** public functions ***

	getDashboardLayout = function(dashboardName, userName) {

		var registry = getRegistry(userName);

		var dashboardName = registry.get(registryPath(dashboardName, userName));
		if(dashboardName){
			return dashboardName.content;
		} 
		return false;

	};

	setDashboardLayout = function(dashboardName, userName, layout) {
		var registry = getRegistry(userName);
		
		new Log().debug(registry);

		registry.put(registryPath(dashboardName, userName), {
			content : layout,
			mediaType : 'application/json'
		});
		return true;
	};

})();
