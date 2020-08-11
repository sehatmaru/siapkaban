package com.tam.siap.security;

import java.util.Arrays;
import java.util.Optional;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tam.siap.exceptions.UserNotFoundException;
import com.tam.siap.exceptions.WrongPasswordException;
import com.vaadin.flow.server.VaadinService;
import com.vaadin.flow.server.VaadinSession;


@Service
public class AuthService {
	
	@Autowired
	UserService userService;

	private static final String COOKIE_NAME = "remember-me";
	public static final String SESSION_USERNAME = "username";

//	public  boolean isAuthenticated() {
//		return VaadinSession.getCurrent().getAttribute(SESSION_USERNAME) != null || loginRememberedUser();
//	}

	public static String getSessionUsername() {
		return "" + VaadinSession.getCurrent().getAttribute(SESSION_USERNAME);
	}

//	public boolean login(String username, String password, boolean rememberMe) throws UserNotFoundException , WrongPasswordException{
//		if (userService.isAuthenticatedUser(username, password)) {
//			VaadinSession.getCurrent().setAttribute(SESSION_USERNAME, username);
//			return true;
//		}
//
//		return false;
//	}

	public static void logOut() {
		VaadinSession.getCurrent().close();
//		UI.getCurrent().navigate(LoginPage.class);
	}

	private  Optional<Cookie> getRememberMeCookie() {
		Cookie[] cookies = VaadinService.getCurrentRequest().getCookies();
		try {
			return Arrays.stream(cookies).filter(c -> c.getName().equals(COOKIE_NAME)).findFirst();
		}catch (Exception e) {
			// TODO: handle exception
		}
		return null;
		
	}

//	private  boolean loginRememberedUser() {
//		Optional<Cookie> rememberMeCookie = getRememberMeCookie();
//
//		if (rememberMeCookie!=null && rememberMeCookie.isPresent()) {
//			String id = rememberMeCookie.get().getValue();
//			String username = userService.getRememberedUser(id);
//
//			if (username != null) {
//				VaadinSession.getCurrent().setAttribute(SESSION_USERNAME, username);
//				return true;
//			}
//		}
//
//		return false;
//	}

//	private  void rememberUser(String username) {
//		String id = userService.rememberUser(username);
//
//		Cookie cookie = new Cookie(COOKIE_NAME, id);
//		cookie.setPath("/");
//		cookie.setMaxAge(60 * 60 * 24 * 30); // valid for 30 days
//		VaadinService.getCurrentResponse().addCookie(cookie);
//	}

	private  void deleteRememberMeCookie() {
		Cookie cookie = new Cookie(COOKIE_NAME, "");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		VaadinService.getCurrentResponse().addCookie(cookie);
	}
}