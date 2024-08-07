package com.oz.ozHouse.dto.client.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MypagePointDTO {
	long orderCode;
	String orderDate;
	String statement;
	int point;
}
