# French SIRET numbers validation and generation as described here:
# http://fr.wikipedia.org/wiki/Système_d’identification_du_répertoire_des_établissements#Calcul_et_validit.C3.A9_d.27un_num.C3.A9ro_SIRET
module Siret
  extend self
  
  REGEXP = /^\d{14}$/
  SIREN_PATTERN = "%012d".freeze
  SIREN_MAX = 10 ** 11
  
  def checksum(siret)
    result = 0
    digits(siret).each_slice(2) do |a, b|
      result += sum(digits(a * 2)) + b
    end
    result
  end
  
  def valid?(siret)
    if siret.to_s =~ REGEXP
      (checksum(siret) % 10).zero?
    else
      false
    end
  end
  
  def generate
    siren = generate_siren
    nic = generate_nic(siren)
    "#{siren}#{nic}"
  end
  
  def generate_siren
    SIREN_PATTERN % rand(SIREN_MAX)
  end
  
  def generate_nic(siren)
    rest = 10 - checksum(siren) % 10
    a = rest / 3
    b = rest > 2 ? rest - 2 * a : rest
    "#{a}#{b}"
  end
  
  private
    def digits(number)
      number.to_s.split("").collect { |digit| digit.to_i }
    end
    
    def sum(array)
      array.inject(0) { |result, n| result + n }
    end
end
