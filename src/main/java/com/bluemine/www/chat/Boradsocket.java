package com.bluemine.www.chat;

import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.junit.runners.Parameterized.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bluemine.www.dao.UserInfoDAO;

import java.io.IOException;
 
@Controller
@ServerEndpoint(value="/broadcasting")
public class Boradsocket extends TextWebSocketHandler{

	@Autowired
	UserInfoDAO uDao;
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		/*String username = (String)session.getUserProperties().get("userId");
		//세션 프로퍼티에 username이 없으면 username을 선언하고 해당 세션을으로 메시지를 보낸다.(json 형식이다.)
        //최초 메시지는 username설정
		System.out.println(username);*/
		
/*		Map<String, Object> map = session.getUserProperties();
        String userId = (String)map.get("loginId");
        System.out.println("전송자 아이디:"+userId);
*/		System.out.println("메시지");
		System.out.println(message);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	// 클라이언트가 접속을 하게되면 호출되는 메소드
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("접속");
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	// 통신 중 에러 발생 시 호출되는 메소드
	 @OnError
	 public void error(Session session, Throwable t) {

	  // 클라이언트 삭제
	  clients.remove(session);
	  System.err.println("Error on session " + session.getId());
	 }
	
	 // 클라이언트와 연결이 끊길때 호출되는 메소드
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
}