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
@WebServlet("/editProduct")
public class editProductController extends HttpServlet{
    EntityManagerFactory entityManagerFactory;
    EntityManager entityManager;

    public void init() {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
        entityManager = entityManagerFactory.createEntityManager();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Products product = entityManager.find(Products.class, id);
        if (product != null) {
            req.setAttribute("product", product);
            req.getRequestDispatcher("/page/editProduct.jsp").forward(req, resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Products product = entityManager.find(Products.class, id);
        if (product != null) {
            product.setName(req.getParameter("name"));
            product.setQuantity(Integer.parseInt(req.getParameter("quantity")));
            product.setDescription(req.getParameter("description"));
            product.setPrice(Double.parseDouble(req.getParameter("price")));
            product.setImage(req.getParameter("image"));
            product.setCategory(req.getParameter("category"));

            entityManager.getTransaction().begin();
            entityManager.merge(product);
            entityManager.getTransaction().commit();

            var products = entityManager.createQuery("SELECT p FROM Products p", Products.class).getResultList();
            req.setAttribute("products", products);
            req.getRequestDispatcher("/page/home.jsp").forward(req, resp);
        } else {
            // Handle case when product is not found
        }
    }

    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Products student = entityManager.find(Products.class, id);
        if (student != null) {
            entityManager.getTransaction().begin();
            entityManager.remove(student);
            entityManager.getTransaction().commit();
            req.getSession().setAttribute("message", "Student deleted successfully");
        } else {
            req.getSession().setAttribute("message", "Student not found");
        }
        resp.sendRedirect(req.getContextPath() + "/student");
    }

    public void destroy() {
            entityManagerFactory.close();
        }
    }


