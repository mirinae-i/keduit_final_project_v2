package com.team2.util;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Slf4j
public class BCryptTest {

	@Test
	public void encryptTest() {
		String plain = "1234";
		String hashed = BCrypt.hashpw(plain, BCrypt.gensalt(12));
		log.info("Encrypt: {}", hashed);
	}

	// @Test
	public void decryptTest() {
		String hashed = "$2a$12$1Nk8qS6u1OLrCAx7tFVtCOeMZIJP5d293xWIZx0yKES9o2YSH8O1W";
		String plain = "1234";
		String plain_corrent = "1234";
		if (BCrypt.checkpw(plain, hashed)) {
			log.info("일치");
		} else {
			log.info("불일치");
		}
		if (BCrypt.checkpw(plain_corrent, hashed)) {
			log.info("일치");
		} else {
			log.info("불일치");
		}
	}

}
