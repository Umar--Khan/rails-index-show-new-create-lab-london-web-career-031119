class CouponsController < ApplicationController

    def index
        @coupons = Coupon.all
    end

    def show
        @coupon = Coupon.find(params[:id])
    end
    
    def new
        @coupon = Coupon.new
    end

    def edit
        @coupon = Coupon.find(params[:id])
    end

    def create
        @coupon = Coupon.new(post_params(:coupon_code, :store))
        @coupon.save
        redirect_to coupon_path(@coupon)
    end

    private

    def post_params(*args)
        params.require(:coupon).permit(*args)
	end
    
    
end
