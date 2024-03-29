<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/client/main_css/order.css"/>
<link rel="stylesheet" href="${path}/Cart.css"/>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode1').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    

</script>r
<script>
document.addEventListener('DOMContentLoaded', function () {
    // 페이지 로드가 완료된 후 실행됩니다.

    // top.jsp의 스타일을 삭제합니다.
    const stickyContainer = document.querySelector('.sticky-container');
    if (stickyContainer) {
        stickyContainer.removeAttribute('style');
    }
});
</script>


</head>

	


<span class="wairano">주문/결제</span>


<body onload="f.member_id.focus()">
	<div  align="center" class="login-wrapper" style="text-align: left">
	<form name="f" method="post" id="login-form" action="/order/success">		
		<span class="wairano2">주문자</span><br><br>
			이름 <br><br>
			<input type="text" value="${member.memberName}" name="oName" placeholder="이름을 입력해 주세요."><br>
			연락처<br><br>
			<input type="text" value="${member.memberHp.phoneNumber1}" name="phoneNumber1" size="3" maxlength="3"> -
			<input type="text" value="${member.memberHp.phoneNumber2}" name="phoneNumber2" size="4" maxlength="4"> -
			<input type="text" value="${member.memberHp.phoneNumber3}" name="phoneNumber3" size="4" maxlength="4">				
		<br><br>


		<span class="wairano2">배송지</span><br><br>
			<input type="text" tabindex="3" id="postcode1" name="postcode" value="${member.memberAddress.postcode}" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			
			<input type="text" id="sample6_address" name="city" value="${member.memberAddress.city}" placeholder="주소"><br>
			<input type="text" id="sample6_detailAddress" name="street" value="${member.memberAddress.street}" placeholder="상세주소">
			<input type="text" id="sample6_extraAddress" name="zipcode" value="${member.memberAddress.zipcode}" placeholder="참고항목">
			<br><br>
			
		<c:set var="order_ori_price" value="0"/>
		<c:set var="order_assembly_cost" value="0"/>
		<c:set var="order_dis_discount" value="0"/>
		<c:set var="order_qpty" value="0"/>
		
		<span class="wairano2">주문 상품</span><br><br>	
		
		   <c:if test="${not empty orderProducts}">	
		     <div class="commerce-cart__content-wrap col-12 col-md-7 col-lg-8">

		 <ul class="commerce-cart__content__group-list">
		     <li class="commerce-cart__content__group-item">
		     	<c:forEach var="dto" items="${orderProducts}">
		         <article class="commerce-cart__group">
		             <h1 class="commerce-cart__group__header">$/{브랜드명}</h1>
		
		<ul class="commerce-cart__group__item-list">
		    <li class="commerce-cart__group__item">
		        <article class="commerce-cart__delivery-group">
		<ul class="commerce-cart__delivery-group__product-list">
		    <li class="commerce-cart__delivery-group__product-item">
		   <article class="carted-product">
		       <div class="carted-product__select">
		           <div class="_3zqA8">

		           </div>
		       </div>
		
			<div class="product-small-item product-small-item--clickable">
			    <div class="product-small-item__image">
			        <picture>	
			        	<img class="image" src="${dto.productDTO.proImg}" alt="상품 대표 이미지">
			  	   </picture>
			    </div>
			    <div class="product-small-item__content">
			        <h1 class="product-small-item__title">${dto.productDTO.proName}</h1>
			
			<p class="css-w0e4y9 e1xep4wb1">
				<c:if test="${dto.productDTO.proAssemblyCost == 0}">
					<span id="product_assembly_price${dto.productDTO.proNum}" data-price="${dto.productDTO.proAssemblyCost}">
						무료 조립
					</span>
				</c:if>
				<c:if test="${dto.productDTO.proAssemblyCost != 0}">
					<span id="product_assembly_price${dto.productDTO.proNum}" data-price="${dto.productDTO.proAssemblyCost}">
						조립비 ${dto.productDTO.proAssemblyCost} 원
					</span>
				</c:if>									
				&nbsp;|&nbsp;일반택배
			</p><br>
			        <span class="carted-product__subtotal" display="flex">
		            	<p class="css-2kgyr3"><span style="text-decoration: line-through;"><fmt:formatNumber value="${dto.productDTO.proPrice}" pattern="###,###"/></span> &nbsp; 
		            	<span class="css-1wu05q6">${dto.quantity} 개</span> 
		            	<span class="css-1wu05q7">할인 적용 금액<span class="discount_price">&nbsp; <fmt:formatNumber value="${dto.productDTO.proPrice - dto.productDTO.proDiscountPrice}" pattern="###,###"/>원</span></span></p>
		            </span>
			        <span class="carted-product__subtotal" display="flex">
		            	<p class="css-2kgyr3"><span style="text-decoration: line-through;"></span> &nbsp; 
		            	<span class="css-1wu05q6"></span> 
		            	<span class="css-1wu05q7">상품 합계 금액<span class="discount_price" style="color: black; font-size:20px;">&nbsp; <fmt:formatNumber value="${(dto.productDTO.proPrice - dto.productDTO.proDiscountPrice) * dto.quantity}" pattern="###,###"/>원</span></span></p>
		            </span>		            
			    </div>
			</div>

			<ul class="carted-product__option-list">
			    <li class="carted-product__option-list__item">

		                </li>
		            </ul>
		            <div class="carted-product__footer">
		                
		            </div>
		        </article>
		    </li>
		</ul>
		<footer class="commerce-cart__delivery-group__footer">
		    <p class="commerce-cart__delivery-group__total">배송비 미정</p>
		                               </footer>
		                             </article>
		                         </li>
		                     </ul>
		          
		                 </article>
		<c:set var="order_ori_price" value="${order_ori_price + (dto.productDTO.proPrice*dto.quantity)}"/>
		<c:set var="order_dis_discount" value="${order_dis_discount + (dto.productDTO.proDiscountPrice*dto.quantity)}"/>		                 
		<c:set var="order_assembly_cost" value="${order_assembly_cost + (dto.productDTO.proAssemblyCost*dto.quantity)}"/> 
		<c:set var="order_qpty" value="${order_qpty + dto.quantity}"/>
		                  </c:forEach>
		             </li>
		         </ul>
		</div>
          
  		</c:if>        
		

		<span class="wairano2"> 쿠폰</span><br><br>	
		<c:if test="${not empty coupons}">	
		   	<c:forEach var="cdto" items="${coupons}">
		   	<ul>
		   		<div class="eo0ca796 css-113eoa3">
				<input title="${cdto.merCouponname}" type="checkbox" name="selectedCoupons" value="${cdto.merCouponnum}" class="css-s6rm2m" data-discount="${cdto.merCoupondiscount}">${cdto.merCouponname}</div>
				<div class=" css-1vjp7rs eo0ca790"><div class="selected css-1gjupqf eo0ca795">${cdto.merCoupondiscount}원 할인</div>
				<div class="css-1bdbp8h eo0ca794">${cdto.merCouponenddate}까지</div>
				</div>
			</ul>
			</c:forEach>
		</c:if>

		 <c:if test="${empty coupons}">	
		   	사용 가능한 쿠폰이 없어요<br><br>	
		 </c:if>
		<br><br>
		<span class="wairano2">포인트</span><br>
		<input type="text" value="0" class="memberUsePoint" name="oDisPoint" maxlength="${member.memberPoint}" id="memberUsePoint">
		<input type="button" name="use_all_point" class="memberUsePointAllButton" value="전액 사용"><br>
		가용 포인트 : ${member.memberPoint} points
		<br><br>
		<br><br>
		<span class="wairano2">요청 사항</span><br><br>	
		<input type="text" placeholder="요청 사항을 입력해 주세요" maxlength="50" name="oComment">

		<br><br>	
		<span class="wairano2">결제 수단</span><br><br>	
		# 추후 추가하겠습니다
		<input type="hidden" name="oDisPoint" id="final_discount_point">
    	<input type="hidden" name="oDisCoupon" id="final_discount_coupon">	
    	<input type="hidden" value="${order_ori_price - order_dis_discount}" name="oPrice"/>
		</form></div>
		
<aside>
<div class="sticky-child commerce-cart__side-bar">
	            <dl class="commerce-cart__summary commerce-cart__side-bar__summary">
	                <div class="commerce-cart__summary__row">
	                    <dt>총 상품금액</dt>
					 <dd id="ori_price">
				    <span class="number" id="total_price"><fmt:formatNumber value="${order_ori_price}" pattern="###,###"/></span>
				   	 원
					</dd>
	                </div>
	    <div class="commerce-cart__summary__row">
	        <dt>총 조립비</dt>
       <dd id="totalAssemblyCost">
   		 + <span class="number"><fmt:formatNumber value="${order_assembly_cost}" pattern="###,###"/></span>
    		원</dd>
    		<input type="hidden" name="order_assembly_cost" value="${order_assembly_price}">
               </div>
               <div class="commerce-cart__summary__row">
                   <dt>총 할인금액</dt>
                   <dd> -
				<span class="number" id="final_discount_price"> ${order_dis_discount}</span>원</dd>
               </div>
               <div class="commerce-cart__summary__row commerce-cart__summary__row--total">
                   <dt>결제금액</dt>
                  <dd id="final_order_price"><span class="totalPrice" id="final_order_price">${(order_ori_price - order_dis_discount)}</span>원</dd>
                  
               </div>
           </dl>
           <div class="commerce-cart__side-bar__order">
               <button class="_1eWD8 _3SroY _27do9 commerce-cart__side-bar__order__btn" type="button" onclick="javaScript:goOrderSuccess()">${order_qpty}개 상품 구매하기</button>
           </div>
           </div>
</aside>
<script>
	document.addEventListener("DOMContentLoaded", function () {
	    var memberUsePointValue = ${member.memberPoint}; // 사용자의 전체 포인트
	    var couponCheckboxes = document.querySelectorAll(".css-s6rm2m"); // 쿠폰 체크박스 선택
	    var memberUsePointAllButton = document.querySelector(".memberUsePointAllButton");
	    var memberUsePointButton = document.querySelector(".memberUsePoint"); // 포인트 입력 필드
	    var originalPrice = ${order_ori_price}; // 원래 주문 금액
	    var discountPrice = ${order_dis_discount}; // 기존 할인 금액
	
	    function calculateFinalPrice() {
	        var selectedCouponDiscount = 0;
	        couponCheckboxes.forEach(function(checkbox) {
	            if (checkbox.checked) {
	                selectedCouponDiscount += parseInt(checkbox.dataset.discount);
	            }
	        });
	
	        var usePointValue = parseInt(memberUsePointButton.value) || 0;
	        return originalPrice - selectedCouponDiscount - usePointValue - discountPrice;
	    }
	
	    function updatePrice() {
	    	var usePointValue = parseInt(memberUsePointButton.value) || 0;
	        var finalOrderPrice = calculateFinalPrice();
			var discountPrice2 = originalPrice - calculateFinalPrice();

			document.getElementById('final_discount_price').textContent = new Intl.NumberFormat().format(discountPrice2);
	       	document.getElementById('final_order_price').textContent = new Intl.NumberFormat().format(finalOrderPrice);
	       	document.getElementById('final_discount_point').value = usePointValue;
	        document.getElementById('final_discount_coupon').value = originalPrice - discountPrice - calculateFinalPrice() - usePointValue;
	    }
	
	    couponCheckboxes.forEach(function(checkbox) {
	        checkbox.addEventListener("change", function() {
	            if (checkbox.checked) {
	                var tempFinalPrice = calculateFinalPrice();
	                if (tempFinalPrice < 0) {
	                    checkbox.checked = false; // 쿠폰 선택 취소
	                }
	            }
	            updatePrice();
	        });
	    });
	
	    memberUsePointButton.addEventListener("input", function () {
	        var currentInputValue = parseInt(memberUsePointButton.value) || 0;
	        if (currentInputValue > memberUsePointValue) {
	            memberUsePointButton.value = memberUsePointValue; // 값 조정
	        }
	        updatePrice(); // 가격 업데이트
	    });
	
	    memberUsePointAllButton.addEventListener("click", function () {
	        memberUsePointButton.value = memberUsePointValue;
	        updatePrice(); // '전액 사용' 버튼 클릭 후 가격 업데이트
	    });
	
	    updatePrice(); // 초기 가격 설정
	});

    
	function goOrderSuccess(){
		if (f.oName.value.trim() === ""){
            alert("주문자 이름을 입력해 주세요")
            f.oName.focus()
            return
         }
         if (f.phoneNumber1.value.trim() === "" || f.phoneNumber2.value.trim() === "" || f.phoneNumber3.value.trim() === "") {
            alert("연락처를 모두 입력해 주세요");
            f.phoneNumber1.focus();
            return;
         }
         if (f.postcode.value.trim() === "" || f.city.value.trim() === "" || f.street.value.trim() === "" || f.zipcode.value.trim() === "") {
            alert("주소지를 모두 입력해 주세요");
            f.postcode.focus();
            return;
         }
		var pointValue = f.oDisPoint.value;
		var commentValue = f.oComment.value;
		
		// 포인트 값이 null 또는 빈 문자열인 경우 0으로 설정
		if (commentValue === null) {
			alert("포인트를 정확히 입력해 주세요");
			f.oDisPoint.focus();
		}
		
		if (commentValue.trim() === "") {
			alert("다시 시도하세요");
			window.location.reload();
		}
		
		// comment 값이 null이거나 undefined인 경우 빈 문자열로 설정
		if (commentValue === null || commentValue.trim() === "") {
		    f.oComment.value = "";
		}
		
		document.f.action="/order/success"
		document.f.submit()
	}

	</script>

</body>

