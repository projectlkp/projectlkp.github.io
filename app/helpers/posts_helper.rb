module PostsHelper
  def file_path(name)
    Time.now.strftime("%Y-%m-%d")+'-'+name.downcase.strip.gsub(' ', '-').gsub(/[!]|[$]|[(]|[)]|[;]|[&]|[*]|[@]|[#]|[%]|[']|[:]|[.]|[,]/, '')+'.markdown'
  end
  def post_header(name)
    <<-HEREDOC
---
layout: post
title:  #{name.capitalize.gsub(/[!]|[$]|[(]|[)]|[;]|[&]|[*]|[@]|[#]|[%]|[']|[:]|[.]|[,]/, ' ')}
date:   #{Time.now}
---
    HEREDOC
  end
end
