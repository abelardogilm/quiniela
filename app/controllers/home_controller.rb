class HomeController < ApplicationController

  def index

  end

  def guardar
    params[:valor].each do |key, val|
      i = Item.find(key)
      val.each do |key2, val2|
        eval("i.val" + (key2 == "0" ? "3" : key2 ) + " = " + val2)
      end
      i.save!
    end

    redirect_to root_path, :notice => "Actualizado"

  end
end
