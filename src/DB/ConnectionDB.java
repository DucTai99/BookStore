package DB;

import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class ConnectionDB {
    //    static Connection con;
    public static ConnectionPool pool;

    public static Connection connect() throws ClassNotFoundException, SQLException, SQLException {
        Connection con = null;
        if (pool == null) {
            pool = BasicConnectionPool.create("jdbc:mysql://localhost:3306/bookstore?useUnicode=" +
                    "true&characterEncoding=utf-8", "root", "");
        }
        con = pool.getConnection();
//        System.out.println("Size of connection pool: "+ pool.getNumCon());
//        System.out.println("Size of used connection: "+ pool.getUsesCon());
        return con;
    }
}
