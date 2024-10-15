<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${board.orderTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
</head>
<body>
    <c:if test="${not empty board}">
        <h1>${board.orderTitle}</h1>
        <p>업체: ${board.entpName}</p>
        <p>의뢰일자: ${board.requestDate}</p>
        <h2>의뢰 내용</h2>
        <p>${board.orderContent}</p>

        <h2>자재 목록</h2>
        <c:if test="${not empty board.materialList}">
            <ul>
                <c:forEach var="material" items="${board.materialList}">
                    <li>${material.materialName} - 수량: ${material.materialVolume}</li>
                </c:forEach>
            </ul>
        </c:if>
        <c:if test="${empty board.materialList}">
            <p>자재 목록이 없습니다.</p>
        </c:if>

        <div>
            <a href="/proj/boardEditView/${board.orderNo}">수정</a>
            <form action="/proj/boardDelete/${board.orderNo}" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <input type="submit" value="삭제" />
            </form>
        </div>
    </c:if>
    <c:if test="${empty board}">
        <p>게시글을 찾을 수 없습니다.</p>
    </c:if>
</body>
</html>
