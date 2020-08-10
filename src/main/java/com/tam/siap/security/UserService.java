package com.tam.siap.security;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import com.tam.siap.exceptions.UserNotFoundException;
import com.tam.siap.exceptions.WrongPasswordException;
import com.tam.siap.models.Pic;
import com.tam.siap.models.PicPerusahaan;
import com.tam.siap.models.Role;
import com.tam.siap.repos.PicPerusahaanRepository;
import com.tam.siap.repos.PicRepository;
import com.vaadin.flow.server.VaadinSession;

@Service
public class UserService {
	public static final String BCUSER = "bcuser";
	public static final String PICUSER = "picuser";
	public static final String USERID = "userid";
	public static final String PERUSAHAAN_ID = "perusid";
	public static final String ROLE = "role";
	public static final String PIC_ID = "picid";
	public static final String NAMEUSER = "nameuser";
	public static final String ADMIN_ROLE = "adminrole";

	public static final String ADMINKB = "adminkb";
	public static final String ADMINGB = "admingb";

	@Autowired
	private ApplicationContext context;

	@Autowired
	PicPerusahaanRepository picPerusahaanRepository;

	@Autowired
	PicRepository picRepository;

	private static SecureRandom random = new SecureRandom();

	private Map<String, String> rememberedUsers = new HashMap<>();

	public boolean isAuthenticatedUser(String username, String password)
			throws UserNotFoundException, WrongPasswordException {
		boolean success = false;
		boolean bcuser = false;
		boolean picperusahaan = false;
		DataSource siapKabanDatasource = (DataSource) context.getBean("siapKabanDatasource");
		Connection conn = null;
		PreparedStatement ps = null;

		Pic picbc = picRepository.findByUsername(username);
		if (picbc != null) {
			success = true;
			bcuser = true;
			VaadinSession.getCurrent().setAttribute(BCUSER, true);
			VaadinSession.getCurrent().setAttribute(PICUSER, false);
			VaadinSession.getCurrent().setAttribute(USERID, username);
			VaadinSession.getCurrent().setAttribute(PERUSAHAAN_ID, null);
			VaadinSession.getCurrent().setAttribute(ROLE, picbc.getJenispic());
			VaadinSession.getCurrent().setAttribute(PIC_ID, picbc.getId());
			VaadinSession.getCurrent().setAttribute(ADMIN_ROLE, false);
			VaadinSession.getCurrent().setAttribute(NAMEUSER, picbc.getNama());
			Set<Role> roles = picbc.getRoles();
			if (roles != null) {
				for (Role r : roles) {
					if (r.getKode().equals(UserService.ADMINGB) || r.getKode().equals(UserService.ADMINKB)) {
						VaadinSession.getCurrent().setAttribute(ADMIN_ROLE, true);
					}
				}
			}
		}

		if (!bcuser) {
			PicPerusahaan pic = picPerusahaanRepository.findByKTP(username);
			if (pic == null) {
				throw new UserNotFoundException("Pengguna tidak ditemukan");
			} else {
				if (pic.getPassword() != null && pic.getPassword().equals(password)) {
					success = true;
					picperusahaan = true;
					VaadinSession.getCurrent().setAttribute(BCUSER, false);
					VaadinSession.getCurrent().setAttribute(PICUSER, true);
					VaadinSession.getCurrent().setAttribute(USERID, pic.getId());
					VaadinSession.getCurrent().setAttribute(PERUSAHAAN_ID, pic.getPerusahaanid());
					VaadinSession.getCurrent().setAttribute(NAMEUSER, pic.getNama());

				} else {
					throw new WrongPasswordException("Password salah");
				}
			}
		}

		if (!picperusahaan && !bcuser) {
			throw new UserNotFoundException("Pengguna tidak ditemukan");
		}

		return success;
	}

	public String rememberUser(String username) {
		String randomId = new BigInteger(130, random).toString(32);
		rememberedUsers.put(randomId, username);
		return randomId;
	}

	public String getRememberedUser(String id) {
		return rememberedUsers.get(id);
	}

	public void removeRememberedUser(String id) {
		rememberedUsers.remove(id);
	}
}
