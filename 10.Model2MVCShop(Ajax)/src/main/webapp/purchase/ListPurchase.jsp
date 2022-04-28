<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
 
<!DOCTYPE html>
<html>
<head>
 
<title>구매 목록조회 </title>
 


<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

<script type="text/javascript">
// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
<%-- 



 
function fncGetList(currentPage){
	document.getElementById("currentPage").value = currentPage;
	document.detailForm.submit();
}
  --%>
  
  function fncGetList(currentPage){
		$("#currentPage").val(currentPage) ; 
		console.log (  "currentPage 값을 출력 하라! 돌아간다 신난다 "+ " currentPage " + $("#currentPage").val());
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase" ).submit();

	}
  
$(function(){
	
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$( ".ct_list_pop td:nth-child(7)" ).css("color" , "pink");

	//$("h7").css("color" , "red");
	
		$(".ct_list_pop:nth-child(4n+2)" ).css("background-color" , "whitesmoke");

//	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	
});

$(function(){
	$(".ct_list_pop td:nth-child(3)").on("click", function(){
		
		console.log( "d:nth-child(3) val " +  $(this).val() );
		console.log( "d:nth-child(3) attr " + $(this).attr("value")  );

		self.location ="/user/getUser?userId="+ $(this).val() ; 
		 
		
	});
});

$(function(){	
	$(".ct_list_pop td:nth-child(7)").on("click", function(){
		
		console.log("d:nth-child(7) val " +  $(this).val() );
		console.log("d:nth-child(7) attr" + $(this).attr("value")  );

		self.location ="/purchase/getPurchase?tranNo="+ $(this).attr("value") ; 
 
 	});
});

$(function(){	
	$(".button_arrive").on("click", function(){
	 
		console.log(" tranNo 제대로 나온요  " + $(this).attr("value")   );
		//var currendPage =  $("#currentPage").val() ;
		 var currendPage =  $("#currentPageH").attr("value") ;

		 console.log( "currentPage  ::  " +currendPage );
		 
		 var currendPage1 =  $("#currentPageH").val() ;

		 console.log( "currentPage1  ::  " +currendPage1 );

		
 
		//self.location ="/purchase/updateTranCode?currentPage="+currendPage+"&tranNo="+$(".ct_list_pop td:nth-child(7)").attr("value")+"&tranCode=004"  ; 
			self.location ="/purchase/updateTranCode?currentPage="+currendPage+"&tranNo="+$(this).attr("value")+"&tranCode=004"  ; 

		
	});
	//<a href="${ menu == 'search' ? '/product/getProduct' : '/product/updateProductView'}?prodNo=${product.prodNo }&menu=${ menu }&tranCode=${product.proTranCode}">
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm"  >
 
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="15" height="37"><img src="/images/ct_ttl_img03.gif"	width="15" height="37"></td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="right">
		<tr>
			<td colspan="12" >
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
 					<input type="hidden" id="currentPageH"   value="${resultPage.currentPage}"/>
			
	</tr>	
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">상품이름</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>	
		<td class="ct_line02"></td>
	<!-- 	<td class="ct_list_b">정보수정</td>	
		<td class="ct_line02"></td>		 -->
	</tr>
		<tr>
		<td colspan="12" bgcolor="808285" height="1"></td>
	</tr>
		
	<tr>
		<td colspan="12" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<%--
 
 
		int no=list.size();
		for(int i=0; i<list.size(); i++) {
          Purchase purchase = (Purchase)list.get(i) ;
		 --%>
		 
	 	 <c:set var="i" value="0" /> <!-- 값 세팅 --> 
		 <c:forEach var="Puchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			 <tr class="ct_list_pop">
				<td align="center" > ${i } </td>
				<!--  <a href="/purchase/getPurchase?tranNo=${Puchase.tranNo}">   -->
 
				<td></td>
			 <td align="left">${buyer_id}</td>
		<!-- 	 <td align="left"> <a href="/user/getUser?userId=${buyer_id}">${buyer_id} </a> </td> -->
	 			
			
			<td></td>
			<td align="left">${Puchase.receiverName }      </td>
 			<td></td>
			<td align="left" value ="${Puchase.tranNo}" >${Puchase.purchaseProd.prodName }      </td>
			<td></td>
			<td align="left"> ${Puchase.receiverPhone}   </td>
			<td></td>
			 <td align="left"> 
			 
			 <c:if test="${Puchase.tranCode eq '002'}">
			 	 구매완료 상태입니다. 
			 
			 </c:if>
			   <c:if test="${Puchase.tranCode eq '003'}">
			 	 배송중 상태입니다. &nbsp;&nbsp;&nbsp;&nbsp;
			 	 <button  class ="button_arrive"  value ="${Puchase.tranNo}" type="button" > 물품도착 </button>
			 	 <!--<a href="/purchase/updateTranCode?currentPage=${resultPage.currentPage }&tranNo=${Puchase.tranNo }&tranCode=004"></a>   --> 
			 
			 </c:if>
	 			   <c:if test="${Puchase.tranCode eq '004'}">
					배송완료 상태입니다.
	 			 </c:if>
	 
	 
		 
		 
			 </td>
			 	
			 <td align="left"></td>
			<td></td>		
			 <td align="left"> </td>
			<td></td>	
		</tr>
		<tr>
			<td colspan="12" bgcolor="D6D7D6" height="1"></td>
		</tr>
  </c:forEach>		
  
	
		
		<td align="right" width="70">
		
		</td>
	 
</table>

 
 

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   		<jsp:include page="../common/pageNavigator.jsp"/>	
		   
		    	
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>