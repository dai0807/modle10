<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
 
<title> �Ǹ� �����ȸ  </title>
 


<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
 

 
function fncGetList(currentPage){
	//document.getElementById("currentPage").value = currentPage;
	$("#currentPage").val(currentPage)

	
	console.log (  "currentPage ���� ��� �϶�! ���ư��� �ų��� "+ $("#currentPage").val());

	
	//document.detailForm.submit();
	$("form").attr("method" , "POST").attr("action" , "/purchase/listSale").submit();
		
	}
 
 	$(function(){
		$( ".ct_list_pop td:nth-child(7)" ).css("color" , "#FF35BC");

 		
 		
 		
		$(".ct_list_pop:nth-child(4n+2)" ).css("background-color" , "whitesmoke");

		$(".tranTd").on("click" , function(){
			 
			 var JtranCode = $(this).attr("value") ; 
 			 console.log(" attr : tran NO ���� ? " +JtranCode ) ;

 
 			self.location = "/purchase/getPurchase?tranNo="+JtranCode ; 
 		});
 		///purchase/getPurchase?tranNo=
 			
 			
 			
		$("#span_prodNo").on("click", function(){
			
			
			console.log(" tranNo ����� ���¿�  " + $(this).attr("value")   );
			//var currendPage =  $("#currentPage").val() ;
			 var currendPage =  $("#currentPageH").attr("value") ;

			 console.log( "currentPage  ::  " +currendPage );
			 

			  self.location ="/product/updateProdcutTranCodeByProd?currentPage="+currendPage+"&prodNo="+$(this).attr("value")+"&tranCode=003&menu=manage" ;
			 //���� �κ� �����ϱ� !! ������ ���ö�� ���� �� �����. �׷��� ������ �귶��. 
			 
			
			});	
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
					<td width="93%" class="ct_ttl01">�Ǹ� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">

	<tr>
	<td align="right">
		<tr>
			<td colspan="11" >��ü  
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		 <input type="hidden" id="currentPageH"   value="${resultPage.currentPage}"/>
	
	</tr>	
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ ��ȣ </td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ �̸� </td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">���� ����</td>	
		<td class="ct_line02"></td>
 	
	</tr>
		<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	
	 <c:set var="i" value="0" /> <!-- �� ���� --> 
 	 
	 <c:forEach var="purchase" items="${list}">
			<c:set var="i" value="${ i+1 }" />
							<%--
					 int no=list.size();
							for(int i=0; i<list.size(); i++) {
					          Purchase purchase = (Purchase)list.get(i) ;
							 --%>
		 <tr class="ct_list_pop">
			<td align="center" > ${i}</td>
 		 
 	 			
			<td></td>
				<td align="left" ">
						${purchase.buyer.userId} 
				</td>
						<!-- <a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">   </a> -->
 					
			<td></td>
				 	<td align="left"> ${purchase.purchaseProd.prodNo }    </td>
			 <td></td>
 			 
						<td align="left" class="tranTd"  value ="${purchase.tranNo}" > 
							${purchase.purchaseProd.prodName }  
						</td>
			 <td></td>
			
						<td align="left"> ${purchase.receiverPhone}  </td>
			<td></td>
		
				 	<c:if test = "${ purchase.tranCode eq'000'}">
							<td align="left">  ���Ű��� &nbsp; &nbsp; </td>
		 				
					</c:if>		 			
					 <c:if test = "${ purchase.tranCode eq'002'}">
							<td align="left"> ���ſϷ� &nbsp; &nbsp; 
			 					<span  id ="span_prodNo" value ="${product.prodNo}" > [ ����ϱ� ]</span>	
		 					</td>
					</c:if>
					<c:if test ="${ purchase.tranCode eq'003'}">
					 	<td align="left"> 	����� &nbsp; &nbsp; </td>
		 				
					</c:if>
					<c:if test ="${ purchase.tranCode eq'004'}">
					 	<td align="left"> 	��ۿϷ� &nbsp; &nbsp; </td>
		 				
					</c:if>  
	 
			<td></td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>