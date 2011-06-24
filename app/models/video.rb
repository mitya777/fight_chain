class Video < ActiveRecord::Base

  belongs_to :technique
  

  def youtube_id
    if url.match(video_regex) then url.match(video_regex)[1]
    else "" end
  end

  private
 
  def video_regex 
    /youtube.com.*(?:\/|v=)(\w+)/
  end
  
end
