class Secret < ActiveRecord::Base
  validates_numericality_of :secret
  
  # Note: this is not secure without a salt, since someone could
  # brute force the SHA1 of a lot of different numbers

  def value
    if show_secret
        secret
    else
        Digest::SHA1.hexdigest secret
    end
  end
end
