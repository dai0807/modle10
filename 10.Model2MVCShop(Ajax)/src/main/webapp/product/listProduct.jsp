<%@page import="java.awt.PageAttributes.OrientationRequestedType"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
   
    
    
<!DOCTYPE html>
<html>
<head>
 	<!--  ���δ�Ʈ list ���� ���� puchase �κ� �Ȱǵ鸲 , �ε�ε� ���� ���ϳ��� �ǵ��̱⸦ , �ٵ� ����ϱ� �׷� �� �Ϸ��� ���ϳ� �� �־ ���� �̸� �־ �ϴ� �� ��õ ��  -->
 
<c:if test="${menu=='search'}">
	<title>��ǰ �˻�</title>
</c:if>
<c:if test="${menu=='manage'}">
	<title>��ǰ ����</title>
</c:if>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
<%-- �ڹ� ��ũ��Ʈ �ʹ� �Ƚ��ϴ�. ����� ������ �� �̷� �÷��� �ֽô� ���� ����
Ŀ��Ʈ ������ ������ , Ŀ��Ʈ ������ id�� ���� �±׿� ���� id�� "currentPage"�� value���� ���� 
  --%>
		function fncGetList(currentPage){
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
			
 			
			console.log (  "�޴� ���� ��� �϶�! ���ư��� �ų��� "+ $("#menu" ).val()   + " currentPage " + $("#currentPage").val());
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

				fncGetList(1);  // �ù� �˻� 
				
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
																	+"��ǰ�� 		: "+JSONData.prodName+"<br/>"
																	+"��ǰID 		: "+JSONData.prodNo+"<br/>"
																	+"��ǰ������	: "+JSONData.prodDetail+"<br/>"
																	+"��������		: "+JSONData.manuDate+"<br/>"
																	+"���� 		: "+JSONData.price+"<br/>" 
																	+"</h3>";
									
										 console.log( "displayValue  " +displayValue );		      

										$("h3").remove();
										$( "#"+jprodNo+"" ).html(displayValue);
									}
							});
 				
			});
			
			
			
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
 <input type="hidden" id="menu"   value="${menu}"/>

<form name="detailForm" >
<!-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">  -->
<!-- menu�� manage�� ����  -->

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
						  	 ��ǰ �˻�
						  </c:if>
						<c:if test="${menu=='manage'}">
						  ��ǰ ���� 
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
			 
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition =="0" ? "selected" : ""} > ��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition =="1" ? "selected" : ""} > ��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition =="2" ? "selected" : ""} > ��ǰ����</option>
		 
			
			
			
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
						<!--  <a href="javascript:fncGetList('1');">�˻�</a>-->
						�˻�
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
	
	<%--	<td colspan="11" >��ü  <%= total%> �Ǽ�, ���� <%=currentPage %> ������</td> --%>
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
				 <input type="hidden" id="currentPageH"   value="${resultPage.currentPage}"/>
		
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
 		
		<td class="ct_line02"></td>
	
				<td class="ct_list_b"> ���� </td>	
 	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	

	
	 <c:set var="i" value="0" /> <!-- �� ���� --> 
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
				���ſϷ� &nbsp; &nbsp; 
				 	<span  id ="span_prodNo" value ="${product.prodNo}" > [ ����ϱ� ]</span>	 
						 
				
				</c:if>
				<c:if test = "${ product.proTranCode eq '003'}">
				 	����� &nbsp; &nbsp; 
	 				
				</c:if>
				<c:if test ="${ product.proTranCode eq '004'}">
				 	��ۿϷ� &nbsp; &nbsp; 
	 				
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
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>