#redirect to a particular bus owner
class BusinfosController < ApplicationController
    
    def create
      puts businfo_params
      @busowner = Busowner.find(params[:busowner_id])
        @businfo = @busowner.businfos.new(businfo_params)
        @businfo.save
        redirect_to busowner_path(@busowner)
      end
    
      def edit
        @busowner = Busowner.find(params[:busowner_id])
        @businfo = @busowner.businfos.find(params[:id])
      end
    
      def update
        @busowner = Busowner.find(params[:busowner_id])
        @businfo = @busowner.businfos.find(params[:id])
         if @businfo.update(businfo_params)
          redirect_to @busowner
          else
            render :edit
          end
        
      end
      


      private
        def businfo_params
            params.require(:businfo).permit(:Bus_Number, :Bus_Name, :Source, :Destination, :Number_Of_Seats,:Price, :Date, :Time, :Time_taken,:Distance, :Remaining_Seats, :Availableseats)
        end
end
