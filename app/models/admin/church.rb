class Admin::Church < Church
  default_scope { includes(:setting) }
  
end
