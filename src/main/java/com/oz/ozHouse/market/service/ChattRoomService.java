package com.oz.ozHouse.market.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.oz.ozHouse.domain.ChattRoom;
import com.oz.ozHouse.dto.ChattRoomDTO;

@Service
public interface ChattRoomService {
	
	ChattRoom createChatRoom(ChattRoomDTO chattRoomDTO);
    List<ChattRoom> findBymyId(String myId);
    ChattRoom findRoomByNum(Integer roomNum);
    ChattRoom findOrCreateRoom(String buyerNickname, String sellerNickname, Integer proNum);
    List<String> findParticipantsByRoomNum(Integer roomNum);
//    void updateUserCheckStatus(Integer roomNum, String userId, String status);
	String findOtherParticipant(Integer roomNum, String sender);
//    String getUserCheckStatus(Integer roomNum, String userId);
//	void updateUserCheckStatus(int roomNum, String username, String status);
	List<ChattRoomDTO> findRoomDetailsByMemberNickname(String memberNickname);
	void deleteChatRoom(int roomNum);

}
