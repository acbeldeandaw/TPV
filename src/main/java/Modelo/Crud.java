package Modelo;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author DAW-A
 */
public class Crud {
    
    public static List<Productos> getProductos() {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("my_persistence_unit");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT * FROM productos";
        Query q = manager.createNativeQuery(sql,Productos.class); //método para consultas en SQL
        List<Productos> productosBD =  q.getResultList();

        return productosBD;        
    }
    
    public static Productos getProducto(int id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("my_persistence_unit");
        EntityManager manager = factory.createEntityManager();
        String sql = "SELECT p FROM Productos p WHERE p.id=" + id; //consulta en JPQL 
        Query q = manager.createQuery(sql,Productos.class); //método para consultas en JPQL
        Productos productosBD =  ( Productos )q.getSingleResult();
        return productosBD;
    }
    
    public static int destroyProducto(int id) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("my_persistence_unit");
        EntityManager manager = factory.createEntityManager();
        String sql = "DELETE from Productos p WHERE p.id = " + id;
        Query q = manager.createQuery(sql);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate(); //para las consultas de modif. datos se usa el método executeUpdate
        manager.getTransaction().commit();
        return filasAfectadas;  
    }
    
    public static int updateProducto(Productos prod) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("my_persistence_unit");
        EntityManager manager = factory.createEntityManager();
        String sql = "UPDATE Productos p "
                + "SET p.nombre = '" + prod.getNombre()
                + "', p.imagen = '" + prod.getImagen()
                + "', p.categoria = '" + prod.getCategoria()
                + "', p.precio = '" + prod.getPrecio()
                + "' WHERE p.id = " + prod.getId();
        Query q = manager.createQuery(sql,Productos.class);
        manager.getTransaction().begin();
        int filasAfectadas = q.executeUpdate();
        manager.getTransaction().commit();
        //manager.close();
        return filasAfectadas;      
    }
    
    public static void insertProducto(Productos prod) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("my_persistence_unit");
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Productos producto = new Productos();
        producto.setNombre(prod.getNombre());
        producto.setImagen(prod.getImagen());
        producto.setCategoria(prod.getCategoria());
        producto.setPrecio(prod.getPrecio());
        manager.merge(producto);
        manager.getTransaction().commit();
    }
    
}
