package FAQPackage;

import java.sql.Statement;

public class contactservices extends ContactOperations {

	public void insertdetails(contactmodel cm) {
		try {
			String query = "INSERT INTO contacttable(fname,lname,email,phone,message) values('"+cm.getFname()+"','"+cm.getLname()+"','"+cm.getEmail()+"','"+cm.getPhone()+"','"+cm.getMsg()+"')";
			
			Statement st = DBConnection.getConnection().createStatement();
			st.executeUpdate(query);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}