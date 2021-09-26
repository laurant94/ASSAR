class App::Post < Post
  before_create :add_type
  default_scope { where(mark: Post.marks[:post]) }

  # private
  def add_type
    mark = Post.marks[:post]
  end
end
