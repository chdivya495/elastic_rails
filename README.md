# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version => ruby-3.0.0
* Rails version => 7.1.3
* Database => postgres
* To run the project
 => bundle install
 => rails db:create 
 => rails db:migrate
 => rails db:seed
 => rails server
 after running the server you have to login through this api
 endpoint-
 http://{host}/api/v1/users # for signup
 parameter to send { 1.name 2.username 3.email 4.password 5.password_confirmation}
 http://{host}/api/v1/auth/login # for login and then it generate the access token put the token in authorization header of your postman than it works.
 parameter to send {1.email 2.password}

 #To install elasticsearch 
 link1 - https://github.com/elastic/elasticsearch-rails
 #for implementation 
 link2 - https://iridakos.com/programming/2017/12/03/elasticsearch-and-rails-tutorial
link2
 => sudo systemctl start elasticsearch #to start elastric search & run the port 
 => sudo systemctl status elasticsearch #to check the server of elastic
 {
 	this link when you searched on server it show the elastic search result 
 	1. http://localhost:9200/courses_development/_search
  2. http://localhost:9200/verticals_development/_search
 	3. http://localhost:9200/categories_development/_search
 }

 