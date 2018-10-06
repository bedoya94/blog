class UsuarioMailer < ApplicationMailer
    def bienvenidos_email
        @user = params[:usuario]
        @url =  'http://example.com/login'

        attachments['imagen.jpg'] = File.read('app/to/imagen.jpg')
        mail(to: @user.email, subject: 'Bienvenido')
    end
end
