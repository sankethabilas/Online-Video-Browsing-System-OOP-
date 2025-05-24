package VideoBrowsing;

public class MatureWarning extends ContentWarning {
	// maturewarning constructor pass predefined details to parent class (mesage and description)
    public MatureWarning() {
        super("⚠️ Mature Content Warning", 
              "This video contains mature content");
    }
    
    @Override
    public String displayWarning() {
        return "<div class='mature-warning'>" +
               "<strong>" + message + "</strong>" +
               "<p>" + description + "</p>" +
               "</div>";
    }
}