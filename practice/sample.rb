# -*- coding: utf-8 -*-
###################################################################################################
#
# ちゅーんさんの色々と出来の悪い模範解答
# Rubyマトモに書くの初めてだから、テキトーな事しててもゴメンしてちょ
#
###################################################################################################

# 使用するライブラリの読み込み
require 'readline'

# 設問を保持するクラス／てか構造体替わり
# Structとかいうのもあるらしいけど書いちゃったからこれで
class Question
  
  # 初期化メソッド
  def initialize(no, is_goal, msg, yes_path, no_path)
    @no       = no
    @is_goal  = is_goal
    @msg      = msg
    @yes_path = yes_path
    @no_path  = no_path
  end

  # アクセサ定義
  attr_accessor :no, :is_goal, :msg, :yes_path, :no_path

end

# 設問集
all_questions = [
  Question.new(1 , false,  "リラックマ好き？", 2, 3),
  Question.new(2 , false,  "ピカチュウよりベトベトンのほうが可愛いと思う", 4, 5),
  Question.new(3 , false,  "お茶の子さいさい？", 5, 6),
  Question.new(4 , false,  "名探偵？", 7, 8),
  Question.new(5 , false,  "マリオなんかよりも土管を愛している", 8, 9),
  Question.new(6 , false,  "実はFカップです", 9, 10),
  Question.new(7 , true ,  "あなたはコナン君タイプです　偶然にも居合わせないでください。", 0, 0),
  Question.new(8 , true ,  "あなたはモグラタイプです　太陽に焼かれて死ねっ！", 0, 0),
  Question.new(9 , true ,  "あなたはゴルゴ１３タイプです　依頼された仕事は必ずこなします", 0, 0),
  Question.new(10, true ,  "あなたはMr2.ボン=クレータイプです　オカマウェイ！", 0, 0)]

####################################################################################################
# 処理ここから

# 設問１からスタート
q_idx = 1
quit = false

# 最初の設問を取り出す
question = all_questions.select{|q| q.no == q_idx }[0]

# quitにtrueが代入されるまで繰り返し
while !quit
  # 設問の表示
  print "--------------------------------------------------------------------------------\n"
  print question.msg 
  print "\nはい   - y\nいいえ - n\n"

  # 回答取得
  ans = Readline.readline('> ')

  # 次の設問を決定
  q_idx = ans == "y" ? question.yes_path : question.no_path
  question = all_questions.select{|q| q.no == q_idx }[0]

  # ゴールなら結果を表示してループ終了
  if question.is_goal
    # 結果を出力
    print "--------------------------------------------------------------------------------\n"
    print question.msg

    # ループ終了
    quit = true
  end
end

