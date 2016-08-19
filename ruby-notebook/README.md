# 環境構築

ruby-numo/narray
ruby-numo/linalg

をつかうとき，

```
gem install narray
```

したnarrayではlinalgのインストールができない（narray.h not foundとなる）．

そのため，ここではnarrayとlinalgの両方を手元でビルドすることにしている（綺麗にbundle installする方法があったら教えて下さい）．

IRubyのカーネルが死んだりしてしんどい．環境構築は以下のコマンドをつかってやってる． (ref: http://104.155.147.108/user/3655a5b7ef32a67dbfe3a1c8d24bbe01/edit/Dockerfile thanks to @kozo2)

```
git clone git://github.com/ruby-numo/narray; git clone git://github.com/ruby-numo/linalg; 
gem update --no-document --system
gem install --no-document bundler daru iruby nyaplot pry rbczmq
cd narray
gem build numo-narray.gemspec
gem install numo-narray-0.9.0.2.gem
cd ../linalg
rake build
gem install pkg/numo-linalg-0.0.1.gem -- --with-openblas
iruby register
```



### openblas

numo-linalgはLAPACKもしくはOpenBLASが必要です．

私は/optにビルドしています．

```
git clone git@github.com:xianyi/OpenBLAS.git
cd OpenBLAS; make PREFIX=/opt/OpenBlas; make PREFIX=/opt install
```


# つかっている外部ライブラリ

Gemfileで管理したい...（numo関係が解決したら...）

```
gem install 'stopwords'
```
