class App::Collect < Post
  before_create :add_type
  default_scope { where(mark: Post::marks[:collecte]) }

  # private
  def add_type
    mark = Post::marks[:collecte]
  end
end