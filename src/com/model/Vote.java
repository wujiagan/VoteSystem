package com.model;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Vote {
	private String id = null;
	private String theme;
	private int total;
	private List<Item> selectItems = new LinkedList<Item>();
	private int status = 0;
	
	private static final int VOTE_START = 0;
	private static final int VOTE_STOP= 0;
	
	public Vote(){};
	
	public Vote(String id){
		this.id = id;
	}
	public Vote(String id, String theme, int total){
		this.id = id;
		this.theme = theme;
		this.total = total;
	}
	public Vote(String id, String theme, int total, int status){
		this.id = id;
		this.theme = theme;
		this.total = total;
		this.status = status;
	}
	public String getTheme() {
		return theme;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public List<Item> getSelectItems() {
		return selectItems;
	}

	public void setSelectItems(List<Item> selectItems) {
		this.selectItems = selectItems;
	}

	public Vote addSelectItem(Item item) {
		this.selectItems.add(item);
		return this;
	}
	
	public boolean isStart() {
		return this.status == Vote.VOTE_START ;	
	}

	@Override
	public int hashCode() {
		return this.id.hashCode();
	}

	@Override
	public boolean equals(Object anObject) {
		 if (this == anObject) {
	            return true;
	        }
        if (anObject instanceof Vote) {
            Vote anotherVote = (Vote) anObject;
            return this.id.equals(anotherVote.getId());
        }
        return false;
	}

	@Override
	public String toString() {
		return this.theme + ":" + this.selectItems;
	}
	
	
	
}
