# MUJIN
MUJINのWeb用Repositoryです。  

# About
Ruby 2.5.1  
Rails 5.2.2  
仕様は仕様書を参考

# Build
1. Dockerをインストールする
2. $ docker-compose build
3. $ docker-compose run web rake db:create
4. $ docker-compose up
5. http://localhost:3000/

# Memo
rails g model User -> docker-compose run web rails g model User  
rake db:migrate -> docker-compose run web rake db:migrate

# Thanks to
https://qiita.com/shunichi_com/items/4a84476bfeec7c4cf623