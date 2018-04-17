package org.astanis.portlet;

import com.liferay.portal.kernel.model.Role;
import com.liferay.portal.kernel.service.RoleLocalServiceUtil;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.WebKeys;
import org.astanis.constants.UserInfoPortletKeys;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

import java.io.IOException;
import java.util.List;

/**
 * @author dkgraf
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=UserInfo Portlet",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + UserInfoPortletKeys.UserInfo,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class UserInfoPortlet extends MVCPortlet {

	@Override
	public void render(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		boolean visible = false;
		ThemeDisplay tds = (ThemeDisplay) renderRequest.getAttribute(WebKeys.THEME_DISPLAY);
		List<Role> userGroupRoles = RoleLocalServiceUtil.getUserRoles(tds.getUserId());

		if (userGroupRoles != null) {
			for (Role role : userGroupRoles) {
				if (!role.getName().equals("Guest")) {
					visible = true;
					break;
				}
			}
		}

		if (!visible) {
			renderRequest.setAttribute(WebKeys.PORTLET_CONFIGURATOR_VISIBILITY, Boolean.FALSE);
		}
		super.render(renderRequest, renderResponse);
	}
}