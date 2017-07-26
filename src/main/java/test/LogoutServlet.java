/* (C) Copyright IBM Corporation 2015,2016      IBM SelectStack（6949-63V）
 * U.S. Government Departments Restricted Rights: Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */
package test;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

	private static final long serialVersionUID = -1012526580856420104L;
	
	private String casServerLogoutUrl;
	private String serverHome;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.casServerLogoutUrl = config.getInitParameter("casServerLogoutUrl");
		if (this.casServerLogoutUrl == null){
			throw new ServletException("The logout servlet init-param [casServerLogoutUrl] has not be defined.");
		}
		this.serverHome = config.getInitParameter("serverHome");
		if (this.serverHome == null){
			throw new ServletException("The logout servlet init-param [serverHome] has not be defined.");
		}
		super.init(config);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		if (session != null) {
			session.invalidate();
		}
		String logoutUrl = String.format("%s?service=%s", this.casServerLogoutUrl, resp.encodeURL(this.serverHome));
		resp.sendRedirect(logoutUrl);
	}

	

}
