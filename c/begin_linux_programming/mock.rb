class PromotedDistributor < ActiveRecord::Base
  has_many :promotions
end

class OpenfeintDistributor < PromotedDistributor
  class << self
    # this will determine asset upload step
    def assets
      [["Banner", "display banner for openfeint"],["30x30 asset","display in blabla"]]
    end

    # application or channels within Openfeint
    def channels
      [
        ["Spotlight","/distributor/openfeint/spotlight"],
        ["GameChannel","/distributor/openfeint/game_channel"],
        ["Embedded","/distributor/openfeint/embeded"]
      ]
    end
  end
end

class AttDistributor < PromotedDistributor
  class << self
    # this will determine asset upload step
    def assets
      [["Att Banner", "display banner for AT&T"],["20x20 asset","display in blabla"], ["100x100","display in blabla"]]
    end

    # application or channels within Openfeint
    def channels
      [["Gameworld","/distributor/att/game_world"]]
    end
  end
end


class DistributionRequest < ActiveRecord::Base
end

class DistributionAsset < ActiveRecord::Base
  belongs_to :distribution_request
end
