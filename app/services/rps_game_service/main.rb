module RpsGameService
  class Main
    attr_accessor :user_bet

    RULE_SET = {
      rock: [:scissors, :hammer],
      paper: [:rock],
      scissors: [:paper],
      hammer: [:scissors, :paper]
    }

    def initialize(user_bet:)
      @user_bet = user_bet.to_sym
    end

    def result
      return :user if RULE_SET[user_bet].include? generated_bet
      return :server if RULE_SET[generated_bet].include? user_bet

      :tie
    end

    def generated_bet
      @generated_bet ||= if remote_service.available?
                           remote_service.call
                         else
                           local_generator.call
                         end
    end

    def local_generator
      @local_generator ||= LocalGenerator.new
    end

    def remote_service
      @remote_service ||= RemoteService.new
    end
  end
end
