package VideoBrowsing;

public class RegularVideo extends Video {
    public RegularVideo(int video_id, String videoFile, String title, String description, 
                       String category, String tags, String mature) {
        super(video_id, videoFile, title, description, category, tags, mature);
    }
    
    @Override
    public String play() {
        return "Playing: " + title;
    }
} 