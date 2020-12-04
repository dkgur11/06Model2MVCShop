
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
<%@page import="com.model2.mvc.common.util.CommonUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@ page import="com.model2.mvc.common.Page" %>
<%@ page import="com.model2.mvc.service.product.vo.*"%>
 
<%
  
List<ProductVO> list= (List<ProductVO>)request.getAttribute("list");
   /* Map<String, Object> map = (Map<String, Object>) request.getAttribute("map"); */
   Search search = (Search) request.getAttribute("search");
   Page resultPage =(Page) request.getAttribute("resultPage");
   
   String searchCondition = CommonUtil.null2str(search.getSearchCondition());
   String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
  
   /* int total = 0;
   List<ProductVO> list = null;
   if (map != null) {
      total = ((Integer) map.get("count")).intValue();
      list = (List<ProductVO>) map.get("list");
   }
   
   int currentPage = search.getCurrentPage();
   
   int totalPage = 0;
   if (total > 0) {
      totalPage = total / page.getPageUnit();
      if (total % page.getPageUnit() > 0)
         totalPage += 1;
   } */
   	String me =(String)request.getParameter("menu"); 
   

   
   
%>
--%>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
   <!--
  	  function fncGetList(currentPage){
	   document.getElementById("currentPage").value = currentPage;
  		document.detailForm.submit();
   } 
   -->
<%--
function fncSearchConditionCheck() {
      var searchCondition = document.detailForm.searchCondition.value;
      var searchKeyword = document.detailForm.searchKeyword.value;
      
      if(searchKeyword == null){
         alert("어를 입력해주세요");
      }else{
         if(searchCondition==0 && isNaN(Number(searchKeyword))==true){
            alert("검색하실 상품의 상품 번호로 입력해주세요.");
         } else if(searchCondition==2 && isNaN(Number(searchKeyword))==true){
            alert("검색하실 상품의 가격을 입력해주세요.");
         } else {
            document.detailForm.submit();
         }
      }
      
   }  --%>
   

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

   <div style="width: 98%; margin-left: 10px;">

      <form name="detailForm" action="/listProduct.do?menu=${menu} " method="post">

         <table width="100%" height="37" border="0" cellpadding="0"
            cellspacing="0">
            <tr>
               <td width="15" height="37">
               <img src="/images/ct_ttl_img01.gif"
                  width="15" height="37" /></td>
               <td background="/images/ct_ttl_img02.gif" width="100%"
                  style="padding-left: 10px;">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                     <td> 
                     
                     <c:choose>
                     	<c:when test="${menu == 'manage'}">상품 관리</c:when>
                     	<c:when test="${menu == 'search'}">상품 검색</c:when>
                     </c:choose>
                     <%-- <% if("manage".equals(me)) {%>
                        <td  width="93%" class="ct_ttl01">상품 관리</td>
                     <% } else {%>
                        <td width="93%" class="ct_ttl01">상품 검색</td>
                     <% } %>  
                      <td align="left" width="93%" class="ct_ttl01"> --%>
                      </td>
                     </tr>
                  </table>
               </td>
             
               <td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
                  width="12" height="37" /></td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <%-- <% if(search.getSearchCondition() != null) { %> --%> 
               <td align="right">
                  <select name="searchCondition" class="ct_input_g" style="width: 80px">
                     <%-- 
                     <% if(search.getSearchCondition().equals("0")){ %>
                        <option value="0" selected>상품번호</option>
                        <option value="1">상품명</option>
                        <option value="2">상품가격</option>
                     <% } else if(search.getSearchCondition().equals("1")){ %>
                        <option value="0">상품번호</option>
                        <option value="1" selected>상품명</option>
                        <option value="2">상품가격</option>
                     <% } else { %>
                        <option value="0">상품번호</option>
                        <option value="1">상품명</option>
                        <option value="2" selected>상품가격</option>
                     <% } %>
                     --%>
                     <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
					 <option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
					 <option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
                  </select> 
                  <%-- <input type="text" name="searchKeyword" value = "<%= searchKeyword %>" class="ct_input_g" style="width: 200px; height: 19px" /> --%>
               	<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
               </td>
               
           <%--      <% }else{ %>
                  <td align="right">
                     <select name="searchCondition" class="ct_input_g" style="width:80px">
                        <option value="0">상품번호</option>
                        <option value="1">상품명</option>
                        <option value="2">상품가격</option>
                     </select>
                     <input type="text" name="searchKeyword" value="<%= searchKeyword %>" class="ct_input_g" style="width:200px; height:19px" >
                  </td>
               <% } %>  --%>

               <td align="right" width="70">
                  <table border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td width="17" height="23"><img
                           src="/images/ct_btnbg01.gif" width="17" height="23"></td>
                        <td background="/images/ct_btnbg02.gif" class="ct_btn01"
                           style="padding-top: 3px;"><a
                           href="javascript:fncGetList('1');">검색</a></td>
                        <td width="14" height="23"><img
                           src="/images/ct_btnbg03.gif" width="14" height="23"></td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>


         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td colspan="11" >전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage} 페이지</td>
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
               <td class="ct_list_b">현재상태</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="808285" height="1"></td>
            </tr>

        <%--     <%    
               
               for(int i=0; i<list.size(); i++) {
                  ProductVO vo = list.get(i);
                  System.out.println("jsp listsize확인 :"+list.size());
            %>
            <tr class="ct_list_pop">
               <td align="center"><%= i+1%></td>
               <td></td>
               <td align="left">
               <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>&menu=<%= me %>" ><%= vo.getProdName() %></a>
               
            <  <% if(((UserVO)session.getAttribute("user")).getRole().equals("admin") && authorization.equals("manage")) { %>
                  <a href="/updateProductView.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
               <% } else { %>
                   <a href="/getProduct.do?prodNo=<%=vo.getProdNo()%>" ><%= vo.getProdName() %></a>
                <% } %> 
                
               </td>
               
               <td></td>
               <td align="left"><%= vo.getPrice() %></td>
               <td></td>
               <td align="left"><%= vo.getRegDate() %></td>
               <td></td>
               <td align="left">
               </td>
            </tr>
            <tr>
               <td colspan="11" bgcolor="D6D7D6" height="1"></td>
            </tr>
            <% } %> --%>
            
            <c:set var ="i" value="0"/>
            <c:forEach var="product" items="${list}">
            	<c:set var ="i" value="${i+1 }"/>
            	<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left"><a href="/getProduct.do?prodNo=${product.prodNo}&menu=${menu}">${product.prodName}</a></td>
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${product.regDate}
			</td>		
		</tr>
		<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
            
            </c:forEach>
         </table>

         <table width="100%" border="0" cellspacing="0" cellpadding="0"
            style="margin-top: 10px;">
            <tr>
               <td align="center">
               <input type="hidden" id="currentPage" name="currentPage" value=""/>
			<%-- 
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage(); i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>   
			--%>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
               </td>
            </tr>
         </table>
         <!--  페이지 Navigator 끝 -->

      </form>

   </div>
</body>
</html>