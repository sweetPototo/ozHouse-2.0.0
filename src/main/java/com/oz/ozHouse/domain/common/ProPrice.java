package com.oz.ozHouse.domain.common;

import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Embeddable
@NoArgsConstructor   //기본 생성자 자동 생성
@AllArgsConstructor  //필드의 모든 값을 초기화하는 생성자 자동 생성
@Getter
public class ProPrice {
	private int proPrice;
	private int proPoint;	
	private int proAssemblyCost;
	private int proDiscountRate;
	private int proDiscountPrice;
}
