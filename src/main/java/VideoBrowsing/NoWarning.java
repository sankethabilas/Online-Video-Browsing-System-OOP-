package VideoBrowsing;

public class NoWarning extends ContentWarning {
    public NoWarning() {
        super("", "");
    }
    
    @Override
    public String displayWarning() {
        return "";
    }
}