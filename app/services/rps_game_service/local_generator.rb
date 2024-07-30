module RpsGameService
  class LocalGenerator
    def call
      Rails.logger.info("Using local generator")
      [:rock, :paper, :scissors, :hammer].sample
    end
  end
end
