class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def search
    #Busqueda Parcial
    if params[:q]
      @blogs = Blog.where('description LIKE ?', "%#{params[:q]}%").order(created_at: :desc)
    else
      @blogs = Blog.all.order(created_at: :desc)
    end
  end
  
  def new
    @blog = Blog.new
  end
  
  def create
    @blog = Blog.new(blog_params)
    respond_to do |format|
        if @blog.save!
          #render nothing: true significa que no abhrá ninguna pagina, que no haga nada
          format.js { render layout: false, notice: "El post fue creado correctamente" }
        else
          format.html { render :new}
          format.json { render json: @blog.errors, status: :unprocessable_entity}
        end
    end
  end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		respond_to do |format|
			if @blog.update!(blog_params)
				format.js {render layout: false, notice: 'El post fue actualizado correctamente'}
			end	
		end
	end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_to do |format|
      format.js { render nothing: true, notice: "El post fue eliminado correctamente" }
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :description)
  end
  

end
