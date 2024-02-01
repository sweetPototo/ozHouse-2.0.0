package com.oz.ozHouse.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
@Setter
@Getter
public class Msg {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int num;
	private String reason;
	private String approvalStatus;
}
