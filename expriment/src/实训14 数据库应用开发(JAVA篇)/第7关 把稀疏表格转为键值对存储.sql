import java.sql.*;

public class Transform {
    static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sparsedb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=UTF8&useSSL=false&serverTimezone=UTC";
    static final String USER = "root";
    static final String PASS = "123123";
    /**
     * 向sc表中插入数据
     *
     */
    public static int insertSC(Connection connection,int sno, String col_name, String col_value)throws Exception{
        String sqlstr = "insert into sc values(?,?,?)";
        PreparedStatement pps = connection.prepareStatement(sqlstr);
        pps.setString(1,Integer.toString(sno));
        pps.setString(2,col_name);
        pps.setString(3,col_value);
        return pps.executeUpdate();
    }

    public static void main(String[] args)throws Exception{
        Class.forName(JDBC_DRIVER);
        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);
        String[] subjects={"chinese","math","english","physics","chemistry","biology","history","geography","politics"};
        Statement statement=connection.createStatement();
        String sqls="select* from entrance_exam";
        ResultSet rs=statement.executeQuery(sqls);
        while(rs.next())
        {
            int sno=Integer.parseInt(rs.getString("sno"));
            for(int i=0;i<9;i++){
                String col_name=subjects[i];
                String col_value=rs.getString(subjects[i]);
                if(col_value != null)
                    insertSC(connection,sno,col_name,col_value);
            }
        }
    }
}