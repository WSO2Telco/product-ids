<script src="js/gsmamsisdn.js"></script>
<div id="loginTable1" class="identity-box">
    <%
        loginFailed = request.getParameter("loginFailed");
        if (loginFailed != null) {

    %>
    <div class="alert alert-error">
        <fmt:message key='<%=request.getParameter("errorMessage")%>'/>
    </div>
    <% } %>

    <!--MSISDN-->
    <div class="control-group">
        <label class="control-label" for="msisdn"><h4><fmt:message key='msisdn'/> :</h4></label>

        <div class="controls">
            <input type="text" id="msisdn" name="msisdn" class="input-xlarge" size="30"/>
             <label class="control-label-3" for="msisdn">e.g.9477xxxxxx,9476xxxxxx</label>
            <input type="hidden" name="sessionDataKey" value='<%=request.getParameter("sessionDataKey")%>'/>
            <!--<label class="checkbox" style="margin-top:10px"><input type="checkbox" id="chkRemember" name="chkRemember"><fmt:message key='remember.me'/></label>-->
        </div>
    </div>

    <div class="form-actions">
        <input type="submit" value='<fmt:message key='login'/>' class="btn btn-primary yellowBtn" onclick="submitLoginForm()" />
    </div>

</div>


