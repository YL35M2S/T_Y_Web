package conn;

public abstract class DAO<T> {

	abstract boolean update(T obj); 
	abstract boolean delete(T obj);  

}
