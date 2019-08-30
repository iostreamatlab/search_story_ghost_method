require 'json'
class SearchStory


AA=[
    {
        "title": "菩萨蛮 其一",
        "paragraphs": [
            "小山重叠金明灭，鬓云欲度香腮雪。",
            "懒起画蛾眉，弄妆梳洗迟。",
            "照花前后镜，花面交 相映。",
            "新帖绣罗襦，双双金鹧鸪。"
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.小山--写女子的隔夜残妆。小山：女子画眉的式样之一。小山重叠：眉晕褪色。金：额黄，在额上涂黄色。金明灭：褪色的额黄明暗不匀。",
            "2.鬓云欲度--鬓发撩乱如云，低垂下来。香腮雪：洁白如雪的香腮。",
            "3.照花--对镜簪花。用前镜、后镜对照以瞻顾后影。",
            "4.双双--罗襦上用金线绣的成双的鹧鸪鸟。反衬自身孤独。"
        ]
    },
    {
        "title": "菩萨蛮 其二",
        "paragraphs": [
            "水晶帘里玻璃枕，暖香惹梦鸳鸯锦。",
            "江上柳如烟，雁飞残月天。",
            "藕丝秋色浅，人胜参差剪。",
            "双鬓隔香红，玉钗头上风。"
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.鸳鸯锦--绣有鸳鸯图案的锦被。",
            "2.藕丝--写女子衣裳的颜色。",
            "3.人胜--人形首饰。古代风俗于正月七日（人日）剪彩为人形，戴在头上。",
            "4.香红--指花。",
            "5.风--因走动而生风。"
        ]
    },
    {
        "title": "菩萨蛮 其三",
        "paragraphs": [
            "蕊黄无限当山额，宿妆隐笑纱窗隔。",
            "相见牡丹时，暂来还别离。",
            "翠钗金作股，钗上蝶双舞。",
            "心事竟谁知，月明花满枝。"
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.蕊黄--形容女子的黄额妆。",
            "2.宿妆--宿妆：隔夜妆。",
            "3.隐笑--浅笑。",
            "4.牡丹时--牡丹开花的时节，即暮春。",
            "5.暂--一时。指时间短。"
        ]
    },
    {
        "title": "菩萨蛮 其四",
        "paragraphs": [
            "翠翘金缕双鸂鶒，水纹细起春池碧。",
            "池上海棠梨，雨晴红满枝。",
            "绣衫遮笑靥，烟草粘飞蝶。",
            "青琐对芳菲，玉关音信稀。"
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.鸂鶒--水鸟，又名紫鸳鸯。",
            "2.海棠梨--一种果树，二月开红花。",
            "3.笑靥--笑时出现的酒窝。",
            "4.烟草--草色如烟。指春草茂盛的样子。",
            "5.青琐--门窗上雕刻着花格，涂成青色。",
            "6.玉关--玉门 关。故址在今甘肃省敦煌西北。此处代指边关。"
        ]
    },
    {
        "title": "菩萨蛮 其五",
        "paragraphs": [
            "杏花含露团 香雪，绿杨陌上多离别。",
            "灯在月胧明，觉来闻晓莺。",
            "玉钩褰翠幕，妆浅旧眉薄。",
            "春梦正关情，镜中蝉鬓轻。 "
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.月胧明--月色朦胧。",
            "2.褰--读(qian1),提起，挂起。",
            "3.关情--涉及、牵连别后的情思。"
        ]
    },
    {
        "title": "菩萨蛮 其六",
        "paragraphs": [
            "玉楼明月长相忆，柳丝袅娜春无力。",
            "门外草萋萋，送君闻马嘶。",
            "画罗金翡翠，香烛消成泪。",
            "花落子规啼，绿窗残梦迷。"
        ],
        "author": "温庭筠",
        "rhythmic": "菩萨蛮",
        "notes": [
            "1.玉楼--闺楼的美称。",
            "2.袅娜--轻柔细长的样子。",
            "3.草萋萋-春草茂盛的样子。此处借春草起兴，比喻思远怀人的意绪。",
            "4.画罗--罗帷上画有金色的翡翠鸟。翡翠鸟：即翠鸟。",
            "5.子规--杜鹃鸟，其叫声如“不如归去”。",
            "6.绿窗--此处代指闺人居室。"
        ]
    }
]

  MSGS = {
    :dance => AA[1][:paragraphs].map { |i| i.to_s }.join(" "),
    :poo => AA[2][:paragraphs].map { |i| i.to_s }.join(" "),
    :laugh => AA[3][:paragraphs].map { |i| i.to_s }.join(" "),
  }

  def initialize(name)
    @name = name
  end

  def can(*args, &block)
    meta = class << self; self end
    meta.class_eval do
      args.each do |arg|
        define_method(arg) { MSGS[arg] }
      end
    end
  end

  def method_missing(sym)
    key_word = "heart"
    if sym.match(/^#{key_word}/)
      puts AA[0][:paragraphs].map { |i| i.to_s }.join(" ")
    else
      puts AA[5][:paragraphs].map { |i| i.to_s }.join(" ")
    end
  end

  def inspect
    puts self.methods
  end
end

cc=SearchStory.new('元曲')
p cc.can :dance,:poo,:laugh
p cc.methods
p cc.singleton_methods
p cc.instance_variables
p cc.dance
p cc.poo
p cc.laugh
p cc.hea


