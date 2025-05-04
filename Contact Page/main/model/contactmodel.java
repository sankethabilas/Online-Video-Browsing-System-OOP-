package model;

public class contactmodel {
    private int id;
    private String fname, lname, email, msg;
    private int phone;
    private String reply;
    private boolean isfaq;

    // Getters and Setters
    public int getId() { 
    	return id;
    }
    
    public void setId(int id) {
    	this.id = id; 
    }

    public String getFname() { 
    	return fname; 
    }
    
    public void setFname(String fname) { 
    	this.fname = fname; 
    }

    public String getLname() {
    	return lname; 
    }
    
    public void setLname(String lname) {
    	this.lname = lname; 
    }

    public String getEmail() { 
    	return email; 	
    }
    
    public void setEmail(String email) {
    	this.email = email; 
    }

    public int getPhone() {
    	return phone; 
    }
    
    public void setPhone(int phone) {
    	this.phone = phone; 
    }

    public String getMsg() { 
    	return msg; 
    }
    
    public void setMsg(String msg) { 
    	this.msg = msg; 
    }

    public String getReply() { 
    	return reply; 
    }
    
    public void setReply(String reply) {
    	this.reply = reply; 
    }

    public boolean isIsfaq() { 
    	return isfaq; 
    }
    
    public void setIsfaq(boolean isfaq) { 
    	this.isfaq = isfaq; 
    }
}
