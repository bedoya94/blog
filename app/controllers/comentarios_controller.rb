class ComentariosController < ApplicationController
http_basic_authenticate_with name: "nasugo", password: "JEPA", only: :destroy

  def create
  #  Estamos obteniedo el articulo Xid
   @articulo = Articulo.find(params[:articulo_id])
   #Estamos creando el comentario dentro de articulo
   @comentario = @articulo.comentarios.create(comentario_params)
   #redirigimos a la vista show del articulo
   redirect_to articulo_path(@articulo)
 end

 def destroy
     @articulo = Articulo.find(params[:articulo_id])
     @comentario = @articulo.comentarios.find(params[:id])
     @comentario.destroy
     redirect_to articulo_path(@articulo)
   end

 private
   def comentario_params
     params.require(:comentario).permit(:nombre, :cuerpo)
   end
end
