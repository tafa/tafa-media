
{apiXY, hashORM, AsyncJoin} = require 'tafa-misc-util'


module.exports = (app) ->
  
  #### Storage
  s = app.storage =
    item_metadata: 'redis'
    file_chunks: 'big_jv'
  
  Item = hashORM
    conn: s.item_metadata,
    newToken: () -> app.newToken 11
    keys:
      title: 1
      chunk_sizes: 2
  
  #### Routes
  app.get '/', (req, res, next) ->
    res.render 'index'
  
  app.get '/watch', (req, res, next) ->
    res.render 'items/watch'
  
  app.get '/search', (req, res, next) ->
    res.render 'items/results'
  
  app.get '/upload', (req, res, next) ->
    res.render 'items/upload'
  
  app.get '/api/v0.1/upload.js', apiXY, (req, res, next) ->
    
    join = new AsyncJoin
    chunk_sizes = []
    next_chunk_size = 0
    
    item = Item.create {
      title: null
      chunk_sizes: chunk_sizes
    }, join.newCallback()
    
    req.on 'data', (data) ->
      # TODO
    
    req.on 'end', () ->
      # TODO
      join.newCallback()
    
    join.whenDone () ->
      res.api {token: item.token}

