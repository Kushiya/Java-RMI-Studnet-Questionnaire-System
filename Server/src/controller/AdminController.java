package controller;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.sql.SQLException;
import java.util.List;

import model.Admin;
import repository.AdminRepository;
import Database_Layer.Database_Connection;

/**
 * the class implements all the methods defined in AdminRepositoy 
 * 
 *    
 */
public class AdminController extends UnicastRemoteObject implements AdminRepository {

	private static final long serialVersionUID = 1232651129714337505L;

	Database_Connection connection;

	public AdminController() throws RemoteException {
		super();

		connection = Database_Connection.getSingleConnection();
	}
	
	
	@Override
	public boolean delete(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return false;
	}
	
	
	@Override
	public List<Admin> findAll() throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * the method is used to find admin by its id 
	 * @param id	id of the Admin
	 * @return    
	 */
	@Override
	public Admin findById(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * the method is used to find an admin by name 
	 * @param id	id of the Admin
	 * @return  admin  
	 */
	@Override
	public Admin findByName(String name) throws RemoteException {
		String stat = "SELECT `id`, `username`, `password` FROM `Admins` WHERE `username`='" + name + "'";

		try {
			connection.query(stat);

			if (connection.resultSet.next()) {

				Admin admin = new Admin();

				admin.setId(connection.resultSet.getInt("id"));
				admin.setUserName(connection.resultSet.getString("username"));
				admin.setPassword(connection.resultSet.getString("password"));

				return admin;

			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public boolean insert(Admin user) throws RemoteException {
		// TODO Auto-generated method stub
		return false;
	}
	

	
	@Override
	public boolean update(Admin user) throws RemoteException {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	@Override
	public long count() throws RemoteException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean exists(int id) throws RemoteException {
		// TODO Auto-generated method stub
		return false;
	}

}
