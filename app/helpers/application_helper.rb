module ApplicationHelper
  def markdown(text)
    options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
    Markdown.new(text, *options).to_html.html_safe
  end

  # Methods de traitement
  def str_time(post_time)
    post_time = post_time.to_time
    time = (Time.new - post_time).to_i
    
    if time < 60
      "A l'instant"
    elsif time >= 60 && time < 3600
      "Il y a #{time/60} min "
    else
      if post_time.day == Time.new.day
        "Aujourd'hui à #{post_time.strftime("%H:%M")}"
      elsif post_time.day == Time.new.day.to_i-1
        "Hier à #{post_time.strftime("%H:%M")}"
      else
        post_time.strftime("%d %b %Y à %H:%M")
      end
    end
  end


  def img?(type)
    ["JPG", "JPEG", "PNG", "GIF"].include?(type)
  end

  def video?(type)
    ["mp4"].include?(type)
  end


end
