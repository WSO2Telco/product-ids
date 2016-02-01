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
 ******************************************************************************/include("util/constants.jag");
include("util/utility.jag");

var lg = new Log();

//var configs = require('/config.json');
var server = require('/modules/server.js');
//server.init(configs);

//var user = require('/modules/user.js');
//user.init(configs);



function init(){
	var path = "ui-components.json";
	var file = new File(path);
	file.open("r");
	var json = "";
	
	json = file.readAll();
	file.close();
	json = parse(json);
		
	var jsonArray = sortNumber(json.pages, "displayorder", true);
	json.pages = jsonArray;
	
	lg.debug(json);
	
	application.put(UI_COMPONENTS, json);
		
	var jagjsPath = "jaggery.conf";
	file = new File(jagjsPath);
	file.open("r");
	var jagJson = "";
	
	jagJson = file.readAll();
	file.close();
	jagJson = parse(jagJson);
	var serverUrl = jagJson['serverUrl'];
	
	if(serverUrl == null || serverUrl.length <= 0){
		lg.info("server url was not found under jaggery.conf file. Therefore connecting to the services same as the deployed carbon server");
	}else{
		lg.info("Connecting to	" + serverUrl);
		application.put("serverUrl", serverUrl);
	}
	
	caramel.configs({
	    context: json.context,
	    cache: true,
	    negotiation: true,
	    themer: function () {
	        //return 'theme1';
			return jagJson.themeStat;
	    }
	});

}


init();
