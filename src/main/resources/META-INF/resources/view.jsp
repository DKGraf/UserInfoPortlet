<%@ include file="init.jsp" %>

<p style="font-size: larger">
    <b style="margin: auto">
        Full Name:
    </b>
    ${user.fullName}
</p>

<p style="font-size: larger">
    <b style="margin: auto; text-decoration: underline">
        Organizations List:
    </b>
</p>

<c:choose>
    <c:when test="${!empty user.organizations}">
        <c:forEach items="${user.organizations}" var="organization">
            <p>
                    ${organization.name}<br>
            </p>
        </c:forEach>
    </c:when>
    <c:otherwise>
        None
    </c:otherwise>
</c:choose>

<p style="font-size: larger">
    <b style="margin: auto; text-decoration: underline">
        Roles List:
    </b>
</p>

<c:forEach items="${user.roles}" var="role">
    <p>
            ${role.name}<br>
    </p>
</c:forEach>