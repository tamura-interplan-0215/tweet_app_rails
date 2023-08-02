FROM ruby:3.2.2
# ベースにするイメージを指定

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim
# RailsのインストールやMySQLへの接続に必要なパッケージをインストール

RUN mkdir /tweet_app
# コンテナ内にmyappディレクトリを作成

WORKDIR /tweet_app
# 作成したmyappディレクトリを作業用ディレクトリとして設定

COPY Gemfile /tweet_app//Gemfile
COPY Gemfile.lock /tweet_app//Gemfile.lock
# ローカルの Gemfile と Gemfile.lock をコンテナ内のmyapp配下にコピー

RUN bundle install
# コンテナ内にコピーした Gemfile の bundle install

COPY . /tweet_app/app
# ローカルのmyapp配下のファイルをコンテナ内のmyapp配下にコピー
