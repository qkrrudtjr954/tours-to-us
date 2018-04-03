package www.tours2us.com.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class EchoHandler extends TextWebSocketHandler {
	Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private HashMap<Integer, List<WebSocketSession>> sessionList = new HashMap<Integer, List<WebSocketSession>>();
	
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        logger.info("{} 연결됨, {}", session.getId(), session);
    }

	/**
	 * 클라이언트가 웹소켓서버로 메시지를 전송했을 때 실행되는 메소드
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		
		
		String msg = message.getPayload();
		Gson gson = new Gson();
		Msg msgVO = gson.fromJson(msg, Msg.class);
		
		System.out.println(msgVO);
		
		if(msgVO.isFirst) {
			//	처음 초기 
			//	session id와 room number를 저장한다.
			Msg.roomSet.put(session.getId(), msgVO.room);
			
			//	room number의 세션 리스트가 존재하는 지 확인한다.
			if(sessionList.get(msgVO.room) == null) {
				//	방이 없으면 빈 방을 만든다.
				sessionList.put(msgVO.room, new ArrayList<WebSocketSession>());				
			}
			//	방이 있으면 방에 session을 추가한다. 
			sessionList.get(msgVO.room).add(session);			
		}
		
		if(Msg.roomSet.get(session.getId()) == msgVO.room && !msgVO.msg.equals("")) {
			for (WebSocketSession sess : sessionList.get(msgVO.room)) {
				sess.sendMessage(new TextMessage(session.getId() + " : " + msgVO.msg));
			}			
		}
		
	}
	
	/** 
	 * 클라이언트가 연결을 끊었을 때 실행되는 메소드
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//	방번호를 가져온다.
		int roomnum = Msg.roomSet.get(session.getId());
		//	집합에서 지운다.
		Msg.roomSet.remove(session.getId());
		
		System.out.println("remove : "+session);
		
		System.out.println("-------------- before -------------");
//		sessionList.get(roomnum).stream().forEach(System.out::println);
		System.out.println("-------------- before -------------");
		
		//	session id와 같은 session을 list에서 지워줍니다.
//		IntStream.range(0, sessionList.get(roomnum).size())
//			.forEach(idx -> {
//				if(sessionList.get(roomnum).get(idx).getId().equals(session.getId())) {
//					sessionList.get(roomnum).remove(idx);
//				}
//			});
		
		System.out.println("-------------- after -------------");
//		sessionList.get(roomnum).stream().forEach(System.out::println);
		System.out.println("-------------- after -------------");
		
		logger.info("{} 연결 끊김", session.getId());
	}
}
