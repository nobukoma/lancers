Trestle.admin(:dashboard) do
  
  before_action only: :import do
    unless current_user&.admin?
      flash[:error] = "Administrator access required."
      redirect_to Trestle.config.path
    end
  end
  
  menu do
    item :dashboard, icon: "fa fa-tachometer"
  end
  
  controller do
    def index
      @user_count = User.count()
      @gig_count = Gig.count()
      @order_count = Order.count()
      @categories_count = Category.count()
    end
  end
end