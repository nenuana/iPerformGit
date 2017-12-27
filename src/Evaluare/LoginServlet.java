
package Evaluare;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
        urlPatterns = {"/login"}
)
public class LoginServlet extends HttpServlet {
    public LoginServlet() {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        try {
            String idToken = req.getParameter("id_token");
            String email = req.getParameter("email");
            String Name = req.getParameter("Name");
            String poza = req.getParameter("poza");
            System.out.println("User email: " + email);
            HttpSession session = req.getSession(true);
            session.setAttribute("email", email);
            session.setAttribute("Name", Name);
            session.setAttribute("poza", poza);
            req.getRequestDispatcher("/home").forward(req, resp);
        } catch (Exception var8) {
            throw new RuntimeException(var8);
        }
    }
}
