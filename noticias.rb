require 'httparty'
class Mashable
    include HTTParty
    base_uri 'http://mashable.com/stories.json?limit=10'
    def noticia
      news = self.class.get('')
      return news
    end
    def feeds news
      noticia = news
      noticia["hot"].each do |e|
        puts "Title: #{e["title"]}"
        puts "Author: #{e["author"]}" 
        puts "Date: #{e["post_date"]}"
        puts "Link: #{e["link"]}\n\n"
      end
    end
    def title news
      noti = news
      noti["hot"].each do |e|
        puts "Title: #{e["title"]}\n\n"
      end
    end
    def author news
      noti = news
      noti["hot"].each do |e|
        puts "Author: #{e["author"]}\n\n"
      end
    end
    def date news
      noti = news
      noti["hot"].each do |e|
        puts "Date: #{e["post_date"]}\n\n"
      end
    end
    def link news
      noti = news
      noti["hot"].each do |e|
        puts "Link: #{e["link"]}\n\n"
      end
    end
  def menu
    puts "Que parte de las noticias quieres?"
    puts "Selecciona:\n1 para el Titulo\n2 para el Autor\n3 para la fecha\n4 para el Link\n5 para ver todos los datos de cada noticia"
    res = gets.chomp
    if res != "1" && res != "2" && res != "3" && res != "4" && res != "5"
      puts "seleccionaste una opcion valida"
    end
    return res
  end
end 
class Reddit
    include HTTParty
    base_uri 'http://www.reddit.com/.json'
    def noticia
      news = self.class.get('')
      return news
    end
    def feeds news
      noticia = news
      noticia["data"]["children"].each do |e|
        puts "Title: #{e["data"]["title"]}"
        puts "Author: #{e["data"]["author"]}" 
        puts "Date: #{e["data"]["created_utc"]}"
        puts "Link: #{e["data"]["url"]}\n\n"
      end
    end
    def title news
      noti = news
      noti["data"]["children"].each do |e|
        puts "Title: #{e["data"]["title"]}\n\n"
      end
    end
    def author news
      noti = news
      noti["data"]["children"].each do |e|
        puts "Author: #{e["data"]["author"]}\n\n"
      end
    end
    def date news
      noti = news
      noti["data"]["children"].each do |e|
        puts "Date: #{e["data"]["created_utc"]}\n\n"
      end
    end
    def link news
      noti = news
      noti["data"]["children"].each do |e|
        puts "Link: #{e["data"]["url"]}\n\n"
      end
    end
  def menu
    puts "Que parte de las noticias quieres?"
    puts "Selecciona:\n1 para el Titulo\n2 para el Autor\n3 para la fecha\n4 para el Link\n5 para ver todos los datos de cada noticia"
    res = gets.chomp
    if res != "1" && res != "2" && res != "3" && res != "4" && res != "5"
      puts "seleccionaste una opcion invalida"

    end
    return res
  end
end 
class Digg
    include HTTParty
    base_uri 'http://digg.com/api/news/popular.json'
    def noticia
      news = self.class.get('')
      return news
    end
    def feeds news
      noticia = news
      noticia["data"]["feed"].each do |e|
        puts "Title: #{e["content"]["title"]}"
        puts "Author: #{e["content"]["author"]}" 
        puts "Date: #{e["content"]["created_utc"]}"
        puts "Link: #{e["content"]["url"]}\n\n"
      end
    end
    def title news
      noti = news
      noti["data"]["feed"].each do |e|
        puts "Title: #{e["content"]["title"]}\n\n"
      end
    end
    def author news
      noti = news
      noti["data"]["feed"].each do |e|
        puts "Author: #{e["content"]["author"]}\n\n"
      end
    end
    def date news
      noti = news
      noti["data"]["feed"].each do |e|
        puts "Date: No disponible.\n\n"
      end
    end
    def link news
      noti = news
      noti["data"]["feed"].each do |e|
        puts "Link: #{e["content"]["url"]}\n\n"
      end
    end
  def menu
    puts "Que parte de las noticias quieres?"
    puts "Selecciona:\n1 para el Titulo\n2 para el Autor\n3 para la fecha\n4 para el Link\n5 para ver todos los datos de cada noticia"
    res = gets.chomp
    if res != "1" && res != "2" && res != "3" && res != "4" && res != "5"
      puts "seleccionaste una opcion invalida"

    end
    return res
  end
end 
def main
  puts "De que sitio quieres descargar las noticias?"
  puts "Selecciona:\n1 para Mashable\n2 para Reddit\n3 para Digg"
  site = gets.chomp
  if site == "1"
    mashable = Mashable.new
    selec = mashable.menu
    news = mashable.noticia
    if selec == "1"
      mashable.title(news)
    elsif selec == "2"
      mashable.author(news)
    elsif selec == "3"
      mashable.date(news)
    elsif selec == "4"
      mashable.link(news)
    elsif selec == "5"
      mashable.feeds(news)
    end
  elsif site == "2"
    reddit = Reddit.new
    selec = reddit.menu
    news = reddit.noticia
    if selec == "1"
      reddit.title(news)
    elsif selec == "2"
      reddit.author(news)
    elsif selec == "3"
      reddit.date(news)
    elsif selec == "4"
      reddit.link(news)
    elsif selec == "5"
      reddit.feeds(news)
    end
  elsif site == "3"
    digg = Digg.new
    selec = digg.menu
    news = digg.noticia
    if selec == "1"
      digg.title(news)
    elsif selec == "2"
      digg.author(news)
    elsif selec == "3"
      digg.date(news)
    elsif selec == "4"
      digg.link(news)
    elsif selec == "5"
      digg.feeds(news)
    end
  end  
end

main
