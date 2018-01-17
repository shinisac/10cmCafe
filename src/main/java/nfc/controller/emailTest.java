package nfc.controller;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class emailTest {
	@RequestMapping(value="/email")
	public void Emailtest() {
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.naver.com";		
				String hostSMTPid = "hiruis@naver.com"; // 본인의 아이디 입력		
				String hostSMTPpwd = "tm1q2w3e$R"; // 비밀번호 입력
				
				// 보내는 사람 EMail, 제목, 내용 
				String fromEmail = "hiruis@naver.com"; // 보내는 사람 eamil
				String fromName = "hiruis";  // 보내는 사람 이름
				String subject = "이메일 발송 테스트"; // 제목
				
				// 받는 사람 E-Mail 주소
				String mail = "rickykise@naver.com";  // 받는 사람 email		
				
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(587);	// SMTP 포트 번호 입력

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					
					 // 본문 내용
					email.setHtmlMsg("<form method='post' action='http://192.168.20.43:9090/myweb4/memberIdchk.do'><p>이메일 발송 테스트 입니다.</p><input type='submit' value='해킹당하시겠습니까?' ></form>"); // 본문 내용
					
					email.send();			
				} catch (Exception e) {
					System.out.println(e);
				}
	}
}
