
package Evaluare;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(
        urlPatterns = {"/Iesire"}
)
public class IesireEchipa extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public IesireEchipa() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



            try {
                HttpSession session = request.getSession(true);
                String email = (String)session.getAttribute("email");


                request.getSession().removeAttribute("emailechipa");


                RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
                dispatcher.forward(request, response);



            } catch (Exception var234) {
                response.sendRedirect("/picturefail.jsp");
                throw new RuntimeException(var234);
            }
        }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
