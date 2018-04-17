<%@ include file="init.jsp" %>

<p style="font-size: larger">
    <b>
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
        <table border="1px" style="margin: 10px">
            <th width="125px" style="text-align: center">
                Organization ID
            </th>
            <th width="300px" style="text-align: center">
                Organization Name
            </th>

            <c:forEach items="${user.organizations}" var="organization">
                <tr>
                    <td style="text-align: center">
                            ${organization.organizationId}
                    </td>
                    <td style="text-align: center">
                            ${organization.name}
                    </td>
                </tr>
            </c:forEach>
        </table>
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
<table border="1px" style="margin: 10px">
    <th width="125px" style="text-align: center">
        Role ID
    </th>
    <th width="300px" style="text-align: center">
        Role Name
    </th>
    <c:forEach items="${user.roles}" var="role">
        <tr>
            <td style="text-align: center">
                    ${role.roleId}
            </td>
            <td style="text-align: center">
                    ${role.name}
            </td>
        </tr>
    </c:forEach>
</table>