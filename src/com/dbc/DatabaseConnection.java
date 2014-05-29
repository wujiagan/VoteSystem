package com.dbc;

import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseConnection {
	private static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/votedb?useUnicode=true&characterEncoding=utf-8";
	private static final String DBUSER = "shinn";
	private static final String DBPASSWORD = "1234";
	private Connection conn = null;
	public DatabaseConnection() throws Exception {
		Class.forName(DBDRIVER);
		this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);
	}
	public Connection getConnection() {
		return this.conn;
	}
	public void close() throws Exception {
		if(null == this.conn) {
			this.conn.close();
		}
	}
}
