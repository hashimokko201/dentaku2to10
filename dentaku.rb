require 'sinatra'

set :environment, :production

get '/' do
  erb :index
end

=begin
post '/push' do
  puts "2進数を入力してください、10進数に変換します。"
  "#{params[:num]}"
end
=end

post '/push' do
  #puts "2進数を入力してください、10進数に変換します。"
  str = params[:num].split("")
  int = []
  for n in str
    int.push(n.to_i)
  end

  nod = int.length

  int2 = []

  int.each do |i|
    int2.push(i*(2**(nod-1)))
    nod = nod-1
  end

  "#{params[:num]} = #{int2.join('+')}
  <br>
  <br>
  = #{int2.sum}
  <br>
  <br>
  <a href='/'>Back</a>"
end

