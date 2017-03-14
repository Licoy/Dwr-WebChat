package com.demo;

import org.directwebremoting.*;
import org.directwebremoting.event.ScriptSessionEvent;
import org.directwebremoting.event.ScriptSessionListener;
import org.directwebremoting.extend.ScriptSessionManager;

import java.util.*;

/*
 * Created by Licoy on 2017/3/5 0005.
 */
public class Dwr_Demo {

    //记录所有在线的ScriptSession

    private final static List<ScriptSession> SESSIONS = new ArrayList<ScriptSession>();

    static{
        //得到DWR容器

        Container container = ServerContextFactory.get().getContainer();
        //从DWR中得到会话管理器

        ScriptSessionManager manager = container.getBean(ScriptSessionManager.class);
        //创建一个会话监听器

        ScriptSessionListener ssl = new ScriptSessionListener() {
            @Override
            public void sessionCreated(ScriptSessionEvent ev) {
                SESSIONS.add(ev.getSession());
                System.out.println("用户接入:"+SESSIONS.size());
            }
            @Override
            public void sessionDestroyed(ScriptSessionEvent ev) {
                SESSIONS.remove(ev.getSession());
                System.out.println("用户断开:"+SESSIONS.size());
            }
        };
        //为管理器添加监听

        manager.addScriptSessionListener(ssl);
    }

    public void push(String content) throws Exception{

        //得到当前用户的ScriptSession
        ScriptSession seft = WebContextFactory.get().getScriptSession();

        for(ScriptSession session : SESSIONS){
            //设置消息是否当前用户
            if(session.equals(seft)){
                continue;
            }
            //创建缓存脚本，执行指定function并传递参数

            ScriptBuffer script = new ScriptBuffer();
            script.appendCall("callback", content);
            //把脚本添加到会话中使其生效

            session.addScript(script);
        }
    }
}
