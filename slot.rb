puts "スロットゲームへようこそ！！"
puts "残りコイン数：100"
puts "ポイント：0"

coin = 100
point = 0
  
loop do
  select = [10,30,50,"やめとく"]
    
  puts "何コイン入れますか？"
  puts "コインをたくさん入れるとコインとポイントがたくさんもらえるよ"
  puts "[0]10コイン,[1]30コイン,[2]50コイン,[3]やめとく"
      
  putin_coin = gets.to_i
    
  #ゲームパターン 
  #（選択肢以外を選択した場合/強制終了/コイン不足/ゲームスタート)
  
  if putin_coin >= 4
    next
    
  elsif 
    putin_coin == 3
    puts "ありがとうございました。ゲームを終了します。"
    break
    
  elsif coin < select[putin_coin]
    puts "---#{select[putin_coin]-coin}コイン足りません。---"
    puts "残りのコイン数：#{coin}"
    puts ""
    next
    
  else
    coin -= select[putin_coin]
    puts "チャリン！！残りのコイン数：#{coin}"
    puts ""
    puts "ゲームスタート！！"
  end

#スロットの数字
  num1 = rand(1..2)
  num2 = rand(7..8)
  num3 = rand(1..2)
  num4 = rand(1..2)
  num5 = rand(7..8)
  num6 = rand(1..2)
  num7 = rand(1..2)
  num8 = rand(7..8)
  num9 = rand(1..2)
      
  puts "エンターを３回押して数字を揃えよう"
  puts = gets
  puts "-------------"
  puts "|#{num1}| | |"
  puts "|#{num2}| | |"
  puts "|#{num3}| | |"
  puts "-------------"
  puts = gets
  puts "|#{num1}|#{num4}| |"
  puts "|#{num2}|#{num5}| |"
  puts "|#{num3}|#{num6}| |"
  puts "-------------"
  puts = gets
  puts "|#{num1}|#{num4}|#{num7}|"
  puts "|#{num2}|#{num5}|#{num8}|"
  puts "|#{num3}|#{num6}|#{num9}|"
    
  #大当たり
  big_hit = (num1 == 7) && (num4 == 7) && (num7 == 7) || 
            (num2 == 7) && (num5 == 7) && (num8 == 7) ||
            (num3 == 7) && (num6 == 7) && (num9 == 7) ||
            (num1 == 7) && (num5 == 7) && (num9 == 7) ||
            (num3 == 7) && (num5 == 7) && (num7 == 7)
  
  #当たり
  hit = (num1 == num4) && (num4 == num7) || 
        (num2 == num5) && (num5 == num8) ||
        (num3 == num6) && (num6 == num9) ||
        (num1 == num5) && (num5 == num9) ||
        (num3 == num5) && (num5 == num9) 

 #当たりの種類（1倍、3倍、5倍）
  
  get_coin = 100
  get_point =50
  
  case big_hit
  when putin_coin == 0
    get_coin *= 1
    get_point *= 1
  when putin_coin == 1
    get_coin *= 3
    get_point *= 3
  when putin_coin == 2
    get_coin *= 5
    get_point *= 5
  end
  
  #big_hitの半分のコインとポイントがもらえる
  case hit
  when putin_coin == 0
    get_coin *= 1 / 2
    get_point *= 1 / 2
  when putin_coin == 1
    get_coin *= 3 / 2
    get_point *= 3 / 2
  when putin_coin == 2
    get_coin *= 5 / 2
    get_point *= 5 / 2
  end
  
  
  if big_hit
    puts "ラッキーセブン！777！おめでとうございます！！"
    puts ""
    
    puts "コインを#{get_coin}枚獲得しました"
    puts "ポイントを#{get_point}ポイント獲得しました"
    coin += get_coin
    point += get_point
    
    puts "残りのコイン数：#{coin}"
    puts "これまでに獲得したポイント：#{point}"
  
    
  elsif hit
    puts "数字が揃いました！おめでとうございます！！"
    puts ""
    puts "コイン#{get_coin}枚獲得しました"
    puts "ポイントを#{get_point}ポイント獲得しました"
    coin += get_coin
    point += get_point
    
    puts "残りのコイン数：#{coin}"
    puts "これまでに獲得したポイント：#{point}"
    
  else
    puts "残念"
    puts ""
    puts "残りのコイン数：#{coin}"
    puts "これまでに獲得したポイント：#{point}"
    puts ""
    
    #コインが０枚になったら終了
    if coin == 0
      puts "コインがなくなりました。ゲーム終了です。"
      break
    end
  end
end
