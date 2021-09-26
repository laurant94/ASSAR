class App::Event < Post
  before_create :add_type
  default_scope { where(mark: Post.marks[:event]) }

  # private
  def add_type
    mark = Post.marks[:event]
  end
end