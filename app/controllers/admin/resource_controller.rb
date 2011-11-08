class Admin::ResourceController < Admin::ApplicationController
  inherit_resources
  respond_to :html
  self.responder = Admin::Responder

  # Scopes
  has_scope :page,  default: 1, only: 'index'
  has_scope :per_page,   default: 5, only: 'index'
#  has_scope :sort,  using: [:column, :direction]

end