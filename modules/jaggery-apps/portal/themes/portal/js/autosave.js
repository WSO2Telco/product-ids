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
    var timerUnlocked = true;

    saveCodeMirror = function () {
        if (timerUnlocked && window.getCodeMirrorArr) {
            var cmArr = window.getCodeMirrorArr();
            if (cmArr) {
                for (cmTabId in cmArr) {
                    var cmInfo = cmArr[cmTabId];
                    var icon = cmInfo.tab.find('.autosave');
                    if (cmInfo.changed) {
                        icon.removeClass('icon-asterisk');
                        icon.addClass('icon-spinner');
                        var newSave = cmInfo.cm.getValue();
                        cmInfo.changed = false;
                        timerUnlocked = false;
                        var patch = JsDiff.createPatch(cmInfo.hash, cmInfo.lastSaved, newSave);
                        $.ajax({
                            url: 'apis/autosave.jag',
                            data: { page: editor.site, diff: patch},
                            success: function (isSuccess) {
                                if (isSuccess.updated) {
                                    cmInfo.lastSaved = newSave;
                                    icon.removeClass('icon-spinner');
                                }
                            },
                            dataType: 'json'
                        });
                    }
                }
            }
        }
    };

    var autoSaveTimer = function () {
        timerUnlocked = true;
        saveCodeMirror();
        setTimeout(autoSaveTimer, 5000);
    };
    autoSaveTimer();


})();
