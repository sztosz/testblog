class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false

  validates_presence_of :body, :title

  belongs_to :user
  has_many :comments

  default_scope ->{ ne(archived: true) }

  def archive!
    update_attribute :archived, true
  end

  def hotness
    time_delta = ((Time.current - self.created_at).to_i / 3600).to_i
    if time_delta <= 24
      hotness_based_on_votes + 3
    elsif 24 < time_delta && time_delta < 72  # damn it, why i can't just do elsif 24 < time_delta < 72 like in python?
      hotness_based_on_votes + 2
    elsif 72 <= time_delta && time_delta <= 168
      hotness_based_on_votes + 1
    else
      hotness_based_on_votes
    end
  end

  def hotness_based_on_votes
    if self.comments.count >= 3
      1
    else
      0
    end
  end

end
