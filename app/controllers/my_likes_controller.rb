class MyLikesController < ApplicationController
  def index
    @my_likes = MyLike.all

    render("my_likes/index.html.erb")
  end

  def show
    @my_like = MyLike.find(params[:id])

    render("my_likes/show.html.erb")
  end

  def new
    @my_like = MyLike.new

    render("my_likes/new.html.erb")
  end

  def create
    @my_like = MyLike.new


    save_status = @my_like.save

    if save_status == true
      redirect_to("/my_likes/#{@my_like.id}", :notice => "My like created successfully.")
    else
      render("my_likes/new.html.erb")
    end
  end

  def edit
    @my_like = MyLike.find(params[:id])

    render("my_likes/edit.html.erb")
  end

  def update
    @my_like = MyLike.find(params[:id])


    save_status = @my_like.save

    if save_status == true
      redirect_to("/my_likes/#{@my_like.id}", :notice => "My like updated successfully.")
    else
      render("my_likes/edit.html.erb")
    end
  end

  def destroy
    @my_like = MyLike.find(params[:id])

    @my_like.destroy

    if URI(request.referer).path == "/my_likes/#{@my_like.id}"
      redirect_to("/", :notice => "My like deleted.")
    else
      redirect_to(:back, :notice => "My like deleted.")
    end
  end
end
