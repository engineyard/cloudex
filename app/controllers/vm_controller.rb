class VmController < ApplicationController
  def index
     # Vm.load_vms
   end

   def show
       
       @vm = Rails.cache.read( params[:name] )

     unless @vm
       render  :nothing => true , :status => 404 
     else

       respond_to do |format|
          format.html 
          format.json { render :json => @vm.to_json }
       end
     end
   end

end
