class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
 
  def index; end

  def report
        
  end
end
