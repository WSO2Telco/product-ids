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
 ******************************************************************************/    console.log(json);
    var output = "";
    var body = "    <div class=\"col-lg-12 content-section\">\n" +
        "        <input type=\"hidden\" name=\"appName\" value=\"\" />\n" +
        "        <table class=\"table table-bordered\">\n" +
        "            <thead>\n" +
        "                <tr>\n" +
        "                    <th>Authorized Applications</th>\n" +
        "                    <th>Application Developer</th>\n" +
        "                    <th>Actions</th>\n" +
        "                </tr>\n" +
        "            </thead>\n" +
        "            <tbody>\n";
    if (json != null) {

        if (isArray(json.return)) {
            for (var i in json.return) {
                body = body + "                <tr>\n" +
                    "                    <td>" + json.return[i].applicationName + "</td>\n" +
                    "                    <td>" + json.return[i].username + "</td>\n" +
                    "                    <td><a title=\"Remove Application\" onclick=\"validate('" + json.return[i].
                    applicationName + "');\"\n" +
                    " href=\"javascript:void(0)\"><i class=\"icon-trash\"></i> Remove Application</a></td>\n" +
                    "                </tr>\n";
            }
        }
        else {
            body = body + "                <tr>\n" +
                "                    <td>" + json.return.applicationName + "</td>\n" +
                "                    <td>" + json.return.username + "</td>\n" +
                "                    <td><a title=\"Remove Application\" onclick=\"validate('" + json.return.
                applicationName + "');\"\n" +
                " href=\"javascript:void(0)\"><i class=\"icon-trash\"></i> Remove Application</a></td>\n" +
                "                </tr>\n";
        }
    }
    body = body + "            </tbody>\n" +
        "        </table>\n" +
        "\n" +
        "    </div>";

    output = body;
    $("#gadgetBody").empty();
    $("#gadgetBody").append(output);
}

function itemRemove(appName) {
    var str = "/portal/gadgets/user_auth_apps/controllers/my_auth_apps/my_authorized_app_remove.jag";
    $.ajax({
        url:str,
        type:"POST",
        data:"appName=" + appName + "&cookie=" + cookie + "&user=" + userName
    })
        .done(function (data) {
            cancel();

        })
        .fail(function () {
            message({content:'Error while removing Application ', type:'error', cbk:function () {
            } });
            console.log('error');

        })
        .always(function () {
            console.log('completed');
        });

}

function isArray(element) {
    return Object.prototype.toString.call(element) === '[object Array]';
}

function cancel() {
    gadgets.Hub.publish('org.wso2.is.dashboard', {
        msg:'A message from User profile',
        id:"user_auth_apps .shrink-widget"
    });

}

function validate(appName) {
    var element = "<div class=\"modal fade\" id=\"messageModal\">\n" +
        "  <div class=\"modal-dialog\">\n" +
        "    <div class=\"modal-content\">\n" +
        "      <div class=\"modal-header\">\n" +
        "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n" +
        "        <h3 class=\"modal-title\">Modal title</h4>\n" +
        "      </div>\n" +
        "      <div class=\"modal-body\">\n" +
        "        <p>One fine body&hellip;</p>\n" +
        "      </div>\n" +
        "      <div class=\"modal-footer\">\n" +
        "      </div>\n" +
        "    </div>\n" +
        "  </div>\n" +
        "</div>";
    $("#message").append(element);
    itemRemoveValidate(appName);
}

function itemRemoveValidate(appName) {
    var msg = "You are about to remove " + appName + ". Do you want to proceed?";
    message({content:msg, type:'confirm', okCallback:function () {
        itemRemove(appName);
    }, cancelCallback:function () {
    }});
} 




