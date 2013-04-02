class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end

  def showcase_service(text)
    "here you are "+text
  end

  def sd_service(text1,text2)
    Movie.where(text1 => text2)
  end
end
