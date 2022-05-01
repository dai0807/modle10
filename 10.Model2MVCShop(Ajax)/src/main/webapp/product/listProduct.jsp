<%@page import="java.awt.PageAttributes.OrientationRequestedType"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
   
    
    
<!DOCTYPE html>
<html>
<head>
 	<!--  프로덕트 list 에서 아직 puchase 부분 안건들림 , 부디부디 빠른 시일내에 건들이기를 , 근데 배송하기 그런 거 하려면 셀하나 더 넣어서 셀에 이름 넣어서 하는 거 추천 함  -->
 
<c:if test="${menu=='search'}">
	<title>상품 검색</title>
</c:if>
<c:if test="${menu=='manage'}">
	<title>상품 관리</title>
</c:if>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
<%-- 자바 스크립트 너무 싫습니다. 당신은 저한테 왜 이런 시련을 주시는 것인 지요
커런트 페이지 들어오고 , 커런트 페이지 id를 가진 태그에 들어가서 id의 "currentPage"에 value으로 놓기 
  --%>
		function fncGetList(currentPage){
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
			
 			
			console.log (  "메뉴 값을 출력 하라! 돌아간다 신난다 "+ $("#menu" ).val()   + " currentPage " + $("#currentPage").val());
			//document.detailForm.submit();
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu="+ $("#menu").val()  ).submit();
			
		
		}
		

		
		
		//ct_list_pop
		
		$(function(){
			
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
 			$(".ct_list_pop:nth-child(4n+1)" ).css("background-color" , "whitesmoke");
 
		//	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			
			
			
			$(".ct_btn01").on("click", function(){
				
				///console.log(  $( ".ct_btn01" ).html() );

				fncGetList(1);  // 시발 검색 
				
			});
			//<a href="${ menu == 'search' ? '/product/getProduct' : '/product/updateProductView'}?prodNo=${product.prodNo }&menu=${ menu }&tranCode=${product.proTranCode}">
			
			
			$(".produc_no").on("dblclick" , function(){
				
				
				var pageNAME = ($("#menu").val() == 'search') ? '/product/getProduct': '/product/updateProductView';
				 console.log(  pageNAME );

				var jprodNo = $(this).attr("value1") ;
				 console.log( "prodNo " +jprodNo );

					var jproTranCode = $(this).attr("value2") ;
					 console.log( "proTranCode  " +jproTranCode );		      
				 
				//  self.location = pageNAME + "?prodNo="+ $(".ct_list_pop  td:nth-child(1)").val() + "&menu="+$("#menu").val() +"&tranCode=" + $(".ct_list_pop  td:nth-child(3)").val() 
				  
		        self.location = pageNAME + "?prodNo="+jprodNo+"&menu="+$("#menu").val()   ; 
//		        self.location = pageNAME + "?prodNo="+jprodNo+"&menu="+$("#menu").val() +"&tranCode=" + jproTranCode  ; 
				
			});
			
			
			$(".produc_no").on("click" , function(){
				
	 

				var jprodNo = $(this).attr("value1") ;
				 console.log( "prodNo " +jprodNo );

					var jproTranCode = $(this).attr("value2") ;
					 console.log( "proTranCode  " +jproTranCode );		      
				 
				//  self.location = pageNAME + "?prodNo="+ $(".ct_list_pop  td:nth-child(1)").val() + "&menu="+$("#menu").val() +"&tranCode=" + $(".ct_list_pop  td:nth-child(3)").val() 
					 $.ajax( 
								{
									url : "/product/json/getProduct/"+jprodNo
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {


										
										var displayValue = "<h3>"
																	+"상품명 		: "+JSONData.prodName+"<br/>"
																	+"상품ID 		: "+JSONData.prodNo+"<br/>"
																	+"상품상세정보	: "+JSONData.prodDetail+"<br/>"
																	+"제조일자		: "+JSONData.manuDate+"<br/>"
																	+"가격 		: "+JSONData.price+"<br/>" 
																	+"</h3>";
									
										 console.log( "displayValue  " +displayValue );		      

										$("h3").remove();
										$( "#"+jprodNo+"" ).html(displayValue);
									}
							});
 				
			});
			
			
			
		$("#span_prodNo").on("click", function(){
			
			
			console.log(" tranNo 제대로 나온요  " + $(this).attr("value")   );
			//var currendPage =  $("#currentPage").val() ;
			 var currendPage =  $("#currentPageH").attr("value") ;

			 console.log( "currentPage  ::  " +currendPage );
			 


			  self.location ="/product/updateProdcutTranCodeByProd?currentPage="+currendPage+"&prodNo="+$(this).attr("value")+"&tranCode=003&menu=manage" ;
			 //여기 부분 보안하기 !! 눈물이 차올라거 고개를 쳐 들었다. 그렇게 눈물이 흘렀다. 
			 
			
			});
			
		 }); 
			
	 
</script>
</head>
<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
 <input type="hidden" id="menu"   value="${menu}"/>

<form name="detailForm" >
<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">  -->
<!-- menu를 manage로 보냄  -->

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
 	
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					
					  <c:if test="${menu=='search'}">
						  	 상품 검색
						  </c:if>
						<c:if test="${menu=='manage'}">
						  상품 관리 
						  </c:if>
						 
		 
					
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<td align="right">
				<select name="searchCondition"    class="ct_input_g" style="width:80px">
			 
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition =="0" ? "selected" : ""} > 상품번호</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition =="1" ? "selected" : ""} > 상품명</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition =="2" ? "selected" : ""} > 상품가격</option>
		 
			
			
			
				</select>
		<input type="text" name="searchKeyword" value="${search.searchKeyword}"  class="ct_input_g" style="width:200px; height:19px" />
				
				
				
	</td>	
		
		
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!--  <a href="javascript:fncGetList('1');">검색</a>-->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
			<td colspan="11" >
	
	<%--	<td colspan="11" >전체  <%= total%> 건수, 현재 <%=currentPage %> 페이지</td> --%>
			전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				 <input type="hidden" id="currentPageH"   value="${resultPage.currentPage}"/>
		
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
 		
		<td class="ct_line02"></td>
	
				<td class="ct_list_b"> 수량 </td>	
 	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	

	
	 <c:set var="i" value="0" /> <!-- 값 세팅 --> 
	 <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
	
	<!--  System.out.println("list :::: "+list);
		int no=list.size();
		for(int i=0; i<list.size(); i++) {
			Product pv = (Product)list.get(i);
		
		-->
	<tr class="ct_list_pop" >
		<td align="center"   >${i}</td>
		<td></td>
		
		
				<td align="left"  class = "produc_no" value1="${product.prodNo}"  value2="${product.proTranCode}">
				
 
							
						${ product.prodName }	
				</td> 
		
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="center">${product.regDate}	</td>
		<td></td>
		
					<td align="center">${product.quantity}	</td>
			
		<!-- 
		  <c:if test="${menu eq 'manage'}">  
			 	<td align="left" class ="tranCode"   value ="${product.prodNo}" >
 				 		
				<c:if test = "${product.proTranCode eq'002'}">
				구매완료 &nbsp; &nbsp; 
				 	<span  id ="span_prodNo" value ="${product.prodNo}" > [ 배송하기 ]</span>	 
						 
				
				</c:if>
				<c:if test = "${ product.proTranCode eq '003'}">
				 	배송중 &nbsp; &nbsp; 
	 				
				</c:if>
				<c:if test ="${ product.proTranCode eq '004'}">
				 	배송완료 &nbsp; &nbsp; 
	 				
					</c:if>   


			</c:if>
 --> 
		<td></td>		
	</tr>
	<tr>
	
		
		
 <td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>

	</c:forEach>		
	
	
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