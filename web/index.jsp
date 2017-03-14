<%--
  Created by IntelliJ IDEA.
  User: Licoy
  Date: 2017/3/5 0005 11:04
  Url: https://www.licoy.cn
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>DWR</title>
      <style type="text/css">
          #box{
              background-color: white;
              height: 200px;
              width: 100%;
              padding-left: 0;
              overflow-y: scroll;
              position: relative;
              word-wrap: break-word;
              overflow-x: auto;
              text-align:left;
          }
      </style>

  </head>
  <body>


  <div id="box">

  </div>

  <br/>
  <hr>
  <input type="text" style="height: 60px;width: 500px" id="data" name='data' />
  <input type='button'  style="height: 60px;" id="button" value="发送">
  <script type='text/javascript' src='/dwr/util.js'></script>
  <script type='text/javascript' src='/dwr/engine.js'></script>
  <script type='text/javascript' src='/dwr/interface/service.js'></script>
  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script>

      $(document).ready(function(){
          // 页面加载的时候进行反转的激活
          dwr.engine.setActiveReverseAjax(true) ;

          // 点击页面按钮的时候触发的方法
          $("#button").click(function(){
              // 此类即为根据java文件生成的js文件
              var obj = $("#data");
              var data = document.getElementById("data").value;
              service.push(data);
              obj.val("");
          });
      });



      //////////////////////////////////////用于后台调取的函数
      function callback(msg){
          var box_obj = document.getElementById("box");
          box_obj.innerHTML = box_obj.innerHTML + msg + "<hr>";
          box_obj.scrollTop = box_obj.scrollHeight;
      }
  </script>

  </body>
</html>
