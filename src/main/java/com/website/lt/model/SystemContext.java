package com.website.lt.model;

public class SystemContext {
	private static ThreadLocal<Integer> offset = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> size = new ThreadLocal<Integer>();
	private static ThreadLocal<User> loginUser = new ThreadLocal<User>();
	private static ThreadLocal<String> realPath = new ThreadLocal<String>();
	
	
	
	public static String getRealPath() {
		return realPath.get();
	}
	public static void setRealPath(String _realPath) {
		realPath.set(_realPath);
	}
	public static void removeRealPath() {
		realPath.remove();
	}
	public static User getLoginUser() {
		return loginUser.get();
	}
	public static void setLoginUser(User _loginUser) {
		loginUser.set(_loginUser);
	}
	public static void removeLoginUser() {
		loginUser.remove();
	}
	public static Integer getOffset() {
		return offset.get();
	}
	public static void setOffset(int _offset) {
		SystemContext.offset.set(_offset);
	}
	public static void removeOffset() {
		SystemContext.offset.remove();
	}
	public static Integer getSize() {
		return size.get();
	}
	public static void setSize(int _size) {
		SystemContext.size.set(_size);
	}
	public static void removeSize() {
		SystemContext.size.remove();
	}
	
	
}
