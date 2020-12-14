class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :products

  self.data = [
      {id: 1, name: '--'},{id: 2, name: 'シャネル'}, {id: 3, name: 'グッチ'}, {id: 4, name: 'ヴィトン'},
      {id: 5, name: 'ナイキ'}, {id: 6, name: 'アディダス'}, {id: 7, name: 'プーマ'},
      {id: 8, name: 'ブリーズ'}, {id: 9, name: 'マールマール'}, {id: 10, name: 'ユナイテッドアローズ'},
      {id: 11, name: 'ユニクロ'}, {id: 12, name: '無印良品'}, {id: 13, name: 'アバクロ'},
      {id: 14, name: 'H＆M'}, {id: 15, name: '岩波新書'}, {id: 16, name: '小学館'},
      {id: 17, name: 'パナソニック'}, {id: 18, name: 'HITACHI'}, {id: 19, name: '東芝'},
      {id: 20, name: '邦楽'}, {id: 21, name: '洋楽'}, {id: 22, name: 'K-POP'},
      {id: 23, name: 'クラシック'}, {id: 24, name: 'JASS'}, {id: 25, name: 'アニソン'},
      {id: 26, name: 'ダーバン'}, {id: 27, name: 'ラルフローレン'}, {id: 28, name: 'ダンヒル'},
      {id: 29, name: 'チフォネリ'}, {id: 30, name: 'ニューヨーカー'}, {id: 31, name: 'その他'}
  ]
end