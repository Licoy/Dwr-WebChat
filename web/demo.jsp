<%--
  Created by IntelliJ IDEA.
  User: Licoy
  Date: 2017/3/5 0005 11:20
  Url: https://www.licoy.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>聊天DEMO</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="chat">
    <div class="main">
        <div id="massage" class="m-message">
            <ul>
                <li>
                    <p class="time">
                        <span>
                            系统消息
                        </span>
                    </p>
                    <div class="mian-self">
                        <img class="avatar" width="30" height="30" src="images/default-avatar.jpg">
                        <div class="text">
                            欢迎来到聊天室~
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="m-text">
            <textarea id="input_text" placeholder="按 Ctrl + Enter 发送"></textarea>

           <%-- <button type="button" id="send_message">发送</button>--%>
        </div>
        <div style="clear: both"></div>
    </div>
</div>
<script type='text/javascript' src='/dwr/util.js'></script>
<script type='text/javascript' src='/dwr/engine.js'></script>
<script type='text/javascript' src='/dwr/interface/service.js'></script>
<script type='text/javascript' src="js/jquery.min.js"></script>
<script type='text/javascript' src="js/chat.js"></script>
</body>
</html>
