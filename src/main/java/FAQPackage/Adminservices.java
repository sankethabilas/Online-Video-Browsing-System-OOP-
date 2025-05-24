package FAQPackage;

import java.sql.*;
import java.util.*;


public class Adminservices implements AdminOperations{

	//this function will be called in order to display *all* msgs (on admin panel page)
    public List<contactmodel> getAllMessages() {
    	
        List<contactmodel> list1 = new ArrayList<>();
        
        try {
            String query = "SELECT * FROM contacttable";
            Statement st = DBConnection.getConnection().createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                contactmodel cm = new contactmodel();
                cm.setId(rs.getInt("id"));
                cm.setFname(rs.getString("fname"));
                cm.setLname(rs.getString("lname"));
                cm.setEmail(rs.getString("email"));
                cm.setPhone(rs.getInt("phone"));
                cm.setMsg(rs.getString("message"));
                cm.setReply(rs.getString("reply"));
                cm.setIsfaq(rs.getBoolean("isfaq"));
                list1.add(cm);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list1;
    }
    
  //function of getting msgs *which are selected to the faq section* by the admin (on contact page)
    public List<contactmodel> getFaqMessages() { 
        List<contactmodel> list2 = new ArrayList<>();
        try {
            String query = "SELECT * FROM contacttable WHERE isfaq=true";
            Statement st = DBConnection.getConnection().createStatement();
            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                contactmodel cm = new contactmodel();
                cm.setId(rs.getInt("id")); 
                cm.setFname(rs.getString("fname"));
                cm.setMsg(rs.getString("message"));
                cm.setReply(rs.getString("reply"));
                list2.add(cm);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list2;
    }

    public void updateReply(int id, String reply) {
        try {
            String query = "UPDATE contacttable SET reply='" + reply + "' WHERE id=" + id;
            Statement st = DBConnection.getConnection().createStatement();
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void markAsFaq(int id) {
        try {
            String query = "UPDATE contacttable SET isfaq=true WHERE id=" + id;
            Statement st = DBConnection.getConnection().createStatement();
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void deleteById(int id) {
        try {
            String query = "DELETE FROM contacttable WHERE id=" + id;
            Statement st = DBConnection.getConnection().createStatement();
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void unmarkAsFaq(int id) {
        try {
            String query = "UPDATE contacttable SET isfaq=false WHERE id=" + id;
            Statement st = DBConnection.getConnection().createStatement();
            st.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}