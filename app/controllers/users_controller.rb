#USER AND CREATE FUNCTONS ARE FOR NEW USERS/SIGNUP
#USERCREATE AND USERNEW FUNCTIONS ARE FOR EXISTING USERS/LOGIN
#/USERS/ IS FOR USER-LOGIN AND SIGNUP
#FOR AUTHENTICATION MAKE CHANGES IN CREATE AND USERCREATE METHOD I AM NOT SURE WHETHER MAKING CHANGES IN HOME METHOD WILL PRINT USER LOGGED IN INFORMATION
#DO CHECK RAILS ROUTES
class UsersController<ApplicationController
   def home
      
   end
  
   def new
      @user=User.new
   end
  
   def create
     @user=User.new(user_params)
     if @user.save
      session[:user_id]=@user.id
        redirect_to @user, notice:"Successfully created account"
     else
        render :new
     end      
   end
   
   def show
     @user = User.find(params[:id])
     @businfos=Businfo.all
     BusinfoUser.where("user_id = ?", params[:id])
     @sortbusinfos=Businfo.all
   end
   
   def usernew
     
   end
    
    def usercreate
     @user=User.find_by(email: params[:email])
      
     if @user.present?
        redirect_to @user, notice: "Logged In Successfully"
        session[:user_id]=@user.id
     else
        flash[alert]="Invalid email or password"
        render :usernew ,notice: "Inavlid email or password"
     end      
    end
  
    def booking
     @user=User.find(params[:user_id])
     @businfo=Businfo.find(params[:businfo_id])
      
    end
    
    

    def destroy
      puts "......>"+params.to_s
      @user=User.find(params[:user_id])
      @busticket = BusinfoUser.find_by(params[:id])
      @businfo=Businfo.find(params[:businfo_id])
      @busticket.destroy
       @businfo.update(Availableseats: @businfo.Availableseats+1)
         redirect_to @user
         waitListusers=WaitList.where("businfo_id = ?", params[:businfo_id])
         msg="Dear Customer, Hurry up and check the avalability for the bus which you had enquired, from "+@businfo.Source+" to "+@businfo.Destination
         
         waitListusers.each do |n|
            wluser=User.find(n.user_id)
            phone = '+91'+ wluser.phone.to_s
            TwilioClient.new.sendSMS(phone,msg)
            n.destroy
         end
      end


      
   def searchbus

      @user = User.find(params[:id])
      @businfos=Businfo.all
      
      

      if params[:source].length >0 && params[:destination].length >0
         @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE '%"+params[:source]+"%' AND Destination LIKE '%"+params[:destination]+"%'")
         if params[:time]=='1' && params[:fare]=='1'
            @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE '%"+params[:source]+"%' AND Destination LIKE '%"+params[:destination]+"%' order by Price,Time_taken")
            # @businfos= Businfo.order(Price: :asc,Time_taken: :asc)
            
         elsif params[:time]=='1'
            @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE '%"+params[:source]+"%' AND Destination LIKE '%"+params[:destination]+"%' order by Time_taken")
            # @businfos= Businfo.order(Time_taken: :asc)
            
         elsif params[:fare]=='1'
            @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE '%"+params[:source]+"%' AND Destination LIKE '%"+params[:destination]+"%' order by Price")
            # @businfos= Businfo.order(Price: :asc)
            
         end
        
      elsif params[:source].length >0
         @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE "+"'%"+params[:source]+"%'")
         
         if params[:time]=='1' && params[:fare]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE "+"'%"+params[:source]+"%' order by Price,Time_taken")
            
         elsif params[:time]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE "+"'%"+params[:source]+"%' order by Time_taken")
            puts "only time.." 
         elsif params[:fare]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Source LIKE "+"'%"+params[:source]+"%' order by Price")
            puts "only fare..." 
         end
         puts "ssss..." 
      elsif params[:destination].length >0
         @sortbusinfos=Businfo.find_by_sql("SELECT * FROM businfos where Destination LIKE "+"'%"+params[:destination]+"%' order by Price,Time_taken")
         
         if params[:time]=='1' && params[:fare]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Destination LIKE "+"'%"+params[:destination]+"%' order by Price,Time_taken")
            puts "both..." 
         elsif params[:time]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Destination LIKE "+"'%"+params[:destination]+"%' order by Time_taken")
            puts "only time.." 
         elsif params[:fare]=='1'
            @sortbusinfos= Businfo.find_by_sql("SELECT * FROM businfos where Destination LIKE "+"'%"+params[:destination]+"%' order by Price")
            puts "only fare..." 
         end
         puts "ddd.." 
      elsif
         if params[:time]=='1' && params[:fare]=='1'
            @sortbusinfos= Businfo.order(Price: :asc,Time_taken: :asc)
            puts "both..." 
         elsif params[:time]=='1'
            @sortbusinfos= Businfo.order(Time_taken: :asc)
            puts "only time.." 
         elsif params[:fare]=='1'
            @sortbusinfos= Businfo.order(Price: :asc)
            puts "only fare..." 
         else
            @sortbusinfos=Businfo.all
         end
      end
   
      render :show

   end

   def bookinghistory
      @user = User.find(params[:id])
      @businfos=Businfo.all
      @businfousers = BusinfoUser.where("user_id = ?", params[:id])
   end

   def destroyusersession
		session[:user_id]=nil
		redirect_to root_path, notice:"Logged out"
	end

  
   private
   def user_params
     params.require(:user).permit(:email, :password, :phone, :name)
   end
  

  
end  