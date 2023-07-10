package city.olooe.jsp.service;

import com.google.gson.Gson;

import city.olooe.jsp.domain.Member;

public class Test {
	public static void main(String[] args) {
		Member m = new Member();
		m.setAddress("hello address");
		m.setEmail("hi emain");
		
		Gson g = new Gson();
		String toJson = g.toJson(m);
		System.out.println(toJson);
	}
}
