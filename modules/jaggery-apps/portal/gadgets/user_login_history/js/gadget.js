function drawPage() {
	console.log(json);
	var output = "";
	var body = ""
	if (json != null) {

		body = body
				+ " <div class=\"well form-inline\">"
				+ "		<table>\n"
				+ "			<tr>\n"
				+ "		        <td><b>Application:</b></td>\n"
				+ "				<td><b>From:</b></td>\n"
				+ "				<td><b>To:</b></td>\n"
				+ "			</tr>\n"
				+ "			<tr>\n"
				+ "				<td><select id=\"application\" style=\"width: 250px;\">\n"
				+ "						<option value=\"__ALL__\">All</option>\n";

		for (i = 0; i < json.length; i++) {
			body = body + "						<option value=" + json[i] + ">" + json[i]
					+ "</option>\n";
		}
		body = body
				+ "				</select>\n"
				+ "				</td>\n"
				+ "				<td><input type=\"text\" id=\"from_date\"\n"
				+ "					style=\"margin-bottom: 0px; width: 150px;\">\n"
				+ "				</td>\n"
				+ "				<td><input type=\"text\" id=\"to_date\"\n"
				+ "				style=\"margin-bottom: 0px; width: 150px;\">\n"
				+ "				</td>\n" 
				+ "             <td>\n"				
				+ "             <input type=\"button\" onclick=\"getLoginList();\" class=\"btn btn-primary\" value=\"View\"/>" 
			    + "              </td>\n"
				+ "              </table>\n" + "	</div>\n" + "\n"
				+ "             <div id=\"login_history_tbl_div\"></div>"
				+ "             <div class=\"pagination\" style=\"text-align: right;\"></div>";
	}

	output = body;
	$("#gadgetBody").empty();
	$("#gadgetBody").append(output);
	setDateFields();
}

function setDateFields() {
	// Create old date
	var date = new Date();
	var now = new Date();
	now.setDate(now.getDate() - 7);
	var oldDay = now.getDate();
	var oldMonth = now.getMonth() + 1;
	var oldYear = now.getFullYear();
	if (("0" + oldMonth).length == 2)
		oldMonth = "0" + oldMonth;
	if (("0" + oldDay).length == 2)
		oldDay = "0" + oldDay;
	var oldDate = oldYear + "-" + oldMonth + "-" + oldDay;

	// Create today date
	var day = date.getDate();
	var month = date.getMonth() + 1;
	var year = date.getFullYear();
	if (("0" + month).length == 2)
		month = "0" + month;
	if (("0" + day).length == 2)
		day = "0" + day;
	var today = year + "-" + month + "-" + day; 

	// Create date controllers
	 $('#from_date').datepicker({
		dateFormat : "yy-mm-dd",
		onClose : function(selectedDate) {
			$("#to_date").datepicker("option", "minDate", selectedDate);
		}
	});

	$("#to_date").datepicker({
		dateFormat : "yy-mm-dd",
		onClose : function(selectedDate) {
			$("#from_date").datepicker("option", "maxDate", selectedDate);
		}
	});

	// Set created dates to date controllers
	$("#from_date").attr("value", oldDate);
	$("#to_date").attr("value", today);
}


function getLoginList() {
	
	var appName = $("#application").val();
	var fromDate = $("#from_date").val();
	var toDate = $("#to_date").val();
	//alert(appName+","+fromDate+","+toDate);	
	
	var str = "/portal/gadgets/user_login_history/controllers/user_login_history/my_app_list.jag";
	//var str = 'http://localhost:9764/MediationTest/tnspoints/endpoint/login/history?userID=94773335976&appID=testmobile&fromDate=2014-10-01&toDate=2014-10-30';
	$.ajax({
		url : str,
		type : 'POST',
		data : 'appName=' + appName + '&cookie=' + cookie + '&user=' + userName + '&fromDate=' + fromDate +'&toDate=' + toDate,
		async: false,
	}).done(function(result) {
		generateDataTable(result);
		//cancel();
		

	}).fail(function() {
		message({
			content : 'Error while Retrive Login History ',
			type : 'error',
			cbk : function() {
			}
		});
		console.log('error');

	}).always(function() {
		console.log('completed');
	});
}

function generateDataTable(object){
    
	$("#login_history_tbl_div").empty();
    $(".pagination").empty();
    
    
if (object != null) {
    
	var tblbody = "    <div class=\"col-lg-12 content-section\">\n" +
    "        <table id=\"dataTableBody\" class=\"table table-bordered\">\n";
	
	
	var data = $.parseJSON(object);
	    var record = false;
	    
	    tbldtl = "";
	    
        for (var i in data) {
        	record = true;        	
        	tbldtl = tbldtl + "<tr>" +
                "                    <td>" + data[i].applicationId + "</td>\n" +
                "                    <td>" + data[i].authenticated + "</td>\n" +
                "					 <td>" + data[i].authIpaddress + "</td>\n" + 
                "                    <td>" + data[i].createdDate + "</td>\n" +
                "                </tr>";
        }
        
        if (record == false) {
        	tblbody = tblbody + "<tr>" +
        	   "		<td class=\"imageCell info\"><i class=\"icon-info\"></i>\n" +
        	   "         <span class=\"messageText\">No applications login found !</span> </td>\n" +
        	   "    </tr>\n";
        } else {
        	tblbody = tblbody + "            <thead>\n" +
            "                <tr>\n" +
            "                    <th>Authorized Applications</th>\n" +
            "                    <th>Authorized Status</th>\n" +
            "                    <th>IP Address</th>\n" +
            "                    <th>Authorized Date</th>\n" +
            "                </tr>\n" +
            "            </thead>\n" +
            "            <tbody>\n" + tbldtl;        	
        	
        }
        
}
tblbody = tblbody + "            </tbody>\n" +
    "        </table>\n" +
    "\n" +
    "    </div>";
    
    
    //$("#login_history_tbl_div").append("<h4>Login History</h4>");
    $("#login_history_tbl_div").append(tblbody);
    setTablePagination(0);
    
}



function isArray(element) {
	return Object.prototype.toString.call(element) === '[object Array]';
}

function cancel() {
	gadgets.Hub.publish('org.wso2.is.dashboard', {
		msg : 'A message from User Login History',
		id : "user_login_history .shrink-widget"
	});

}

function validate(appName) {
	var element = "<div class=\"modal fade\" id=\"messageModal\">\n"
			+ "  <div class=\"modal-dialog\">\n"
			+ "    <div class=\"modal-content\">\n"
			+ "      <div class=\"modal-header\">\n"
			+ "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>\n"
			+ "        <h3 class=\"modal-title\">Modal title</h4>\n"
			+ "      </div>\n" + "      <div class=\"modal-body\">\n"
			+ "        <p>One fine body&hellip;</p>\n" + "      </div>\n"
			+ "      <div class=\"modal-footer\">\n" + "      </div>\n"
			+ "    </div>\n" + "  </div>\n" + "</div>";
	$("#message").append(element);
	//itemRemoveValidate(appName);
	getLoginList();
	
}

function setTablePagination(pageNumber) {
    paginator(pageNumber);
}


function paginator(pageNumber) {
    var rows = $("#dataTableBody tr").length;
    var rowsPerPage = 10;
    if (rows > rowsPerPage) {
        var numberOfPages = Math.ceil(rows / rowsPerPage);
        var currentPageStart = pageNumber * rowsPerPage;
        var currentPageEnd = (pageNumber * rowsPerPage) + rowsPerPage;
        for (var i = 0; i < rows; i++) {
            if ((currentPageStart <= i) & (i < currentPageEnd)) {
                $("#dataTableBody tr").eq(i).show();
                // alert(i);
            } else {
                $("#dataTableBody tr").eq(i).hide();
            }
        }
        // alert("PAGENUMBER: "+pageNumber+"\nRows: "+rows+"\nRowsPP:
        // "+rowsPerPage+"\nPAGES: "+numberOfPages+"\nSTART:
        // "+currentPageStart+"\nEND: "+currentPageEnd);
        loadPaginatorView(numberOfPages, pageNumber);
    } else {
        $(".pagination").html('');
    }
}

function loadPaginatorView(numberOfPages, currentPage) {
    $(".pagination").html('<ul></ul>');
    var previousAppender = '<li><a href="javascript:paginator(0)"><<</a></li>';
    if (currentPage == 0) {
        previousAppender = '<li class="disabled"><a><<</a></li>';
    }
    $(".pagination ul").append(previousAppender);
    for (var i = 0; i < numberOfPages; i++) {
        var currentRow;
        var rowSticker = i + 1;
        if (i == currentPage) {
            currentRow = '<li class="active"><a>' + rowSticker + '</a></li>';
        } else {
            currentRow = '<li><a href="javascript:paginator(' + i + ')">'
                    + rowSticker + '</a></li>';
        }
        $(".pagination ul").append(currentRow);
    }
    var lastPage = numberOfPages - 1;// alert(lastPage);
    var postAppender = '<li><a href="javascript:paginator(' + lastPage
            + ')">>></a></li>';
    if (currentPage == lastPage) {
        postAppender = '<li class="disabled"><a>>></a></li>';
    }
    $(".pagination ul").append(postAppender);
}

/*
 * function itemRemoveValidate(appName) { var msg = "You are about to remove " +
 * appName + ". Do you want to proceed?"; message({content:msg, type:'confirm',
 * okCallback:function () { itemRemove(appName); }, cancelCallback:function () {
 * }}); }
 */

