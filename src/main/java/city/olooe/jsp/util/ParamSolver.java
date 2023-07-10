package city.olooe.jsp.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import city.olooe.jsp.domain.Member;

public class ParamSolver {
	public static <T> T getParams(HttpServletRequest req, Class<T> clazz) {

//		리스트에 들어갈 대상 : 제너릭

//		인스턴스 생성
		T t = null;
		try {
			t = clazz.getDeclaredConstructor().newInstance();
			// 선언 필드에 대한 타입 및 이름 체크
			Field[] field = clazz.getDeclaredFields(); // 선언한 필드만 호출

			for (Field f : field) {
				String fieldName = f.getName();
				String setterName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
				Method[] methods = clazz.getDeclaredMethods();
				for (Method m : methods) {
					if (setterName.equals(m.getName())) {
						if(req.getParameter(fieldName) == null) {
							continue;
						}
						if(f.getType() == int.class || f.getType() == Integer.class) {
							m.invoke(t,  Integer.parseInt(req.getParameter(fieldName)));
						}
						else if(f.getType() == String.class) {
							m.invoke(t, req.getParameter(fieldName));
						}
						else if(f.getType() == String[].class) {
							m.invoke(t, (Object)req.getParameterValues(fieldName));
						}
						else if(f.getType() == Long.class || f.getType() == long.class) {
							m.invoke(t, Long.valueOf(req.getParameter(fieldName)));
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
	
	private static String getTodayStr() {
		return new SimpleDateFormat("yyyy/MM/dd").format(System.currentTimeMillis());
	}

	
	public static boolean isLogin(HttpServletRequest req) {
		return req.getSession().getAttribute("member") != null;
	}
	
	public static boolean isMine(HttpServletRequest req, String writer) {
		return isLogin(req) && ((Member)req.getSession().getAttribute("member")).getId().equals(writer);
	}

}
