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
var engine = caramel.engine('handlebars', ( function () {
    var context = caramel.configs().context, pages = {
        '2-column-left': {
            template: '2-column-left.hbs',
            areas: ['title', 'header', 'navigation', 'footer', 'body', 'left'],
            areaDefault: 'body'
        },
        '1-column': {
            template: '1-column.hbs',
            areas: ['title', 'header', 'navigation', 'footer', 'body'],
            areaDefault: 'body'
        },
         '1-column-fluid': {
            template: '1-column-fluid.hbs',
            areas: ['title', 'header', 'navigation', 'body'],
            areaDefault: 'body'
        },
        '1-column-fluid-shindig': {
            template: '1-column-fluid-shindig.hbs',
            areas: ['title', 'header', 'navigation', 'body'],
            areaDefault: 'body'
        }
    }, map = {
        //TODO : this needs to be picked from the asset extensions directory.
        '': '1-column',
        'index.jag': '1-column',
        'editor.jag': '1-column-fluid-shindig',
        'dashboard.jag': '1-column-fluid'

    };

    //'dashboard.jag': '1-column-fluid',
    return {
        page: function (data, meta) {
            var page, url = meta.request.getRequestURI();
            url = url.substring(url.indexOf(context) + context.length + 1);
            page = map[url];
            return (meta.page = ( page ? pages[page] : pages['1-column-fluid']));
        },
        layout: function (data, layout, meta) {
            return this.__proto__.layout.call(this, data, layout, meta);
        },
        render: function (data, meta) {
            this.__proto__.render.call(this, data, meta);
            //print(data);
        }
    };
}()));

var resolve = function (path) {
    return this.__proto__.resolve.call(this, path);
};
