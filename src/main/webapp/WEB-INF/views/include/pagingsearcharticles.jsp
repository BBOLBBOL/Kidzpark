<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  
  <c:set  var="m_no"                value="${m_no}" /> 
  <c:set  var="startPage"           value="${pg.startPage}" /> 
  <c:set  var="endPage"             value="${pg.endPage}" /> 
  <c:set  var="nowPage"               value="${pg.nowPage}" /> 
  
  <div>
    <table width="500" height="25"  align="center"  >
     <tr>
       <td width="500" height="25"  align="center" >
     
     <!-- 처음/ 이전 -->     
     <c:if test="${ pg.startPage gt 1 }">
       <a href="/SearchArticles?m_no=${m_no}&u_no=${loginVo.u_no}&nowPage=1&searchOption=${searchOption}&searchKeyword=${searchKeyword}">처음</a>
       <a href="/SearchArticles?m_no=${m_no}&u_no=${loginVo.u_no}&nowPage=${pg.startPage - 1}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">
       [이전]
       </a>
     </c:if>
     
     <!-- 1 2 3 4 5 6 [7] 8 9 10  -->
    <c:forEach var="pageNumber" begin="${pg.startPage}" end="${pg.endPage}" step="1">
    <c:choose>
        <c:when test="${pageNumber eq pg.nowPage}">
            <strong>${pageNumber}</strong>&nbsp;&nbsp;
        </c:when>
        <c:otherwise>
            <a href="/SearchArticles?m_no=${m_no}&u_no=${loginVo.u_no}&nowPage=${pageNumber}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">
                ${pageNumber}
            </a>&nbsp;&nbsp;
        </c:otherwise>
    </c:choose>
</c:forEach>
     
     <!-- 다음 / 마지막 -->
     <c:if test="${ pg.nowPage ne endPage }">
       <a href="/SearchArticles?m_no=${m_no}&u_no=${loginVo.u_no}&nowPage=${ pg.nowPage + 1 }&searchOption=${searchOption}&searchKeyword=${searchKeyword}">
       [다음]
       </a>
       <a href="/SearchArticles?m_no=${m_no}&u_no=${loginVo.u_no}&nowPage=${pg.lastPage}&searchOption=${searchOption}&searchKeyword=${searchKeyword}">마지막</a>
     </c:if>    
     
      </td>
     </tr>    
    </table>   
  </div>
  
  
  
  
  
  
  
  
  