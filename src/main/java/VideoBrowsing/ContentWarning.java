package VideoBrowsing;

public abstract class ContentWarning {
    protected String message;
    protected String description;
    
    // Constructor to initialize message and description
    public ContentWarning(String message, String description) {
        this.message = message;
        this.description = description;
    }
    
    public abstract String displayWarning();
}