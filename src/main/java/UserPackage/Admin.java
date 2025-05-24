package UserPackage;

import java.util.ArrayList;
import java.util.List;

import UserPackage.UserModel.User;

public class Admin extends User {

	private String role;
    private List<String> permissions;

    public Admin() {
        super();
        this.permissions = new ArrayList<>();
        this.role = "admin";
    }

    public Admin(String userId, String firstName, String lastName, String username, String email, String password,
			String profilePicture, String userType) {
        super(userId, firstName, lastName, username, email, password, profilePicture,userType);
        this.permissions = new ArrayList<>();
        this.role = "admin";
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public List<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<String> permissions) {
        this.permissions = permissions;
    }
	
	

}
