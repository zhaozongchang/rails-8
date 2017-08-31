class GroupsController < ApplicationController
  before_action :authenticate_user! , only: [:new， :create]
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to groups_path, notice: "更新成功"
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, alert: "删除成功"
  end



  private

  def group_params
    params.require(:group).permit(:title, :description)
  end
end
