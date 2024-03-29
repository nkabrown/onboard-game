class UsersController < ApplicationController

  def home
  end

  def index
    t = twitter_client
    @tweets = t.user_timeline('NYCodeDesign', {:count => 2})

    @users = User.all.to_a
    @hex_group_1 = @users.shift(4)
    @hex_group_2 = @users.shift(5)
    @hex_group_3 = @users.shift(4)

    @announcements = Announcement.all
  end

  def show
    @user = User.find(params[:id])
    @todos = Todo.all
    @usertodos =  UserTodo.where(user_id: @user.id)
    @project = @user.projects
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to edit_user_path(@user), notice: 'User profile successfully updated.' }
        format.json { respond_with_bip(@user) }
      end
    else
      render :show, alert: 'Sorry - something went wrong.'
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      sign_in @user, :bypass => true
      redirect_to edit_user_path(@user), notice: 'User account successfully updated.'
    else
      render "edit"
    end
  end

  def game
    @user = User.find(params[:id])
       
        render template: 'users/game'
  
    
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password, :email, :fname, :lname, :location, :github_username, :twitter_username, :tumblr_username, :linkedin_username, :goal, :fun_fact, :pre_wdi, :project)
  end

end


