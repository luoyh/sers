package com.my.app;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 
 * @author luoyh
 * @date Nov 1, 2016
 */
public final class Cache {
	
	private static Map<String, Object> cache = new ConcurrentHashMap<>();
	
	private static class Holder {
		private final static Cache instance = new Cache();
	}
	
	public static Cache getInstance() {
		return Holder.instance;
	}
	
	private Cache() {}
	
	public void put(String key, Object value) {
		cache.put(key, value);
	}

	public Object get(String key) {
		return cache.get(key);
	}

	public void clear() {
		cache.clear();
	}

	public void remove(String key) {
		cache.remove(key);
	}

}
