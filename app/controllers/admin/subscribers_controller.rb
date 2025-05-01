class Admin::SubscribersController < Admin::BaseController
    def index
      @subscribers = Subscriber.all.order(created_at: :desc)
    end
  
    def show
      @subscriber = Subscriber.find(params[:id])
    end
  
    def destroy
      @subscriber = Subscriber.find(params[:id])
      @subscriber.destroy
      redirect_to admin_subscribers_path, notice: 'Subscriber was successfully deleted.'
    end
    
    def toggle_active
      @subscriber = Subscriber.find(params[:id])
      @subscriber.update(active: !@subscriber.active)
      redirect_to admin_subscribers_path, notice: "Subscriber #{@subscriber.active ? 'activated' : 'deactivated'} successfully."
    end
  end