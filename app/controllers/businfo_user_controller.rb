class BusinfoUserController < ApplicationController
    
    def bookingsuccess
    end  
      
  # def create
  #       @user=User.find(params[:user_id])
  #         @businfo=Businfo.find(params[:businfo_id])
  #       @businfouser = BusinfoUser.new(user_id: params[:user_id],businfo_id:params[:businfo_id])
  #       @businfouser.save
  #        @businfo.update(Availableseats: @businfo.Availableseats-1) 
  #         if Businfo.where("@businfo.Availableseats >?",0)
  #        redirect_to @user
  #       else
  #         render :root_path 
  #       end   
  #     end

       
      def create

        @user=User.find_by(id: params[:user_id])
        @businfo=Businfo.find_by(id: params[:businfo_id])
        puts "xxxxx"+@businfo.Availableseats.to_s+"..................."
        if @businfo.Availableseats < 1
            puts "wllllllllllllllllllll"
            @waitlist = WaitList.new(user_id: params[:user_id],businfo_id:params[:businfo_id])
            @waitlist.save
            render template: "businfo_user/waitlistdetails"

        else
          puts "aaaaaallllllll"
          @businfouser = BusinfoUser.new(user_id: params[:user_id],businfo_id:params[:businfo_id])
          @businfouser.save
          @businfo.update(Availableseats: @businfo.Availableseats-1) 
            # if Businfo.where("@businfo.Availableseats >?",0)
            #   redirect_to @user
            # else
            #   render :root_path 
            # end 
          
            phone = '+91'+ @user.phone.to_s
            msg='Hi your booking for '+@businfo.Destination+' has been confirmed, you have to take bus from ' +
            +@businfo.Source+' on date '+@businfo.Date.to_s+' '+@businfo.Time.to_s +
            +', Bus Number is '+@businfo.Bus_Number.to_s +
            +', Bus Name is '+@businfo.Bus_Name
            render template: "businfo_user/bookingdetails"
          TwilioClient.new.sendSMS(phone,msg)
        end
      end

end
