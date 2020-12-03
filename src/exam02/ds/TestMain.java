package exam02.ds;

import java.sql.Connection;

public class TestMain {

	public static void main(String[] args) {
		Connection con = JdbcUtil.getConnection();
		System.out.println("con >> " + con);

	}

}
