class Place < ActiveRecord::Base
  TYPES = {
    1: "4人以下的聚会",
    2: "4-10人的聚会",
    3: "20人以下的活动",
    4: "50人以下的活动"
  }
end
