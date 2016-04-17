require 'sinatra'

get('/hello') do
  'Hello, web!'
end

get('/salut') do
  'Salut Web!'
end

get('/namaste') do
  'Namaste, web!'
end
