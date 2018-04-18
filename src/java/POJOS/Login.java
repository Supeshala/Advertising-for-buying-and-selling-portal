package POJOS;
// Generated Apr 11, 2018 10:47:42 AM by Hibernate Tools 4.3.1



/**
 * Login generated by hbm2java
 */
public class Login  implements java.io.Serializable {


     private Integer idlogin;
     private User user;
     private String email;
     private String password;

    public Login() {
    }

	
    public Login(User user) {
        this.user = user;
    }
    public Login(User user, String email, String password) {
       this.user = user;
       this.email = email;
       this.password = password;
    }
   
    public Integer getIdlogin() {
        return this.idlogin;
    }
    
    public void setIdlogin(Integer idlogin) {
        this.idlogin = idlogin;
    }
    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }




}


