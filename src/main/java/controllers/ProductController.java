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

@WebServlet("/product")
public class ProductController extends HttpServlet {
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
        req.getRequestDispatcher("/page/product.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));
        String image = req.getParameter("image");
        String category = req.getParameter("category");

        Products newProduct = new Products(id, name, description, price, quantity, image, category);
        entityManager.getTransaction().begin();
        entityManager.persist(newProduct);
        entityManager.getTransaction().commit();
        req.getSession().setAttribute("message", "Product added successfully");
        resp.sendRedirect(req.getContextPath() + "/product");

    }

    public void destroy() {
        entityManagerFactory.close();
    }



}
