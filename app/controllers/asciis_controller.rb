class AsciisController < ApplicationController
  def new
    render "new"
  end

  def create
    asciifier = Artii::Base.new(:font => "broadway")

    @text = params[:ascii][:user_text]
    @ascii = asciifier.asciify(@text)

    render "result"
  end
end
