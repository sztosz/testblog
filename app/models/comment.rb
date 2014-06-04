class Comment

  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :vote_value, type: Integer
  field :abusive, type: Boolean, default: false
  field :abusive_override, type: Boolean, default: false

  validates_presence_of :body

  belongs_to :user
  belongs_to :post
  has_many :votes, after_add: :mark_abusive

  def mark_abusive(v)
    if self.abusive_override
    else
      vote_value = 0
      self.votes.each { |vote| vote_value += vote.value }
      if vote_value <= -3
        self.abusive = true
      end
    end
  end

end
