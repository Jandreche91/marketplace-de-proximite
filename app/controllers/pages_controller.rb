class PagesController < ApplicationController
  def home
    @courgettes = Courgette.all.sample(3)
  end
end
