class VentureCapitalist
  attr_reader :name
  attr_accessor :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth

    @@all << self
  end

  def self.tres_commas_club
    @@all.select{|vc|
    vc.total_worth > 1000000000}
  end

  def offer_contract(startup, type, amount)
    FundingRound.new(startup, self, type, amount)
  end

  def funding_rounds
    FundingRound.all.select{|round|
    round.vc == self}
  end

  def portfolio
    self.funding_rounds.map{|round|
    round.startup}.uniq
  end

  def biggest_investment
    largest_round = nil
    largest_investment = 0
    self.funding_rounds.each{|round|
    if round.investment > largest_investment
      largest_round = round
      largest_investment = round.investment
    end}
    largest_round
  end

  def startups
    self.funding_rounds.map{|round|
    round.startup}
  end

  def startup_w_domain(domain)
    startups_w_domain = self.startups.select{|startup|
    startup.domain == domain}
  end

  def invested(domain)
    investment_in_startups = 0
    self.funding_rounds.each{|round|
    if round.startup.domain == domain
    investment_in_startups += round.investment
    end}
    return investment_in_startups
  end

  def self.all
    @@all
  end

end
