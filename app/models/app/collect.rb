class App::Collect < Post
  before_create :add_type
  before_validation :calcul_remaining, only: [:save, :update]
  default_scope { where(mark: Post::marks[:collecte]) }

  private
  def add_type
    mark = Post::marks[:collecte]
  end

  def calcul_remaining
    self.remaining_amount = searched_amount - find_amount
  end
end