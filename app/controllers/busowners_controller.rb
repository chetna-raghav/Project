#NEW AND CREATE FUNCTONS ARE FOR NEW BUS OWNERS/SIGNUP
#LOGINCREATE AND LOGINNEW FUNCTIONS ARE FOR EXISTING BUSUSERS/LOGIN
#/BUSOWNERS/ IS FOR LOGIN AND SIGNUP
#AUTHENTICATION IS CREATED FOR BUS OWNERS
class BusownersController<ApplicationController
  
    def show
     @busowner = Busowner.find(params[:id])
    end 
 
   def new
     @busowner=Busowner.new
   end  
   def create
    @busowner=Busowner.new(busowner_params)
    if @busowner.save
     session[:busowner_id]=@busowner.id
      redirect_to @busowner, notice: "Successfully created account"
     else
         render :new
     end        
    end
 
    def destroyownersession
      session[:busowner_id]=nil
      redirect_to root_path, notice:"Logged out"
    end

    def loginnew
    end
    
    def logincreate
     busowner=Busowner.find_by(email: params[:email])
     if busowner.present? && busowner.authenticate(params[:password])
       session[:busowner_id]=busowner.id
       redirect_to busowner, notice: "Logged In Successfully"
     else
       render :loginnew
     end
     end 
    
    def busowner_params
    params.require(:busowner).permit(:email,:password,:password_confirmation)
     end
 end    