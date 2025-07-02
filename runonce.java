import java.sql.*;

public class runonce {
    public static void main(String[] args) throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/336project";
        String user = "root";
        String pass = "12345678";
        Connection conn = DriverManager.getConnection(url, user, pass);
        conn.close();
        System.out.println("connection established");
    }
}