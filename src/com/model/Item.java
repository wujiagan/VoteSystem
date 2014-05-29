package com.model;

public class Item {
	private String text;
	private String id;
	private int count;
	
	public Item() {
		super();
	}
	public Item(String id, String text, int count) {
		super();
		this.text = text;
		this.id = id;
		this.count = count;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public int hashCode() {
		return this.id.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(this == obj)
			return true;
		if(obj instanceof Item) {
			Item anotherItem = (Item)obj;
			return this.id.equals(anotherItem.getId());
		}
		return false;
	}
	@Override
	public String toString() {
		return this.text;
	}
	
}
