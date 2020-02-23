package controller;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Database_Layer.Database_Connection;
import model.Category;
import repository.CategoryRepository;


/**
 * the class implements all the methods defined in CategoryRepositoy 
 * 
 *    
 */
public class CategoryController extends UnicastRemoteObject implements CategoryRepository {

	private static final long serialVersionUID = -3772346455166787108L;

	Database_Connection connection;
	
//constructor
	
	public CategoryController() throws RemoteException {
		super();

		connection = Database_Connection.getSingleConnection();
	}

	/**
	 * the method is used to get a category by its id 
	 * @param id	id of the Category
	 * @return Category   
	 */
	@Override
	public Category getCategory(int id) throws RemoteException {
		String stat = "SELECT `id`, `Category`, `description` FROM `Question_Categories` WHERE `id`=" + id + ";";

		try {
			connection.query(stat);

			if (connection.resultSet.next()) {

				Category category = new Category();

				category.setId(connection.resultSet.getInt("id"));
				category.setCategory_name(connection.resultSet.getString("Category"));
				category.setDescription(connection.resultSet.getString("description"));

				return category;

			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * the method is used to get all categories
	 * @param 
	 * @return Category  list  
	 */
	@Override
	public List<Category> getAllCategory() throws RemoteException {
		List<Category> list = new ArrayList<Category>();

		String stat = "SELECT `id`, `Category`, `description` FROM `Question_Categories`;";

		try {
			connection.query(stat);

			while (connection.resultSet.next()) {

				Category category = new Category();

				category.setId(connection.resultSet.getInt("id"));
				category.setCategory_name(connection.resultSet.getString("Category"));
				category.setDescription(connection.resultSet.getString("description"));

				list.add(category);

			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}

		return list;
	}

}
