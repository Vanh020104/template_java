package controllers;

import com.example.template_admin.entity.Products;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/home")
public class HomeControler extends HttpServlet {
    EntityManagerFactory entityManagerFactory;
    EntityManager entityManager;

    public void init() {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
        entityManager = entityManagerFactory.createEntityManager();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var products = entityManager.createQuery("SELECT p FROM Products p", Products.class).getResultList();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/page/home.jsp").forward(req, resp);
    }


}
