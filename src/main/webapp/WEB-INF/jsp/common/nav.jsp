<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <nav>
            <ul class="menu">
                <li><a href="${pageContext.request.contextPath}/index" class="index"></a></li>
                <li>
                    <a class="board"></a>
                    <ul class="sub-menu">
                        <li><a href="${pageContext.request.contextPath}/board/notice" class="notice"></a></li>
                        <li><a href="${pageContext.request.contextPath}/board/free" class="free"></a></li>
                    </ul>
                </li>
                <li>
                    <a href="https://coronaboard.kr/">
                        <div>
                            <img src="${pageContext.request.contextPath}/img/exclamation-mark-2427336_1920.png">
                            코로나19 상황 안내
                        </div>
                    </a>
                </li>
            </ul>
        </nav>