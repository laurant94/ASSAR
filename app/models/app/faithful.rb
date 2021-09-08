class App::Faithful < User
  attr_accessor :child_id
  after_create :generate_matricule

  private
  def generate_matricule
    self.update_columns(matricule: "#{id}")
  end
end