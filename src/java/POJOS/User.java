package POJOS;
// Generated Mar 27, 2018 5:52:23 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer iduser;
     private String name;
     private String email;
     private String mobile;
     private Set logins = new HashSet(0);
     private Set ads = new HashSet(0);

    public User() {
    }

    public User(String name, String email, String mobile, Set logins, Set ads) {
       this.name = name;
       this.email = email;
       this.mobile = mobile;
       this.logins = logins;
       this.ads = ads;
    }
   
    public Integer getIduser() {
        return this.iduser;
    }
    
    public void setIduser(Integer iduser) {
        this.iduser = iduser;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getMobile() {
        return this.mobile;
    }
    
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public Set getLogins() {
        return this.logins;
    }
    
    public void setLogins(Set logins) {
        this.logins = logins;
    }
    public Set getAds() {
        return this.ads;
    }
    
    public void setAds(Set ads) {
        this.ads = ads;
    }




}


