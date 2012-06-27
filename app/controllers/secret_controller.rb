class SecretController < ApplicationController

    #Limited error checking in thie controller

    def view
        @secret = Secret.find params[:id]
    end

    def create
        @secret = Secret.new
    end

    def post_create
        @secret = Secret.new params[:secret]
        if @secret.valid?
            @secret.save
            flash[:notice] = "Save successful"
            redirect_to :action => :view, :id => @secret.id
        else
            # If you want to display the page with the same URL, you'll need to redirect here
            render :action => :create
        end
    end


    # Note: anyone can edit this, so it's not secure
    def edit
        @secret = Secret.find params[:id]
    end

    def post_edit
        @secret = Secret.find params[:id]
        if @secret.update_attributes params[:secret]
            redirect_to :action => :view, :id => @secret.id
        else
            render :action => :edit
        end
    end

end
