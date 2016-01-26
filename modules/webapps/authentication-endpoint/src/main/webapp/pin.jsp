<div id="loginTable1" class="identity-box">
    <%
        loginFailed = request.getParameter("loginFailed");
        if (loginFailed != null) {

    %>
    <div class="alert alert-error">
        <fmt:message key='<%=request.getParameter("errorMessage")%>'/>
    </div>
    <% } %>

    <!--Pin-->
    <div class="control-group">
        <label class="control-label" for="pin"><h4><fmt:message key='pin'/> :</h4></label>

        <div class="controls">
            <input type="password" id='pin' name="pin"  class="input-xlarge" size='30'/>
            <input type="hidden" name="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>
            <label class="checkbox" style="margin-top:10px"><input type="checkbox" id="chkRemember" name="chkRemember"><fmt:message key='remember.me'/></label>
        </div>
    </div>

    <div class="form-actions">
        <input type="submit" value='<fmt:message key='login'/>' class="btn btn-primary">
    </div>
    <div>
    	<a href="/dashboard/pin_reset/pinreset.jag" style="margin-left:35%;font-weight: bold">Reset PIN</a>
    </div>

</div>


