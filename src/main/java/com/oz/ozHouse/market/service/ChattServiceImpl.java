package com.oz.ozHouse.market.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.oz.ozHouse.domain.Chatt;
import com.oz.ozHouse.dto.ChattDTO;
import com.oz.ozHouse.market.repository.ChattRepository;
import com.oz.ozHouse.market.repository.ChattRoomRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChattServiceImpl implements ChattService {

	private final ChattRepository chattRepository;

	private final ChattRoomRepository chattRoomRepository;

	@Override
	public Chatt saveMessage(ChattDTO chattDTO) {
		
		// 채팅방의 참여자 목록을 가져옵니다.
		List<Object> participants = chattRoomRepository.findParticipantsByRoomNum(chattDTO.getRoomNum());

		// 발신자가 아닌 다른 참여자를 수신자로 설정합니다.
		String recipient = (String) participants.stream()
				.filter(participant -> !participant.equals(chattDTO.getSender())).findFirst()
				.orElseThrow(() -> new IllegalStateException("수신자를 결정할 수 없습니다."));

		// ChattDTO에 수신자를 설정합니다.
		chattDTO.setRecipient(recipient);
		
		chattDTO.setRoomNum(chattDTO.getRoomNum());

		// ChattDTO를 Chatt 엔터티로 변환하고, 모든 필드를 포함하여 올바르게 설정합니다.
		Chatt chatt = new Chatt(chattDTO);

		// Chatt 엔터티를 저장합니다.
		return chattRepository.save(chatt);
	}
	@Override
    public List<Chatt> findMessagesByRoomNum(Integer roomNum) {
        return chattRepository.findByRoomNum(roomNum);
    }
	@Override
	public Chatt save(Chatt chatt) {
        return chattRepository.save(chatt);
    }

	@Override
	public Chatt findLastMessageByRoomNum(int roomNum) {
	    // 마지막 메시지를 가져오기 위해 Optional을 사용합니다.
	    Optional<Chatt> lastMessage = Optional.ofNullable(chattRepository.findTopByRoomNumOrderByInTimeDesc(roomNum));
	    return lastMessage.orElse(null); // 메시지가 없는 경우에는 null을 반환합니다.
	}
	
	@Override
	public void deleteByInTimeBefore(LocalDateTime date) {
		chattRepository.deleteByInTimeBefore(date);		
	}
	@Override
	public void deleteMessagesByRoomNum(int roomNum) {
		chattRepository.deleteMessagesByRoomNum(roomNum);
		
	}
}
