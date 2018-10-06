class ArticulosController < ApplicationController
http_basic_authenticate_with name: "nasugo", password: "JEPA", except: [:index, :show]
  def index
      @articulos = Articulo.all
  end
  def show
    #id le dice a rails que esta ruta espera un parámetro: id, que en nuestro caso será el id del artículo.

      @articulo = Articulo.find(params[:id])
    end

  def new
     @articulo = Articulo.new
  end

  def edit
    session[:articuloID] = params[:id]
    @articulo = Articulo.find(params[:id])
  end

  def create
  # cada modelo de Rails se puede inicializar con sus respectivos atributos,
  # que se asignan automáticamente a las columnas de la base de datos respectivas.
  # En la primera línea hacemos justamente eso (recuerde que params [: article] contiene los atributos
  # que nos interesan). Entonces, @ article.save es responsable de guardar el modelo en la base de datos.
  #Finalmente, redirigimos al usuario a la acción de mostrar, que definiremos más adelante.
    @articulo = Articulo.new(articulo_params)
# retorna un boolean indicando si fue creado o no.

    if @articulo.save
        flash[:notice] = "Articulo creado correctamente"
        redirect_to @articulo
      else
        flash[:error] = "No pudo crear articulo"
        render 'new'
      end
      
  end

  def update
  #  @articulo = Articulo.find(params[:id])
    @articulo = Articulo.find(session[:articuloID])
    session.delete(:articuloID)
    if @articulo.update(articulo_params)
      redirect_to @articulo
    else
      render 'edit'
    end
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    redirect_to articulos_path
  end

  private
    def articulo_params
      params.require(:articulo).permit(:title, :text)
    end

end
