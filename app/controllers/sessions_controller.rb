# encoding: utf-8

class SessionsController < ApplicationController
	def new
		if signed_in?
			redirect_to current_user
		else

		end
	end

	def create
		user=User.find_by(email: params[:session][:email].downcase)
		if user
			if user.authenticate(params[:session][:password]) && (params[:session][:remember]=='1')
				sign_in user
				redirect_to user
			elsif user.authenticate(params[:session][:password]) && (params[:session][:remember]=='0')
			    sign_in_for_now user
			    redirect_to user
			else	
				flash.now[:error]="用户名/密码不匹配"
				render 'new'
			end
		else 
			flash.now[:error]="用户不存在"
			render 'new'
		end
	end


	def destroy
		sign_out
		redirect_to root_path
	end
end
