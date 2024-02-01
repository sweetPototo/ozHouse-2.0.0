package com.oz.ozHouse.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
public class MerCoupon {
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int merCouponnum;
	private String merCouponname;
	private String merIsok;
	private int merCoupondiscount;
	private int merNum;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date merCouponusedate;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yy/MM/dd")
	private Date merCouponenddate;
	
}
