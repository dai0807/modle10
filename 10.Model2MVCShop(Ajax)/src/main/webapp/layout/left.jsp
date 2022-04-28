<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<title>Model2 MVC Shop</title>

	<link href="/css/left.css" rel="stylesheet" type="text/css">
	
	<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	
		function history(){
			popWin = window.open("/history.jsp",
														"popWin",
														"left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		}
	
		//==> jQuery ���� �߰��� �κ�
		 $(function() {
			 
			//==> ����������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('����������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
				$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
			});
			
			
			//==> ȸ��������ȸ Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() {
				//Debug..
				//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
			}); 
			
			
			
			$(".Depth03:contains('�ǸŻ�ǰ���')").on("click",function(){
				
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/addProduct") ;
				
			});
			
			
			$(".Depth03:contains('�ǸŻ�ǰ����')").on("click",function(){
				
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage") ;
				
			});			
			
			$(".Depth03:contains('�ǸŻ�ǰ���')").on("click",function(){
				
				$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listSale") ;
				
			});		
			
			$("#search").on("click",function(){
				
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search") ;
				
			});				
			
			$(".Depth03:contains('�����̷���ȸ')").on("click",function(){
				
				$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase") ;
				
			});				
			
			
			$("#history").on("click",function(){
				
				 attr("href","javascript:history()") ;
				
			});				
			
			
			
			
		});	
		 
	</script>
	
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
			<tr>
				<c:if test="${ !empty user }">
					<tr>
						<td class="Depth03">
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/getUser?userId=${user.userId}" target="rightFrame">����������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							����������ȸ
						</td>
					</tr>
				</c:if>
			
				<c:if test="${user.role == 'admin'}">
					<tr>
						<td class="Depth03" >
							<!-- ////////////////// jQuery Event ó���� ����� ///////////////////////// 
							<a href="/user/listUser" target="rightFrame">ȸ��������ȸ</a>	
							////////////////////////////////////////////////////////////////////////////////////////////////// -->
							ȸ��������ȸ
						</td>
					</tr>
				</c:if>
			
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
				
				<!--menu 02 line-->
<c:if test="${user.role == 'admin'}">
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						 �ǸŻ�ǰ���
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						 �ǸŻ�ǰ���� 
					</td>
				</tr>
				
				<tr>
					<td class="Depth03">
						 �ǸŻ�ǰ���  
					</td>
				</tr>
				<tr>				
				

				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
</c:if>
		</table>
	</td>
</tr>



<!--menu 03 line-->
<tr>
	<td valign="top"> 
		<table  border="0" cellspacing="0" cellpadding="0" width="159">
			<tr>
				<td class="Depth03" id="search">
					 ��ǰ �˻� 
				</td>
			</tr>
			
			<c:if test="${ !empty user && user.role == 'user'}">
			
			<tr>
				<td class="Depth03">
						�����̷���ȸ
				</td>
			</tr>
			
			</c:if>
		
		
		
		
			
			<tr>
				<td class="DepthEnd">&nbsp;</td>
			</tr>
			<tr>
				<td class="Depth03" id="history">�ֱ� �� ��ǰ </td>
			</tr>
		</table>
	</td>
</tr>
<tr>
<td>
<!-- Channel Plugin Scripts -->
<!--  
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "01fb8ba7-aa8c-4f5b-a6b4-74601a118188"
  });
</script>
<!-- End Channel Plugin -->


</td>
</tr>
</table>

</body>

</html> 