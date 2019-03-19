class Startup
  attr_reader :founder, :domain
  attr_accessor :name
  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain

    @@all << self
  end

  def pivot(name, domain)
    Startup.new(name, self.founder, domain)
  end

  def self.find_by_founder(founder)
    @@all.find{|startup|
    startup.founder == founder}
  end

  def self.domains
    @@all.map{|startup|
    startup.domain}
  end

  def sign_contract(vc, type, amount)
    FundingRound.new(self, vc, type, amount)
  end

  def rounds
    FundingRound.all.select{|round|
    round.startup == self}
  end

  def num_funding_rounds
    self.rounds.length
  end

  def total_funds
    funds = 0
    self.rounds.each{|round|
        funds += round.investment}
    funds
  end

  def investors
    self.rounds.map{|rounds|
    rounds.vc}.uniq
  end

  def big_investors
    self.investors.select{|vc|
    VentureCapitalist.tres_commas_club.include?(vc)}
  end


  def self.all
    @@all
  end

end
