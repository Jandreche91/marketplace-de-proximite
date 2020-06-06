class PagesController < ApplicationController
  def home
    @courgettes = Courgette.first(3)
  end
end
