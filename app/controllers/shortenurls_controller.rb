class ShortenurlsController < ApplicationController
	
	def show
		user = User.find_by(slug: params[:slug])
		if user.present?
			@shortenurls = user.shortenurls
			render :json => { success: 1, error: 0, urls: @shortenurls, slug: user.slug }
		else
			render :json => { success: 0, error: 1, errors: ["Invalid Authentication"] }
		end
	end

	def new
		@shortenurl = Shortenurl.new
	end

	def create
		user = User.find_by(slug: params[:slug])
    	if user.present?
    		uu = user.shortenurls.select{|v| v.originalUrl == params[:originalUrl]}
    		if uu.any? && params[:originalUrl] != ""
   				render :json => { success: 0, error: 1, errors: ["You already created a shortener of this URL."]}
   				return;
    		end

    		@shortenurl = Shortenurl.new(name: params[:name], originalUrl: params[:originalUrl], user_id: user.id)

    		if @shortenurl.save
    			key = Array.new(7){rand(36).to_s(36)}.join
    			obj = Shortenurl.find_by(key: key)
    			while obj.present?
    				key = Array.new(7){rand(36).to_s(36)}.join
    				obj = Shortenurl.find_by(key: key)
    			end
    			@shortenurl.update(key: key)

    			render :json => { success: 1, error: 0 }
    		else
    			render :json => { success: 0, error: 1, errors: @shortenurl.errors }
    		end
    	else
    		render :json => { success: 0, error: 1, errors: ["Invalid Authentication"] }
    	end
	end

	private

	def notification_params
		params.permit(:name, :originalUrl, :slug)
	end
end
