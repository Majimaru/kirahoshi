class LevelSetting < ApplicationRecord
  
  # アクティブレベルに対するしきい値を取得
  def get_thresold(active_level)
    LevelSetting.find_by(level: active_level).thresold
  end
  
end
