class Admin::UsersController < Admin::AdminController
   
  def reset_password
    @user = User.find(params[:id])
    @user.reset_password!
    
    flash[:notice] = "Uma nova password foi enviada para o utilizador por e-mail."
    redirect_to admin_user_path(@user)
  end
  
  def pending
    @users = User.paginate :all, :conditions => {:state => 'pending'}, :page => params[:page]
    render :action => 'index'
  end
  
  def suspended
    @users = User.paginate :all, :conditions => {:state => 'suspended'}, :page => params[:page]
    render :action => 'index'
  end
  
  def active
    @users = User.paginate :all, :conditions => {:state => 'active'}, :page => params[:page]
    render :action => 'index'
  end
  
  def deleted
    @users = User.paginate :all, :conditions => {:state => 'deleted'}, :page => params[:page]
    render :action => 'index'
  end
  
  def activate
    @user = User.find(params[:id])
    @user.activate!
    redirect_to admin_users_path
  end
  
  def suspend
    @user = User.find(params[:id])
    @user.suspend! 
    redirect_to admin_users_path
  end

  def unsuspend
    @user = User.find(params[:id])
    @user.unsuspend! 
    redirect_to admin_users_path
  end

  def purge
    #check security for this
    #@user = User.find(params[:id])
    #@user.destroy
    redirect_to admin_users_url
  end

  def create
    create!{ admin_users_url }
  end
   
  def update
    update!{ admin_users_url }
  end

  protected 
  def collection
    @users ||= end_of_association_chain.paginate(:all, :page=>params[:page], :order=>sort_order('created_at'))
  end 
end