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
 ******************************************************************************/    var loading, loaded,
        loaderClass = 'loading';

    loading = function (el) {
        var loader;
        el.children().hide();
        loader = $('.' + loaderClass, el);
        if (loader.length === 0) {
            loader = el.prepend('<div class="' + loaderClass + '">loading.......</div>');
        }
        loader.show();
    };

    loaded = function (el, data) {
        var children;
        $('.' + loaderClass, el).hide();
        children = el.children(':not(.' + loaderClass + ')');
        if (!data) {
            children.show();
            return;
        }
        children.remove();
        el.append(data);
    };

    return {
        loading: loading,
        loaded: loaded
    };
})();
