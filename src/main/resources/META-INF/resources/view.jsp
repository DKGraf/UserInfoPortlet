<%@ include file="init.jsp" %>
<html>

<p style="font-size: larger">
    <b>
        <liferay-ui:message key="portlet.fullname"/>
    </b>
    ${user.fullName}
</p>

<p style="font-size: larger">
    <b style="margin: auto; text-decoration: underline">
        <liferay-ui:message key="portlet.organizations.list"/>
    </b>
</p>

<c:choose>
    <c:when test="${!empty user.organizations}">
        <table border="1px" style="margin: 10px">
            <th width="125px" style="text-align: center">
                <liferay-ui:message key="portlet.organization.id"/>
            </th>
            <th width="300px" style="text-align: center">
                <liferay-ui:message key="portlet.organization.name"/>
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
        <liferay-ui:message key="portlet.roles.list"/>
    </b>
</p>
<table border="1px" style="margin: 10px">
    <th width="125px" style="text-align: center">
        <liferay-ui:message key="portlet.role.id"/>
    </th>
    <th width="300px" style="text-align: center">
        <liferay-ui:message key="portlet.role.name"/>
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

</html>