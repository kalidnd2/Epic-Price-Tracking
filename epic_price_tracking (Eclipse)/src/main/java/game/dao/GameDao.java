package game.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import java.util.ArrayList;
import java.util.List;

import game.domain.Game;
import user.domain.User;




/**
 * DDL functions performed in database
 * @author changxin bai
 *
 */
public class GameDao {
	
	/**
	 * insert User
	 * @param user
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public void add(Game game) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/epic_tracking?"
				              + "user=root&password=");
			
			
			String sql = "insert into game(name,thumbnail,price) values(?,?,?)";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,game.getName());
		    preparestatement.setString(2,game.getThumbnail());
		    preparestatement.setString(3,game.getPrice());
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public List<Object> findall() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/epic_tracking?"
				              + "user=root&password=");
			
			
			String sql = "select * from game";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				Game game = new Game();
				game.setId(resultSet.getString("id"));
				game.setName(resultSet.getString("name"));
	    		game.setThumbnail(resultSet.getString("thumbnail"));
	    		game.setPrice(resultSet.getString("price"));
	    		list.add(game);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
		
	}
	
	public Game findById(String id) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		Game game = new Game();
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		    String sql = "select * from game where id=?";
			Connection connect = DriverManager
					.getConnection("jdbc:mysql://localhost:3306/epic_tracking?"
				              + "user=root&password=");
		    PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,id);
		    ResultSet resultSet = preparestatement.executeQuery();
		    //ResultSet resultSet  = preparestatement.executeUpdate();
		    while(resultSet.next()){
		    	String user_name = resultSet.getString("id");
		    	if(user_name.equals(id)){
		    		game.setId(resultSet.getString("id"));
		    		game.setName(resultSet.getString("name"));
		    		game.setThumbnail(resultSet.getString("thumbnail"));
		    		game.setPrice(resultSet.getString("price"));
		    		
		    	}
		    }
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return game;
	}
	
	public Game updateGame(Game game) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		
		try {		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    String sql = "UPDATE game SET name=?,thumbnail=?,price=? WHERE id = ?";
		Connection connect = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/epic_tracking?"
			              + "user=root&password=");
	    PreparedStatement preparestatement = connect.prepareStatement(sql); 
	    preparestatement.setString(1,game.getName());
	    preparestatement.setString(2,game.getThumbnail());
	    preparestatement.setString(3,game.getPrice());
	    preparestatement.setString(4,game.getId());
	    System.out.println(preparestatement.toString());
	    preparestatement.executeUpdate();

	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
	return game;
		
		
	}
	
	public Game deleteGame(Game game) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		
		try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	    String sql = "DELETE FROM game WHERE id = ? ";
		Connection connect = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/epic_tracking?"
			              + "user=root&password=");
	    PreparedStatement preparestatement = connect.prepareStatement(sql); 
	    preparestatement.setString(1,game.getId());
	    System.out.println(preparestatement.toString());
	    preparestatement.executeUpdate();

	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
	return game;
		
		
	}
	
	
		
}
