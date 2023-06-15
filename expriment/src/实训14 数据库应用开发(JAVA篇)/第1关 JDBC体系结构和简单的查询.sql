/* 请在适当的位置补充代码，完成指定的任务 
   提示：
      try {


      } catch
    之间补充代码  
*/
import java.sql.*;

public class Client {
    public static void main(String[] args) {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/finance?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC","root","123123");
            statement = connection.createStatement();
            String sqlstr = "select c_name,c_mail,c_phone from client where c_mail is not null";
            ResultSet rs = statement.executeQuery(sqlstr);
            System.out.print("姓名\t");
            System.out.print("邮箱\t\t\t\t");
            System.out.println("电话");
            while(rs.next()){
                System.out.print(rs.getString("c_name")+"\t");
                System.out.print(rs.getString("c_mail")+"\t\t");
                System.out.println(rs.getString("c_phone"));
            }
 
 
 
         } catch (ClassNotFoundException e) {
            System.out.println("Sorry,can`t find the JDBC Driver!"); 
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }

                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
