package com.oz.ozHouse.domain;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.oz.ozHouse.dto.ChattDTO;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@Entity(name = "Chatt")
@Builder(toBuilder = true)
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Chatt {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int msgNum;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "proNum")
//	private OzMarketPro ozMarketPro; 
	
//	private int proNum;
	
	private String recipient;
	
	private String sender;
	
	private String msg;
	
//	private int readStatus;
//	
//	private String file;
	
//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "roomNum")
//	private ChattRoom chattRoom;
	
	private int roomNum;
	
	private LocalDateTime inTime;
	
//	private String msgType;
	
    private int readStatus; 
	
	public Chatt(ChattDTO dto) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd HH:mm:ss");

        this.msgNum = dto.getMsgNum();
//        this.proNum = dto.getProNum();
        this.recipient = dto.getRecipient();
        this.sender = dto.getSender();
        this.msg = dto.getMsg();
        this.readStatus = 1;
//        this.file = dto.getFile();
        this.roomNum = dto.getRoomNum();
        
        this.inTime = dto.getInTime() != null ? dto.getInTime() : LocalDateTime.now(); // Directly set LocalDateTime

	}
	
}