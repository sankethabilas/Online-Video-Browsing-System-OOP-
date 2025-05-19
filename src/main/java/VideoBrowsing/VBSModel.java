package VideoBrowsing;

public class VBSModel {
	private int video_id;
	private String videoFile;
	private String title;
	private String description;
	private String category;
	private String tags;
	private String mature;
	
	
	
	public VBSModel(int video_id, String videoFile, String title, String description, String category, String tags, String mature) {
		super();
		this.video_id = video_id;
		this.videoFile = videoFile;
		this.title = title;
		this.description = description;
		this.category = category;
		this.tags = tags;
		this.mature = mature;
	}


	public int getVideo_id() {
		return video_id;
	}


	public void setVideo_id(int video_id) {
		this.video_id = video_id;
	}


	public String getVideoFile() {
		return videoFile;
	}


	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getTags() {
		return tags;
	}


	public void setTags(String tags) {
		this.tags = tags;
	}


	public String getMature() {
		return mature;
	}


	public void setMature(String mature) {
		this.mature = mature;
	}





	
	
	
	
	
	
	
}
